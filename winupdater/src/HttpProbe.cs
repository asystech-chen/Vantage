using System;
using System.Net;

namespace Vantage.WinUpdater
{
    internal sealed class RemoteFileInfo
    {
        public long Size;
        public bool SupportsRanges;
    }

    /// <summary>
    /// Detects file size and Range support. Tries HEAD first (cheap); if the
    /// server/proxy rejects it, falls back to a one-byte ranged GET.
    /// </summary>
    internal static class HttpProbe
    {
        public static RemoteFileInfo Probe(string url)
        {
            var info = new RemoteFileInfo();

            try
            {
                var request = HttpRequestFactory.Create(url);
                request.Method = "HEAD";
                request.Timeout = 20000;
                request.ReadWriteTimeout = 20000;

                using (var response = (HttpWebResponse)request.GetResponse())
                {
                    if (response.ContentLength > 0)
                        info.Size = response.ContentLength;

                    string acceptRanges = response.Headers["Accept-Ranges"];
                    if (!string.IsNullOrEmpty(acceptRanges) &&
                        acceptRanges.IndexOf("bytes", StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        info.SupportsRanges = true;
                    }
                }
            }
            catch
            {
                // HEAD blocked or failed; the ranged GET below is authoritative.
            }

            if (info.Size <= 0 || !info.SupportsRanges)
            {
                HttpWebResponse response = null;
                try
                {
                    var request = HttpRequestFactory.Create(url);
                    request.Method = "GET";
                    request.AddRange(0, 0);
                    request.Timeout = 20000;
                    request.ReadWriteTimeout = 20000;

                    response = (HttpWebResponse)request.GetResponse();

                    if (response.StatusCode == HttpStatusCode.PartialContent)
                    {
                        info.SupportsRanges = true;
                        long total = ParseContentRangeTotal(response.Headers["Content-Range"]);
                        if (total > 0)
                            info.Size = total;
                    }
                    else if (response.StatusCode == HttpStatusCode.OK && response.ContentLength > 0)
                    {
                        // Server ignored Range and wants to send the whole file;
                        // dispose without reading it.
                        info.Size = response.ContentLength;
                    }
                }
                catch
                {
                    // Leave whatever the HEAD request found.
                }
                finally
                {
                    if (response != null)
                        response.Dispose();
                }
            }

            return info;
        }

        internal static long ParseContentRangeTotal(string value)
        {
            if (string.IsNullOrEmpty(value))
                return 0;

            // "bytes 0-0/89312205"
            int slash = value.LastIndexOf('/');
            if (slash < 0)
                return 0;

            long total;
            return long.TryParse(value.Substring(slash + 1).Trim(), out total) ? total : 0;
        }
    }
}
