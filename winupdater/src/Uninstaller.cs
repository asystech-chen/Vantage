using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using Microsoft.Win32;

namespace Vantage.WinUpdater
{
    /// <summary>
    /// Native replacement for the former Uninstall.ps1: removes the scheduled
    /// task, the %APPDATA% runtime copy, the Apps &amp; features entry and the
    /// component folder. Elevates itself through UAC when needed.
    /// </summary>
    internal static class Uninstaller
    {
        private const string UninstallKey = @"Software\Microsoft\Windows\CurrentVersion\Uninstall\Vantage WinUpdater";
        private static readonly string LogFile = Path.Combine(Native.TempDir, "Vantage-WinUpdater-uninstall.log");

        public static int Run(Options options)
        {
            Log("--- Uninstall started (elevated=" + options.Elevated + " quiet=" + options.Quiet + ") ---");

            string exePath = Native.ExePath;
            string componentDir = Native.BaseDir;
            bool isAdmin = Native.IsAdmin();
            Log("Administrator: " + isAdmin);

            if (!isAdmin && !options.Elevated)
            {
                string arguments = "/Uninstall /Elevated" + (options.Quiet ? " /Quiet" : string.Empty);
                try
                {
                    var psi = new ProcessStartInfo(exePath, arguments)
                    {
                        UseShellExecute = true,
                        Verb = "runas",
                        WorkingDirectory = componentDir
                    };
                    using (var process = Process.Start(psi))
                    {
                        if (process == null)
                        {
                            Log("ERROR: could not start the elevated uninstaller.");
                            return 1;
                        }
                        process.WaitForExit();
                        Log("Elevated helper exit code: " + process.ExitCode);
                        return process.ExitCode;
                    }
                }
                catch (Exception ex)
                {
                    Log("ERROR: elevation failed: " + ex.Message);
                    return 1;
                }
            }

            KillProcesses();
            RemoveScheduledTasks();
            RemoveAppDataCopy();
            RemoveRegistryEntries();
            RemoveComponentDirectory(componentDir);

            Log("--- Uninstall finished ---");
            return 0;
        }

        private static void KillProcesses()
        {
            int current = Process.GetCurrentProcess().Id;
            foreach (var process in Process.GetProcessesByName("Vantage-WinUpdater"))
            {
                try
                {
                    if (process.Id == current)
                        continue;
                    Log("Stopping process " + process.Id);
                    process.Kill();
                    process.WaitForExit(3000);
                }
                catch
                {
                    // ignore
                }
                finally
                {
                    process.Dispose();
                }
            }
        }

        private static void RemoveScheduledTasks()
        {
            string error;
            int removed = ScheduledTask.RemoveAll(out error);
            Log("Scheduled tasks removed: " + removed + (string.IsNullOrEmpty(error) ? string.Empty : " (" + error + ")"));
        }

        private static void RemoveAppDataCopy()
        {
            string path = Native.AppDataWinUpdater;
            try
            {
                if (!Directory.Exists(path))
                    return;
                Log("Removing " + path);
                Directory.Delete(path, true);
            }
            catch (Exception ex)
            {
                Log("WARNING: could not remove " + path + ": " + ex.Message);
            }
        }

        private static void RemoveRegistryEntries()
        {
            DeleteKey(RegistryHive.CurrentUser, RegistryView.Registry64);
            DeleteKey(RegistryHive.CurrentUser, RegistryView.Registry32);
            DeleteKey(RegistryHive.LocalMachine, RegistryView.Registry64);
            DeleteKey(RegistryHive.LocalMachine, RegistryView.Registry32);
        }

        private static void DeleteKey(RegistryHive hive, RegistryView view)
        {
            try
            {
                using (var baseKey = RegistryKey.OpenBaseKey(hive, view))
                using (var uninstall = baseKey.OpenSubKey(@"Software\Microsoft\Windows\CurrentVersion\Uninstall", true))
                {
                    if (uninstall == null)
                        return;
                    if (uninstall.OpenSubKey("Vantage WinUpdater") == null)
                        return;
                    Log("Removing registry entry " + hive + " (" + view + ")");
                    uninstall.DeleteSubKeyTree("Vantage WinUpdater", false);
                }
            }
            catch (Exception ex)
            {
                Log("WARNING: registry cleanup failed for " + hive + " (" + view + "): " + ex.Message);
            }
        }

        private static void RemoveComponentDirectory(string componentDir)
        {
            if (string.IsNullOrEmpty(componentDir) || !Directory.Exists(componentDir))
                return;

            string name = new DirectoryInfo(componentDir).Name;
            string expectedExe = Path.Combine(componentDir, "Vantage-WinUpdater.exe");
            if (!string.Equals(name, "winupdater", StringComparison.OrdinalIgnoreCase) || !File.Exists(expectedExe))
            {
                Log("Skipping unexpected component directory: " + componentDir);
                return;
            }

            string script = Path.Combine(Native.TempDir, "vantage-winupdater-cleanup.cmd");
            string content =
                "@echo off\r\n" +
                "ping -n 3 127.0.0.1 >nul\r\n" +
                "rd /s /q \"" + componentDir + "\"\r\n" +
                "(goto) 2>nul & del /f /q \"%~f0\"\r\n";

            try
            {
                File.WriteAllText(script, content, Encoding.ASCII);
                Log("Scheduling deferred removal of " + componentDir);
                var psi = new ProcessStartInfo(Native.ComSpec, "/c call \"" + script + "\"")
                {
                    UseShellExecute = false,
                    CreateNoWindow = true,
                    WindowStyle = ProcessWindowStyle.Hidden,
                    WorkingDirectory = Native.TempDir
                };
                Process.Start(psi);
            }
            catch (Exception ex)
            {
                Log("WARNING: deferred removal failed: " + ex.Message);
            }
        }

        private static void Log(string message)
        {
            try
            {
                string line = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " " + message + Environment.NewLine;
                File.AppendAllText(LogFile, line, Encoding.UTF8);
            }
            catch
            {
                // best effort
            }
        }
    }
}
