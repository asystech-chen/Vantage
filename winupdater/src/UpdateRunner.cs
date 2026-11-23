using System;
using System.Diagnostics;
using System.IO;
using System.Threading;

namespace Vantage.WinUpdater
{
    /// <summary>Runs one update check / download / install cycle.</summary>
    internal sealed class UpdateRunner
    {
        private const string VersionApiUrl = "https://asystech.cn/vantage/vd.json";

        private readonly Config _cfg;
        private readonly string _browserPath;
        private readonly string _currentVersion;
        private readonly bool _scheduled;
        private readonly bool _portable;
        private readonly TrayApp _tray;

        private string _newVersion;
        private string _setupFile;

        public UpdateRunner(Config cfg, string browserPath, string currentVersion,
                            bool scheduled, bool portable, TrayApp tray)
        {
            _cfg = cfg;
            _browserPath = browserPath;
            _currentVersion = currentVersion;
            _scheduled = scheduled;
            _portable = portable;
            _tray = tray;
        }

        public int Run()
        {
            try
            {
                return RunCore();
            }
            catch (Exception ex)
            {
                return Fail("Update error: " + ex.Message);
            }
            finally
            {
                Cleanup();
            }
        }

        private int RunCore()
        {
            Status("Checking for new version...");

            string fetchError;
            string json = Downloader.FetchText(VersionApiUrl, out fetchError);
            if (string.IsNullOrEmpty(json) ||
                json.IndexOf("\"version\"", StringComparison.OrdinalIgnoreCase) < 0)
            {
                string message = "Could not connect to the internet.";
                if (!string.IsNullOrEmpty(fetchError))
                    message += Environment.NewLine + fetchError;
                message += Environment.NewLine + "Log: " + Diagnostics.LogFile;
                return Fail(message);
            }

            string architecture = Browser.GetArchitecture(_browserPath);
            ReleaseInfo release = ReleaseInfo.Parse(json, architecture);
            if (release == null || string.IsNullOrEmpty(release.Version))
                return Fail("Could not get version info from the server.");
            if (string.IsNullOrEmpty(release.Url))
                return Fail("Could not find the download URL.");
            if (string.IsNullOrEmpty(release.Sha256))
                return Fail("Could not find the checksum for the downloaded file.");

            _newVersion = release.Version;
            Diagnostics.Write("remote version=" + release.Version + " url=" + release.Url +
                              " sha256=" + release.Sha256);

            string lastUpdateTo = _cfg.GetLog("LastUpdateTo");
            bool newer = IsNewer(release.Version, _currentVersion);
            if (!newer || string.Equals(release.Version, lastUpdateTo, StringComparison.OrdinalIgnoreCase))
            {
                // One-shot run: exit silently when there is nothing to do.
                Status("No new version found.");
                _cfg.SetLastResult("No new version found.");
                _cfg.TouchLastRun();
                return 0;
            }

            Status("New version " + release.Version + " available.");
            if (_scheduled)
                _tray.ShowIcon();

            // Unique final name per run: a leftover stalled download (or an
            // antivirus scanner) may hold the canonical file, and renaming
            // over a locked file fails. The .partial download is stable per
            // version so interrupted runs can still resume.
            string unique = Guid.NewGuid().ToString("N").Substring(0, 8);
            _setupFile = Path.Combine(_cfg.WorkDir,
                "Vantage-" + release.Version + "-" + unique + ".exe");
            string partialFile = Path.Combine(_cfg.WorkDir,
                "Vantage-" + release.Version + ".exe.partial");

            string expectedHash = release.Sha256;
            string actualHash = File.Exists(_setupFile) ? Hashing.Sha256(_setupFile) : null;
            if (!string.Equals(actualHash, expectedHash, StringComparison.OrdinalIgnoreCase))
            {
                Native.TryDelete(_setupFile);

                Status("Downloading new version...");
                Diagnostics.Write("download start: threads=" + _cfg.Threads + " url=" + release.Url);

                string downloadError;
                var progressClock = Stopwatch.StartNew();
                bool downloaded = Downloader.DownloadFile(release.Url, _setupFile, partialFile, _cfg.Threads,
                    (done, total) =>
                    {
                        string text = "Downloading new version... " + FormatSize(done);
                        if (total > 0 && done <= total)
                            text += " / " + FormatSize(total) + " (" + (done * 100L / total) + "%)";
                        Status(text);

                        if (progressClock.ElapsedMilliseconds >= 5000)
                        {
                            progressClock.Restart();
                            Diagnostics.Write("progress " + done + "/" + total);
                        }
                    }, out downloadError);

                if (!downloaded)
                {
                    Native.TryDelete(_setupFile);
                    string message = "Could not download the setup file.";
                    if (!string.IsNullOrEmpty(downloadError))
                        message += Environment.NewLine + downloadError;
                    return Fail(message);
                }

                Status("Checking file integrity...");
                if (!string.Equals(Hashing.Sha256(_setupFile), expectedHash, StringComparison.OrdinalIgnoreCase))
                {
                    Native.TryDelete(_setupFile);
                    return Fail("The file checksum for " + Path.GetFileName(_setupFile) +
                                " did not match, so it's possible the download failed.");
                }

                Status("New version downloaded.");
            }

            Installer.WaitForBrowserClose(_browserPath, () =>
            {
                // Status only (tray tooltip); no balloon for the normal flow.
                Status("Close Vantage to continue...");
            });

            Installer.PreventRunningWhileUpdating(_browserPath, _portable);

            Status("Installing new version...");
            string installDir = Path.GetDirectoryName(_browserPath);
            int exitCode = Installer.Run(_setupFile, true, installDir);
            if (exitCode == 0)
                return Success();

            if (_scheduled)
                return Fail("Silent update did not complete.");

            Status("Silent update failed. Starting the installer...");
            exitCode = Installer.Run(_setupFile, false, installDir);
            if (exitCode == 0)
                return Success();

            return Fail("Error while updating (exit code " + exitCode + ").");
        }

        private int Success()
        {
            _cfg.SetLog("LastUpdateTo", _newVersion);
            _cfg.SetLog("LastUpdateFrom", _currentVersion);
            _cfg.SetLastResult("Vantage has been updated.");
            _cfg.TouchLastRun();

            Status("Vantage has been updated to " + _newVersion + ".");

            // Show the result, then exit in both interactive and scheduled
            // mode. Keep the icon alive long enough for the balloon to be
            // visible before the process disappears.
            _tray.Notify("Vantage WinUpdater",
                "Vantage has been updated to " + _newVersion + ".", 8000);
            Thread.Sleep(8000);
            return 0;
        }

        private int Fail(string message)
        {
            _cfg.SetLastResult(message);
            _cfg.TouchLastRun();

            Status(message.Replace(Environment.NewLine, " "));

            // Errors are reported in both interactive and scheduled mode,
            // then the updater exits (one-shot run).
            _tray.Notify("Vantage WinUpdater", message, 8000);
            Thread.Sleep(8000);
            return 1;
        }

        private void Status(string text)
        {
            if (_tray != null)
                _tray.SetStatus(text);
        }

        private void Cleanup()
        {
            if (!string.IsNullOrEmpty(_browserPath))
                Installer.RestoreBackup(_browserPath);

            if (!string.IsNullOrEmpty(_setupFile))
            {
                // Keep a verified installer around only when the update failed
                // before installation started; after that it is disposable.
                string lastResult = _cfg.GetLog("LastResult");
                bool updated = !string.IsNullOrEmpty(lastResult) && lastResult.StartsWith("Vantage has been updated", StringComparison.Ordinal);
                if (updated)
                    Native.TryDelete(_setupFile);
            }
        }

        private static bool IsNewer(string candidate, string current)
        {
            var left = Browser.SplitVersion(candidate);
            var right = Browser.SplitVersion(current);
            int count = Math.Max(left.Count, right.Count);

            for (int i = 0; i < count; i++)
            {
                int a = i < left.Count ? left[i] : 0;
                int b = i < right.Count ? right[i] : 0;
                if (a > b)
                    return true;
                if (a < b)
                    return false;
            }
            return false;
        }

        private static string FormatSize(long bytes)
        {
            if (bytes < 1024)
                return bytes + " B";
            if (bytes < 1024 * 1024)
                return (bytes / 1024.0).ToString("0.0") + " KB";
            return (bytes / (1024.0 * 1024.0)).ToString("0.0") + " MB";
        }
    }
}
