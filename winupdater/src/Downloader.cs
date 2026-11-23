using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Threading;

namespace Vantage.WinUpdater
{
    /// <summary>
    /// Network layer. Uses the system curl.exe (Windows 10 1803+) because the
    /// WinINet stack can hang on some TLS/proxy configurations.
    ///
    /// Large downloads are split into HTTP Range segments and fetched in
    /// parallel (same idea as OfficeGO): the CDN often throttles a single
    /// connection, while several connections scale almost linearly. If range
    /// support is missing or a segment keeps failing, the download falls back
    /// to a single connection.
    /// </summary>
    internal static class Downloader
    {
        private const long SegmentedThresholdBytes = 8L * 1024 * 1024;
        private const long MinChunkBytes = 8L * 1024 * 1024;
        private const int MaxChunkAttempts = 3;
        private const int MaxThreads = 8;

        public static string FetchText(string url, out string error)
        {
            string file = TempFile("json");
            int code = RunCurl(
                "-sS -L -f --ssl-no-revoke --connect-timeout 30 --max-time 3600 -o \"" + file + "\" \"" +
                AppendCacheBuster(url) + "\"", out error);
            bool ok = code == 0;
            try
            {
                if (!ok || !File.Exists(file))
                    return null;
                return File.ReadAllText(file, Encoding.UTF8);
            }
            catch
            {
                return null;
            }
            finally
            {
                Native.TryDelete(file);
            }
        }

        /// <summary>
        /// Downloads url to destination. <paramref name="progress"/> receives
        /// (bytesDownloaded, totalBytes); totalBytes is 0 when unknown.
        /// </summary>
        public static bool DownloadFile(string url, string destination, int threads,
                                        Action<long, long> progress, out string error)
        {
            error = null;

            if (threads < 1) threads = 1;
            if (threads > MaxThreads) threads = MaxThreads;

            long size;
            bool supportsRanges;
            Probe(url, out size, out supportsRanges);

            if (size >= SegmentedThresholdBytes && supportsRanges && threads > 1)
            {
                string segmentError;
                if (TrySegmented(url, destination, size, threads, progress, out segmentError))
                    return true;

                Native.TryDelete(destination);
                // Fall through to the single-connection download.
                error = segmentError;
            }

            bool ok = RunCurlDownload(url, destination, size, progress, out error);
            if (!ok && string.IsNullOrEmpty(error))
                error = "Download failed.";
            return ok;
        }

        // ---------------------------------------------------------------- probe

        private static void Probe(string url, out long size, out bool supportsRanges)
        {
            size = 0;
            supportsRanges = false;

            string headerFile = TempFile("hdr");
            string bodyFile = TempFile("body");

            try
            {
                string error;
                RunCurl("-sS -L -I --ssl-no-revoke --connect-timeout 15 --max-time 30 -D \"" +
                        headerFile + "\" -o \"" + bodyFile + "\" \"" + url + "\"", out error);
                ParseHeaders(headerFile, out size, out supportsRanges);

                if (size <= 0 || !supportsRanges)
                {
                    Native.TryDelete(headerFile);
                    RunCurl("-sS -L --ssl-no-revoke --connect-timeout 15 --max-time 30 --max-filesize 4096 " +
                            "-r 0-0 -D \"" + headerFile + "\" -o \"" + bodyFile + "\" \"" + url + "\"", out error);
                    ParseHeaders(headerFile, out size, out supportsRanges);
                }
            }
            catch
            {
                // Size/range probing is best effort; the caller falls back to
                // a plain single-connection download.
            }
            finally
            {
                Native.TryDelete(headerFile);
                Native.TryDelete(bodyFile);
            }
        }

        private static void ParseHeaders(string path, out long size, out bool supportsRanges)
        {
            size = 0;
            supportsRanges = false;

            long contentLength = 0;
            long contentRangeTotal = 0;
            int status = 0;

            try
            {
                if (!File.Exists(path))
                    return;

                foreach (string rawLine in File.ReadAllLines(path))
                {
                    string line = rawLine.Trim();
                    if (line.Length == 0)
                        continue;

                    if (line.StartsWith("HTTP/", StringComparison.OrdinalIgnoreCase))
                    {
                        // New response block (redirects): reset per-response values.
                        contentLength = 0;
                        int space = line.IndexOf(' ');
                        int code;
                        if (space > 0 && int.TryParse(line.Substring(space + 1, Math.Min(3, line.Length - space - 1)), out code))
                            status = code;
                        continue;
                    }

                    int colon = line.IndexOf(':');
                    if (colon <= 0)
                        continue;
                    string name = line.Substring(0, colon).Trim();
                    string value = line.Substring(colon + 1).Trim();

                    if (name.Equals("content-length", StringComparison.OrdinalIgnoreCase))
                    {
                        long parsed;
                        if (long.TryParse(value, out parsed))
                            contentLength = parsed;
                    }
                    else if (name.Equals("content-range", StringComparison.OrdinalIgnoreCase))
                    {
                        // "bytes 0-0/89312205"
                        int slash = value.LastIndexOf('/');
                        long parsed;
                        if (slash >= 0 && long.TryParse(value.Substring(slash + 1).Trim(), out parsed))
                            contentRangeTotal = parsed;
                    }
                    else if (name.Equals("accept-ranges", StringComparison.OrdinalIgnoreCase))
                    {
                        if (value.Equals("bytes", StringComparison.OrdinalIgnoreCase))
                            supportsRanges = true;
                    }
                }

                if (status == 206)
                    supportsRanges = true;

                size = contentRangeTotal > 0 ? contentRangeTotal : contentLength;
            }
            catch
            {
                // ignore malformed header files
            }
        }

        // ------------------------------------------------------------ segmented

        private static bool TrySegmented(string url, string destination, long size, int threads,
                                         Action<long, long> progress, out string error)
        {
            error = null;

            long chunkSize = Math.Max(MinChunkBytes, (size + threads - 1) / threads);
            int chunkCount = (int)((size + chunkSize - 1) / chunkSize);
            int workerCount = Math.Min(threads, chunkCount);
            if (workerCount < 2)
                return false;

            string[] parts = new string[chunkCount];
            for (int i = 0; i < chunkCount; i++)
            {
                parts[i] = destination + ".part" + i;
                Native.TryDelete(parts[i]);
            }

            Native.TryDelete(destination);

            int nextIndex = -1;
            int failedFlag = 0;
            string lastError = null;
            object errorLock = new object();

            var workers = new Thread[workerCount];
            for (int w = 0; w < workerCount; w++)
            {
                workers[w] = new Thread(() =>
                {
                    while (true)
                    {
                        if (Interlocked.CompareExchange(ref failedFlag, 0, 0) != 0)
                            return;

                        int index = Interlocked.Increment(ref nextIndex);
                        if (index >= chunkCount)
                            return;

                        long start = index * chunkSize;
                        long end = Math.Min(size - 1, start + chunkSize - 1);
                        long expected = end - start + 1;
                        bool ok = false;

                        for (int attempt = 1; attempt <= MaxChunkAttempts && !ok; attempt++)
                        {
                            Native.TryDelete(parts[index]);
                            string attemptError;
                            int code = RunCurl(BuildRangeArguments(url, start, end, parts[index], expected),
                                               out attemptError);

                            if (code == 0 && File.Exists(parts[index]))
                            {
                                long length = new FileInfo(parts[index]).Length;
                                if (length == expected)
                                    ok = true;
                                else
                                    attemptError = "segment " + index + ": got " + length + " of " + expected + " bytes";
                            }
                            else if (string.IsNullOrEmpty(attemptError))
                            {
                                attemptError = "segment " + index + ": curl exit code " + code;
                            }

                            if (!ok)
                            {
                                lock (errorLock)
                                    lastError = attemptError;
                                Thread.Sleep(500);
                            }
                        }

                        if (!ok)
                        {
                            Interlocked.Exchange(ref failedFlag, 1);
                            return;
                        }
                    }
                })
                {
                    IsBackground = true,
                    Name = "VantageDownload" + w
                };
            }

            foreach (var worker in workers)
                worker.Start();

            // Report progress until every worker has finished.
            while (true)
            {
                bool alive = false;
                foreach (var worker in workers)
                {
                    if (worker.IsAlive)
                    {
                        alive = true;
                        break;
                    }
                }

                if (progress != null)
                    progress(SumPartSizes(parts), size);

                if (!alive)
                    break;

                Thread.Sleep(300);
            }

            foreach (var worker in workers)
                worker.Join();

            bool failed = Interlocked.CompareExchange(ref failedFlag, 0, 0) != 0;

            if (!failed)
            {
                long total = SumPartSizes(parts);
                if (total != size)
                {
                    failed = true;
                    lock (errorLock)
                        lastError = "segmented download incomplete: " + total + " of " + size + " bytes";
                }
            }

            if (failed)
            {
                DeleteParts(parts);
                error = string.IsNullOrEmpty(lastError) ? "Segmented download failed." : lastError;
                return false;
            }

            try
            {
                using (var output = new FileStream(destination, FileMode.Create, FileAccess.Write,
                                                   FileShare.None, 1024 * 1024))
                {
                    for (int i = 0; i < chunkCount; i++)
                    {
                        using (var input = new FileStream(parts[i], FileMode.Open, FileAccess.Read,
                                                          FileShare.Read, 1024 * 1024))
                        {
                            input.CopyTo(output, 1024 * 1024);
                        }
                        Native.TryDelete(parts[i]);
                    }
                }

                if (new FileInfo(destination).Length != size)
                {
                    Native.TryDelete(destination);
                    error = "Merged file size mismatch.";
                    return false;
                }

                if (progress != null)
                    progress(size, size);
                return true;
            }
            catch (Exception ex)
            {
                DeleteParts(parts);
                Native.TryDelete(destination);
                error = "Could not merge download segments: " + ex.Message;
                return false;
            }
        }

        private static string BuildRangeArguments(string url, long start, long end, string part, long expected)
        {
            return "-sS -L -f --ssl-no-revoke --connect-timeout 30 --max-time 1800 " +
                   "--speed-limit 1024 --speed-time 20 --max-filesize " + (expected + 1) + " " +
                   "-r " + start + "-" + end + " -o \"" + part + "\" \"" + url + "\"";
        }

        private static long SumPartSizes(string[] parts)
        {
            long total = 0;
            foreach (string part in parts)
            {
                try
                {
                    var info = new FileInfo(part);
                    if (info.Exists)
                        total += info.Length;
                }
                catch
                {
                    // file being written; ignore this sample
                }
            }
            return total;
        }

        private static void DeleteParts(string[] parts)
        {
            foreach (string part in parts)
                Native.TryDelete(part);
        }

        // -------------------------------------------------------------- single

        private static bool RunCurlDownload(string url, string destination, long knownSize,
                                            Action<long, long> progress, out string error)
        {
            error = null;
            string errorFile = TempFile("err");

            try
            {
                string arguments = "/c curl.exe -L -sS -f --ssl-no-revoke --connect-timeout 30 --max-time 3600 " +
                                   "-o \"" + destination + "\" \"" + url + "\" 2>\"" + errorFile + "\"";

                var psi = new ProcessStartInfo(Native.ComSpec, arguments)
                {
                    UseShellExecute = false,
                    CreateNoWindow = true,
                    WindowStyle = ProcessWindowStyle.Hidden
                };

                using (var process = Process.Start(psi))
                {
                    if (process == null)
                    {
                        error = "Could not start curl.exe.";
                        return false;
                    }

                    while (!process.WaitForExit(500))
                    {
                        if (progress != null)
                        {
                            try
                            {
                                var info = new FileInfo(destination);
                                if (info.Exists)
                                    progress(info.Length, knownSize);
                            }
                            catch
                            {
                                // ignore transient file access issues
                            }
                        }
                    }

                    if (process.ExitCode != 0)
                    {
                        error = ReadErrorFile(errorFile);
                        Native.TryDelete(destination);
                        return false;
                    }
                }

                if (progress != null)
                {
                    long length = 0;
                    try { length = new FileInfo(destination).Length; } catch { }
                    progress(length, knownSize > 0 ? knownSize : length);
                }

                return File.Exists(destination);
            }
            catch (Exception ex)
            {
                error = ex.Message;
                Native.TryDelete(destination);
                return false;
            }
            finally
            {
                Native.TryDelete(errorFile);
            }
        }

        // -------------------------------------------------------------- helpers

        private static int RunCurl(string curlArguments, out string error)
        {
            // Keep using cmd.exe /c like the previous (working) build: a bare
            // "curl.exe" started directly can fail to resolve on some systems,
            // while cmd always finds the inbox curl in System32.
            error = null;
            string errorFile = TempFile("err");

            try
            {
                string arguments = "/c curl.exe " + curlArguments + " 2>\"" + errorFile + "\"";
                var psi = new ProcessStartInfo(Native.ComSpec, arguments)
                {
                    UseShellExecute = false,
                    CreateNoWindow = true,
                    WindowStyle = ProcessWindowStyle.Hidden
                };

                using (var process = Process.Start(psi))
                {
                    if (process == null)
                    {
                        error = "Could not start cmd.exe.";
                        return -1;
                    }

                    process.WaitForExit();
                    if (process.ExitCode != 0)
                    {
                        error = ReadErrorFile(errorFile);
                        if (string.IsNullOrEmpty(error))
                            error = "curl exit code " + process.ExitCode;
                    }

                    return process.ExitCode;
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return -1;
            }
            finally
            {
                Native.TryDelete(errorFile);
            }
        }

        private static string AppendCacheBuster(string url)
        {
            var random = new Random();
            string separator = url.IndexOf('?') >= 0 ? "&" : "?";
            return url + separator + "i=" + random.Next(1, 1025);
        }

        private static string ReadErrorFile(string path)
        {
            try
            {
                if (!File.Exists(path))
                    return null;
                string text = File.ReadAllText(path).Trim();
                return string.IsNullOrEmpty(text) ? null : text;
            }
            catch
            {
                return null;
            }
        }

        private static string TempFile(string suffix)
        {
            return Path.Combine(Native.TempDir,
                "vantage-" + suffix + "-" + Guid.NewGuid().ToString("N") + ".tmp");
        }

        public static string Sha256(string path)
        {
            try
            {
                using (var sha = SHA256.Create())
                using (var stream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read))
                {
                    byte[] hash = sha.ComputeHash(stream);
                    var builder = new StringBuilder(hash.Length * 2);
                    foreach (byte b in hash)
                        builder.Append(b.ToString("X2"));
                    return builder.ToString();
                }
            }
            catch
            {
                return null;
            }
        }
    }
}
