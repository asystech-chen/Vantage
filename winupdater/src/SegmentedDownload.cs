using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Threading;

namespace Vantage.WinUpdater
{
    /// <summary>
    /// Downloads one file over several HTTP Range connections. Workers pull
    /// chunks from a shared queue; a failed chunk is retried, and a watchdog
    /// aborts the whole attempt when no bytes arrive for a while (a throttled
    /// CDN would otherwise keep eight sockets hanging for minutes).
    /// </summary>
    internal static class SegmentedDownload
    {
        private const long MinChunkBytes = 8L * 1024 * 1024;
        private const int MaxChunkAttempts = 3;
        private const int StallMilliseconds = 90000;

        private sealed class SegmentState
        {
            public string Url;
            public long ChunkSize;
            public long Size;
            public string[] Parts;
            public int NextIndex = -1;
            public int Failed;
            public string LastError;
            public readonly object Sync = new object();
            public readonly System.Collections.Generic.List<HttpWebRequest> Requests =
                new System.Collections.Generic.List<HttpWebRequest>();

            public void Track(HttpWebRequest request)
            {
                lock (Sync)
                    Requests.Add(request);
            }

            public void Untrack(HttpWebRequest request)
            {
                lock (Sync)
                    Requests.Remove(request);
            }

            public void AbortAll()
            {
                HttpWebRequest[] snapshot;
                lock (Sync)
                    snapshot = Requests.ToArray();

                foreach (var request in snapshot)
                {
                    try { request.Abort(); }
                    catch { }
                }
            }
        }

        public static bool Download(string url, string destination, long size, int threads,
                                    Action<long, long> progress, out string error)
        {
            error = null;

            long chunkSize = Math.Max(MinChunkBytes, (size + threads - 1) / threads);
            int chunkCount = (int)((size + chunkSize - 1) / chunkSize);
            int workerCount = Math.Min(threads, chunkCount);
            if (workerCount < 2)
                return false;

            var parts = new string[chunkCount];
            for (int i = 0; i < chunkCount; i++)
            {
                parts[i] = destination + ".part" + i;
                Native.TryDelete(parts[i]);
            }
            Native.TryDelete(destination);

            var state = new SegmentState
            {
                Url = url,
                ChunkSize = chunkSize,
                Size = size,
                Parts = parts
            };

            Diagnostics.Write("segmented start: size=" + size + " threads=" + threads +
                              " chunks=" + chunkCount);

            var workers = new Thread[workerCount];
            for (int i = 0; i < workerCount; i++)
            {
                workers[i] = new Thread(() => RunWorker(state))
                {
                    IsBackground = true,
                    Name = "VantageDownload" + i
                };
                workers[i].Start();
            }

            long lastTotal = -1;
            var stallClock = Stopwatch.StartNew();
            var reportClock = Stopwatch.StartNew();

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

                long total = SumPartSizes(parts);
                if (total > lastTotal)
                {
                    lastTotal = total;
                    stallClock.Restart();
                }
                else if (stallClock.ElapsedMilliseconds >= StallMilliseconds)
                {
                    Diagnostics.Write("segmented stalled at " + total + "/" + size +
                                      " for " + (StallMilliseconds / 1000) + "s, aborting");
                    lock (state.Sync)
                        state.LastError = "no download progress for " + (StallMilliseconds / 1000) + " seconds";
                    Interlocked.Exchange(ref state.Failed, 1);
                    state.AbortAll();
                    break;
                }

                if (progress != null && reportClock.ElapsedMilliseconds >= 300)
                {
                    reportClock.Restart();
                    progress(total, size);
                }

                if (!alive)
                    break;

                Thread.Sleep(150);
            }

            foreach (var worker in workers)
                worker.Join();

            bool failed = Interlocked.CompareExchange(ref state.Failed, 0, 0) != 0;

            if (!failed)
            {
                long total = SumPartSizes(parts);
                if (total != size)
                {
                    failed = true;
                    lock (state.Sync)
                        state.LastError = "segmented download incomplete: " + total + " of " + size + " bytes";
                }
            }

            if (failed)
            {
                DeleteParts(parts);
                Native.TryDelete(destination);
                error = string.IsNullOrEmpty(state.LastError) ? "Segmented download failed." : state.LastError;
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
                Diagnostics.Write("segmented merge: ok");
                return true;
            }
            catch (Exception ex)
            {
                DeleteParts(parts);
                Native.TryDelete(destination);
                error = "Could not merge download segments: " + HttpRequestFactory.Describe(ex);
                return false;
            }
        }

        private static void RunWorker(SegmentState state)
        {
            try
            {
                while (true)
                {
                    if (Interlocked.CompareExchange(ref state.Failed, 0, 0) != 0)
                        return;

                    int index = Interlocked.Increment(ref state.NextIndex);
                    if (index >= state.Parts.Length)
                        return;

                    long start = index * state.ChunkSize;
                    long end = Math.Min(state.Size - 1, start + state.ChunkSize - 1);
                    long expected = end - start + 1;

                    bool ok = false;
                    string lastError = null;

                    for (int attempt = 1; attempt <= MaxChunkAttempts && !ok; attempt++)
                    {
                        Native.TryDelete(state.Parts[index]);
                        string attemptError;
                        ok = DownloadChunk(state, start, end, state.Parts[index], expected, out attemptError);

                        if (!ok)
                        {
                            lastError = attemptError;
                            Diagnostics.Write("segment " + index + " attempt " + attempt +
                                              " failed: " + attemptError);
                            Thread.Sleep(500);
                        }
                    }

                    if (!ok)
                    {
                        lock (state.Sync)
                            state.LastError = lastError;
                        Interlocked.Exchange(ref state.Failed, 1);
                        state.AbortAll();
                        return;
                    }

                    Diagnostics.Write("segment " + index + " ok (" + expected + " bytes)");
                }
            }
            catch (Exception ex)
            {
                lock (state.Sync)
                    state.LastError = HttpRequestFactory.Describe(ex);
                Interlocked.Exchange(ref state.Failed, 1);
                state.AbortAll();
            }
        }

        private static bool DownloadChunk(SegmentState state, long start, long end, string part,
                                          long expected, out string error)
        {
            error = null;
            HttpWebResponse response = null;
            HttpWebRequest request = null;

            try
            {
                request = HttpRequestFactory.Create(state.Url);
                request.Method = "GET";
                request.AddRange(start, end);
                request.Timeout = 15000;
                request.ReadWriteTimeout = 45000;
                state.Track(request);

                response = (HttpWebResponse)request.GetResponse();
                if (response.StatusCode != HttpStatusCode.PartialContent)
                    throw new IOException("server ignored Range (HTTP " + (int)response.StatusCode + ")");

                using (Stream input = response.GetResponseStream())
                using (var output = new FileStream(part, FileMode.Create, FileAccess.Write,
                                                   FileShare.None, 512 * 1024))
                {
                    if (input == null)
                        throw new IOException("No response stream.");

                    byte[] buffer = new byte[512 * 1024];
                    long written = 0;

                    while (true)
                    {
                        int read = input.Read(buffer, 0, buffer.Length);
                        if (read <= 0)
                            break;

                        written += read;
                        if (written > expected)
                            throw new IOException("segment received more than its range");

                        output.Write(buffer, 0, read);
                    }
                }

                long length = new FileInfo(part).Length;
                if (length != expected)
                    throw new IOException("segment got " + length + " of " + expected + " bytes");

                return true;
            }
            catch (Exception ex)
            {
                error = HttpRequestFactory.Describe(ex);
                Native.TryDelete(part);
                return false;
            }
            finally
            {
                if (request != null)
                    state.Untrack(request);
                if (response != null)
                    response.Dispose();
            }
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
                    // file being written; skip this sample
                }
            }
            return total;
        }

        private static void DeleteParts(string[] parts)
        {
            foreach (string part in parts)
                Native.TryDelete(part);
        }
    }
}
