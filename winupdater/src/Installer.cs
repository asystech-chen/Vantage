using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Management;
using System.Threading;

namespace Vantage.WinUpdater
{
    /// <summary>Waits for the browser to close and runs the NSIS installer.</summary>
    internal static class Installer
    {
        public static void WaitForBrowserClose(string browserPath, Action onRunning)
        {
            bool notified = false;
            while (true)
            {
                List<int> processIds = FindProcesses(browserPath);
                if (processIds == null || processIds.Count == 0)
                    return;

                if (!notified && onRunning != null)
                {
                    onRunning();
                    notified = true;
                }

                Thread.Sleep(2000);
            }
        }

        private static List<int> FindProcesses(string executablePath)
        {
            var result = new List<int>();
            string escaped = executablePath.Replace("\\", "\\\\").Replace("'", "\\'");
            string query = "SELECT ProcessId FROM Win32_Process WHERE ExecutablePath='" + escaped + "'";

            try
            {
                using (var searcher = new ManagementObjectSearcher(query))
                using (var collection = searcher.Get())
                {
                    foreach (ManagementObject item in collection)
                    {
                        try
                        {
                            object id = item["ProcessId"];
                            if (id != null)
                                result.Add(Convert.ToInt32(id));
                        }
                        finally
                        {
                            item.Dispose();
                        }
                    }
                }
                return result;
            }
            catch
            {
                // WMI unavailable (unlikely on supported systems): do not
                // block the update forever.
                return null;
            }
        }

        /// <summary>
        /// Renames the browser executable so it cannot be started while the
        /// installer is replacing files. Requires write access to the folder.
        /// </summary>
        public static void PreventRunningWhileUpdating(string browserPath, bool portable)
        {
            if (!Native.IsAdmin() && !portable)
                return;

            try
            {
                string backup = browserPath + ".wubak";
                if (File.Exists(backup))
                    File.Delete(backup);
                File.Move(browserPath, backup);
            }
            catch
            {
                // Not fatal: the installer will report its own errors.
            }
        }

        public static int Run(string setupFile, bool silent, string installDir)
        {
            string arguments = (silent ? "/S " : string.Empty) + "/D=" + installDir.TrimEnd('\\');

            try
            {
                var psi = new ProcessStartInfo(setupFile, arguments)
                {
                    UseShellExecute = false,
                    WorkingDirectory = Path.GetDirectoryName(setupFile)
                };

                using (var process = Process.Start(psi))
                {
                    if (process == null)
                        return -1;
                    process.WaitForExit();
                    return process.ExitCode;
                }
            }
            catch (System.ComponentModel.Win32Exception ex) when (ex.NativeErrorCode == 740)
            {
                // ERROR_ELEVATION_REQUIRED: CreateProcess cannot show UAC, so
                // retry through the shell with the runas verb.
                return RunElevated(setupFile, arguments);
            }
            catch
            {
                return -1;
            }
        }

        private static int RunElevated(string setupFile, string arguments)
        {
            try
            {
                var psi = new ProcessStartInfo(setupFile, arguments)
                {
                    UseShellExecute = true,
                    Verb = "runas",
                    WorkingDirectory = Path.GetDirectoryName(setupFile)
                };

                using (var process = Process.Start(psi))
                {
                    if (process == null)
                        return -1;
                    process.WaitForExit();
                    try { return process.ExitCode; }
                    catch { return 0; }
                }
            }
            catch
            {
                return -1;
            }
        }

        /// <summary>Restores or drops a leftover .wubak on exit.</summary>
        public static void RestoreBackup(string browserPath)
        {
            string backup = browserPath + ".wubak";
            try
            {
                if (!File.Exists(backup))
                    return;
                if (File.Exists(browserPath))
                    File.Delete(backup);
                else
                    File.Move(backup, browserPath);
            }
            catch
            {
                // best effort
            }
        }
    }
}
