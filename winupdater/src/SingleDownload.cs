using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Threading;

namespace Vantage.WinUpdater
{
    /// <summary>
    /// Single-connection download with resume. Used for small files and as the
    /// fallback when segmented downloading fails. If the connection stalls,
    /// ReadWriteTimeout aborts it and the next attempt resumes with a Range
    /// request (when the server supports it).
    /// </summary>
    internal static class SingleDownload
    {
        private const int MaxAttempts = 3;

        public static bool Download(string url, string destination, long knownSize, bool supportsRanges,
                                    Action<long, long> progress, out string error)
        {
            error = null;

            for (int attempt = 1; attempt <= MaxAttempts; attempt++)
            {
                HttpWebResponse response = null;
                long existing = 0;

                try
                {
                    if (supportsRanges && File.Exists(destination))
                    {
                        existing = new FileInfo(destination).Length;

                        if (knownSize > 0 && existing == knownSize)
                        {
                            if (progress != null)
                                progress(existing, knownSize);
                            return true;
                        }

                        if (knownSize > 0 && existing > knownSize)
                        {
                            Native.TryDelete(destination);
                            existing = 0;
                        }
                    }
                    else
                    {
                        Native.TryDelete(destination);
                    }

                    var request = HttpRequestFactory.Create(url);
                    request.Method = "GET";
                    request.ReadWriteTimeout = 45000;
                    if (existing > 0)
                        request.AddRange(existing);

                    response = (HttpWebResponse)request.GetResponse();

                    if (existing > 0)
                    {
                        if (response.StatusCode != HttpStatusCode.PartialContent)
                            throw new IOException("server ignored resume range (HTTP " +
                                                  (int)response.StatusCode + ")");
                    }
                    else if (response.StatusCode != HttpStatusCode.OK)
                    {
                        throw new IOException("HTTP " + (int)response.StatusCode + " " + response.StatusDescription);
                    }

                    long total;
                    if (knownSize > 0)
                        total = knownSize;
                    else
                        total = response.ContentLength > 0 ? response.ContentLength + existing : 0;

                    using (Stream input = response.GetResponseStream())
                    using (var output = new FileStream(
                        destination,
                        existing > 0 ? FileMode.Append : FileMode.Create,
                        FileAccess.Write, FileShare.None, 1024 * 1024))
                    {
                        if (input == null)
                            throw new IOException("No response stream.");

                        byte[] buffer = new byte[1024 * 1024];
                        long done = existing;
                        var reportClock = Stopwatch.StartNew();

                        while (true)
                        {
                            int read = input.Read(buffer, 0, buffer.Length);
                            if (read <= 0)
                                break;

                            output.Write(buffer, 0, read);
                            done += read;

                            if (progress != null && reportClock.ElapsedMilliseconds >= 300)
                            {
                                reportClock.Restart();
                                progress(done, total);
                            }
                        }
                    }

                    long length = new FileInfo(destination).Length;
                    if (knownSize > 0 && length != knownSize)
                        throw new IOException("downloaded size " + length + " of " + knownSize + " bytes");

                    if (progress != null)
                        progress(length, total > 0 ? total : length);

                    return true;
                }
                catch (Exception ex)
                {
                    error = HttpRequestFactory.Describe(ex);
                    Diagnostics.Write("single download attempt " + attempt + " failed: " + error);

                    if (!supportsRanges ||
                        (error != null && error.IndexOf("ignored resume", StringComparison.OrdinalIgnoreCase) >= 0))
                        Native.TryDelete(destination);
                    else if (!File.Exists(destination))
                        existing = 0;

                    if (attempt < MaxAttempts)
                        Thread.Sleep(1000);
                }
                finally
                {
                    if (response != null)
                        response.Dispose();
                }
            }

            Native.TryDelete(destination);
            return false;
        }
    }
}
