using System;
using System.IO;
using System.Text;
using System.Threading;

namespace Vantage.WinUpdater
{
    /// <summary>
    /// Download entry points. Uses the .NET HTTP stack (HttpWebRequest /
    /// Schannel) — no curl, no cmd. Large files are split into HTTP Range
    /// segments over up to eight parallel connections; stalled or failed
    /// attempts fall back to a resuming single connection.
    ///
    /// Data is always written to "&lt;destination&gt;.partial" and moved into
    /// place only when complete, so a stale locked destination or a killed
    /// process cannot block the next run.
    /// </summary>
    internal static class Downloader
    {
        private const long SegmentedThresholdBytes = 8L * 1024 * 1024;
        private const int MaxThreads = 8;

        public static string FetchText(string url, out string error)
        {
            string file = TempFile("json");
            try
            {
                if (SingleDownload.Download(AppendCacheBuster(url), file, 0, false, null, out error))
                    return File.ReadAllText(file, Encoding.UTF8);

                Diagnostics.Write("native FetchText failed: " + error);
                return null;
            }
            catch (Exception ex)
            {
                error = HttpRequestFactory.Describe(ex);
                return null;
            }
            finally
            {
                Native.TryDelete(file);
            }
        }

        /// <summary>
        /// Downloads url to destination. progress receives
        /// (bytesDownloaded, totalBytes); totalBytes is 0 when unknown.
        /// </summary>
        public static bool DownloadFile(string url, string destination, string partial, int threads,
                                        Action<long, long> progress, out string error)
        {
            error = null;

            if (threads < 1) threads = 1;
            if (threads > MaxThreads) threads = MaxThreads;

            RemoteFileInfo info = HttpProbe.Probe(url);
            Diagnostics.Write("probe: size=" + info.Size + " ranges=" + info.SupportsRanges);

            if (info.Size > 0 && File.Exists(partial))
            {
                long length;
                try { length = new FileInfo(partial).Length; }
                catch { length = 0; }

                if (length == info.Size)
                {
                    if (MoveIntoPlace(partial, destination, out error))
                    {
                        Diagnostics.Write("reused completed partial download");
                        return true;
                    }
                    return false;
                }

                if (length > info.Size)
                    Native.TryDelete(partial);
            }

            if (info.Size >= SegmentedThresholdBytes && info.SupportsRanges && threads > 1)
            {
                string segmentError;
                if (SegmentedDownload.Download(url, partial, info.Size, threads, progress, out segmentError))
                {
                    if (MoveIntoPlace(partial, destination, out error))
                    {
                        Diagnostics.Write("segmented download: ok (" + threads + " threads)");
                        return true;
                    }
                    return false;
                }

                Diagnostics.Write("segmented download failed: " + segmentError);
                error = segmentError;
            }

            if (SingleDownload.Download(url, partial, info.Size, info.SupportsRanges, progress, out error))
            {
                if (MoveIntoPlace(partial, destination, out error))
                {
                    Diagnostics.Write("single download: ok");
                    return true;
                }
                return false;
            }

            Diagnostics.Write("native download failed: " + error);
            return false;
        }

        private static bool MoveIntoPlace(string partial, string destination, out string error)
        {
            error = null;

            for (int attempt = 1; attempt <= 20; attempt++)
            {
                try
                {
                    if (File.Exists(destination))
                        File.Delete(destination);
                    File.Move(partial, destination);
                    return true;
                }
                catch (Exception ex)
                {
                    error = "Could not move the download into place: " + ex.Message;
                    Diagnostics.Write("move attempt " + attempt + " failed: " + ex.Message);
                    Thread.Sleep(500);
                }
            }

            return false;
        }

        internal static string TempFile(string suffix)
        {
            return Path.Combine(Native.TempDir,
                "vantage-" + suffix + "-" + Guid.NewGuid().ToString("N") + ".tmp");
        }

        private static string AppendCacheBuster(string url)
        {
            var random = new Random();
            string separator = url.IndexOf('?') >= 0 ? "&" : "?";
            return url + separator + "i=" + random.Next(1, 1025);
        }
    }
}
