using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Vantage.WinUpdater
{
    internal sealed class Options
    {
        public bool Scheduled;
        public bool Portable;
        public bool CreateTask;
        public bool RemoveTask;
        public bool Uninstall;
        public bool Quiet;
        public bool Elevated;
        public bool Restart;
        public string[] RawArguments = new string[0];

        public static Options Parse(string[] args)
        {
            var options = new Options { RawArguments = args ?? new string[0] };

            foreach (string argument in options.RawArguments)
            {
                switch ((argument ?? string.Empty).ToLowerInvariant())
                {
                    case "/scheduled": options.Scheduled = true; break;
                    case "/portable": options.Portable = true; break;
                    case "/createtask": options.CreateTask = true; break;
                    case "/removetask": options.RemoveTask = true; break;
                    case "/uninstall": options.Uninstall = true; break;
                    case "/quiet": options.Quiet = true; break;
                    case "/elevated": options.Elevated = true; break;
                    case "/restart": options.Restart = true; break;
                }
            }

            return options;
        }

        public string RebuildArguments()
        {
            var parts = new List<string>();
            foreach (string argument in RawArguments)
            {
                if (string.IsNullOrEmpty(argument))
                    continue;
                parts.Add(argument.IndexOf(' ') >= 0 ? "\"" + argument + "\"" : argument);
            }
            return string.Join(" ", parts.ToArray());
        }
    }

    internal static class Program
    {
        [STAThread]
        private static int Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            Options options = Options.Parse(args);
            Diagnostics.Start("args=" + string.Join(" ", args));

            if (options.Uninstall)
                return Uninstaller.Run(options);

            bool portable = options.Portable ||
                            File.Exists(Path.Combine(Native.BaseDir, "Vantage-Portable.exe"));

            var config = new Config(Path.Combine(Native.BaseDir, "Vantage-WinUpdater.ini"), portable);

            if (options.CreateTask || options.RemoveTask)
                return RunTaskCommand(options, config);

            string browserPath = Browser.Locate(config);
            if (browserPath == null)
            {
                string message = "Could not find the browser path.";
                config.SetLastResult(message);
                TemporaryBalloon.Show("Vantage WinUpdater", message);
                return 1;
            }

            if (!Browser.RecoverBackup(browserPath, options, portable))
                return 0;

            string currentVersion = Browser.GetVersion(browserPath);
            if (currentVersion == null)
            {
                string message = "Could not determine the current version of " + browserPath;
                config.SetLastResult(message);
                TemporaryBalloon.Show("Vantage WinUpdater", message);
                return 1;
            }

            Diagnostics.Write("browser=" + browserPath + " version=" + currentVersion);

            if (!EnsureWritableLocation(config, options, portable, browserPath))
                return 0;

            using (var mutex = new Mutex(false, @"Local\VantageWinUpdater"))
            {
                bool owned = options.Scheduled
                    ? mutex.WaitOne(0)
                    : mutex.WaitOne(TimeSpan.FromSeconds(4));

                if (!owned)
                {
                    if (!options.Scheduled)
                        TemporaryBalloon.Show("Vantage WinUpdater", "Vantage WinUpdater is already running.");
                    return 0;
                }

                try
                {
                    if (!portable)
                        EnsureScheduledTask(browserPath);

                    return RunUpdateLoop(config, options, browserPath, currentVersion, portable);
                }
                finally
                {
                    try { mutex.ReleaseMutex(); }
                    catch { }
                }
            }
        }

        private static void EnsureScheduledTask(string browserPath)
        {
            try
            {
                string taskName = ScheduledTask.CurrentTaskName;
                if (ScheduledTask.Exists(taskName))
                    return;

                // Point the task at the installed copy, not at the %APPDATA%
                // copy this process may be running from.
                string canonical = Path.Combine(
                    Path.GetDirectoryName(browserPath), "winupdater", "Vantage-WinUpdater.exe");
                string exePath = File.Exists(canonical) ? canonical : Native.ExePath;

                string error;
                bool ok = ScheduledTask.Create(taskName, exePath, out error);
                Diagnostics.Write("scheduled task missing; register " +
                                  (ok ? "ok" : "failed: " + error) + " -> " + exePath);
            }
            catch (Exception ex)
            {
                Diagnostics.Write("scheduled task ensure failed: " + ex.Message);
            }
        }

        private static int RunUpdateLoop(Config config, Options options,
                                         string browserPath, string currentVersion, bool portable)
        {
            int exitCode = 0;
            object gate = new object();
            bool running = false;
            TrayApp tray = null;

            Action startCheck = () =>
            {
                lock (gate)
                {
                    if (running)
                        return;
                    running = true;
                }

                Task.Run(() =>
                {
                    UpdateRunner runner = null;
                    try
                    {
                        runner = new UpdateRunner(config, browserPath, currentVersion,
                            options.Scheduled, portable, tray);
                        exitCode = runner.Run();
                    }
                    catch (Exception ex)
                    {
                        config.SetLastResult("Update error: " + ex.Message);
                        exitCode = 1;
                    }
                    finally
                    {
                        lock (gate)
                        {
                            running = false;
                        }

                        // One-shot run: always exit when the check finished
                        // (silently when there is no update, with a balloon
                        // on success or failure).
                        tray.ExitApp();
                    }
                });
            };

            tray = new TrayApp(!options.Scheduled, () => startCheck());
            startCheck();
            Application.Run(tray);

            return exitCode;
        }

        private static int RunTaskCommand(Options options, Config config)
        {
            string taskName = ScheduledTask.CurrentTaskName;
            string error;
            bool ok = options.CreateTask
                ? ScheduledTask.Create(taskName, Native.ExePath, out error)
                : ScheduledTask.Remove(taskName, out error);

            config.SetLastResult(
                (options.CreateTask ? "CreateTask: " : "RemoveTask: ") +
                (ok ? "OK" : (string.IsNullOrEmpty(error) ? "failed" : error)));

            return ok ? 0 : 1;
        }

        private static bool EnsureWritableLocation(Config config, Options options,
                                                   bool portable, string browserPath)
        {
            string appData = Native.AppDataWinUpdater;
            string baseDir = Native.BaseDir;

            // Portable builds run in place; the folder must be writable.
            if (portable)
            {
                if (CanWriteIni(config.IniPath))
                    return true;
                FailWrite(config, options, baseDir);
                return false;
            }

            // The updater lives in <install dir>\winupdater while the browser
            // is in <install dir>: do not run from the install tree, because
            // the installer replaces those files (and a running executable
            // cannot be overwritten).
            bool installed = PathsEqual(
                Path.GetDirectoryName(browserPath), Path.GetDirectoryName(baseDir));

            // Running from the %APPDATA% copy: stay there if the ini is writable.
            if (!installed && CanWriteIni(config.IniPath))
                return true;

            if (PathsEqual(baseDir, appData))
            {
                FailWrite(config, options, baseDir);
                return false;
            }

            // Relocate to %APPDATA% and restart from there.
            try
            {
                Directory.CreateDirectory(appData);
                string destination = Path.Combine(appData, Path.GetFileName(Native.ExePath));
                File.Copy(Native.ExePath, destination, true);

                var psi = new ProcessStartInfo(destination, options.RebuildArguments())
                {
                    UseShellExecute = true,
                    WorkingDirectory = appData
                };
                Process.Start(psi);
                return false;
            }
            catch (UnauthorizedAccessException)
            {
                FailWrite(config, options, appData);
                return false;
            }
            catch (IOException)
            {
                // Another instance is already running from the AppData copy;
                // it owns this update cycle.
                return false;
            }
            catch (Exception ex)
            {
                FailWrite(config, options, appData + " (" + ex.Message + ")");
                return false;
            }
        }

        private static bool CanWriteIni(string path)
        {
            try
            {
                using (new FileStream(path, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
                {
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        private static void FailWrite(Config config, Options options, string location)
        {
            string message = "Could not write to " + location +
                             ". Please check write permissions for this folder.";
            config.SetLastResult(message);
            TemporaryBalloon.Show("Vantage WinUpdater", message);
        }

        private static bool PathsEqual(string a, string b)
        {
            try
            {
                string left = Path.GetFullPath(a).TrimEnd('\\');
                string right = Path.GetFullPath(b).TrimEnd('\\');
                return string.Equals(left, right, StringComparison.OrdinalIgnoreCase);
            }
            catch
            {
                return false;
            }
        }
    }
}
