using System;
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

            string lastUpdateTo = _cfg.GetLog("LastUpdateTo");
            bool newer = IsNewer(release.Version, _currentVersion);
            if (!newer || string.Equals(release.Version, lastUpdateTo, StringComparison.OrdinalIgnoreCase))
            {
                Status("No new version found.");
                _cfg.SetLastResult("No new version found.");
                _cfg.TouchLastRun();
                Notify("Vantage WinUpdater", "No new version found.");
                return 0;
            }

            Status("New version " + release.Version + " available.");
            if (_scheduled)
                _tray.ShowIcon();
            Notify("New version available.", "Close Vantage to continue...");

            _setupFile = Path.Combine(_cfg.WorkDir, "Vantage-" + release.Version + ".exe");

            string expectedHash = release.Sha256;
            string actualHash = File.Exists(_setupFile) ? Downloader.Sha256(_setupFile) : null;
            if (!string.Equals(actualHash, expectedHash, StringComparison.OrdinalIgnoreCase))
            {
                Native.TryDelete(_setupFile);

                Status("Downloading new version...");
                string downloadError;
                bool downloaded = Downloader.DownloadFile(release.Url, _setupFile, _cfg.Threads,
                    (done, total) =>
                    {
                        string text = "Downloading new version... " + FormatSize(done);
                        if (total > 0 && done <= total)
                            text += " / " + FormatSize(total) + " (" + (done * 100L / total) + "%)";
                        Status(text);
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
                if (!string.Equals(Downloader.Sha256(_setupFile), expectedHash, StringComparison.OrdinalIgnoreCase))
                {
                    Native.TryDelete(_setupFile);
                    return Fail("The file checksum for " + Path.GetFileName(_setupFile) +
                                " did not match, so it's possible the download failed.");
                }

                Status("New version downloaded.");
            }

            Installer.WaitForBrowserClose(_browserPath, () =>
            {
                Status("Close Vantage to continue...");
                Notify("New version available.", "Close Vantage to continue...");
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
            if (_scheduled)
            {
                _tray.Notify("Vantage WinUpdater",
                    "Vantage has been updated to " + _newVersion + ".", 60000);
                // Keep the process (and the tray icon) alive long enough for
                // the balloon to be visible before the task exits.
                Thread.Sleep(10000);
            }
            else
            {
                Notify("Vantage WinUpdater",
                    "Vantage has been updated to " + _newVersion + ".");
            }
            return 0;
        }

        private int Fail(string message)
        {
            _cfg.SetLastResult(message);
            _cfg.TouchLastRun();

            Status(message.Replace(Environment.NewLine, " "));
            if (!_scheduled)
                Notify("Vantage WinUpdater", message);

            return 1;
        }

        private void Status(string text)
        {
            if (_tray != null)
                _tray.SetStatus(text);
        }

        private void Notify(string title, string text)
        {
            if (_tray != null && !_scheduled)
                _tray.Notify(title, text, 0);
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
