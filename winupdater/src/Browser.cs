using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;
using Microsoft.Win32;

namespace Vantage.WinUpdater
{
    /// <summary>Locates vantage.exe and reads its version / architecture.</summary>
    internal static class Browser
    {
        private const string BrowserExe = "vantage.exe";
        private const string UninstallKey = @"Software\Microsoft\Windows\CurrentVersion\Uninstall";

        public static string Locate(Config cfg)
        {
            // 1) winupdater sits inside <install dir>\winupdater, so the
            //    browser is one level up. Most reliable source.
            string sibling = Path.GetFullPath(Path.Combine(Native.BaseDir, "..", BrowserExe));
            if (File.Exists(sibling))
                return sibling;

            // 2) path remembered in the ini (may have been picked on an
            //    older version of the updater)
            string saved = cfg.GetBrowserPath();
            if (!string.IsNullOrEmpty(saved) && File.Exists(saved))
                return saved;

            // 3) Uninstall registry keys. Try the exact key first, then
            //    enumerate versioned keys ("Vantage 153.0.3 (x86_64 zh-CN)").
            string found = ReadInstallLocation(RegistryHive.LocalMachine, RegistryView.Registry64, "Vantage")
                        ?? ReadInstallLocation(RegistryHive.LocalMachine, RegistryView.Registry32, "Vantage")
                        ?? ReadInstallLocation(RegistryHive.CurrentUser, RegistryView.Registry64, "Vantage")
                        ?? ReadInstallLocation(RegistryHive.CurrentUser, RegistryView.Registry32, "Vantage");

            if (string.IsNullOrEmpty(found))
                found = EnumerateUninstall(RegistryHive.LocalMachine, RegistryView.Registry64)
                     ?? EnumerateUninstall(RegistryHive.LocalMachine, RegistryView.Registry32)
                     ?? EnumerateUninstall(RegistryHive.CurrentUser, RegistryView.Registry64)
                     ?? EnumerateUninstall(RegistryHive.CurrentUser, RegistryView.Registry32);

            if (!string.IsNullOrEmpty(found))
            {
                try { cfg.SetBrowserPath(found); }
                catch { }
                return found;
            }

            // 4) last resort: default install location
            string fallback = Path.Combine(Native.ProgramW6432, "Vantage Browser", BrowserExe);
            return File.Exists(fallback) ? fallback : null;
        }

        private static string ReadInstallLocation(RegistryHive hive, RegistryView view, string keyName)
        {
            try
            {
                using (var baseKey = RegistryKey.OpenBaseKey(hive, view))
                using (var key = baseKey.OpenSubKey(UninstallKey + "\\" + keyName))
                {
                    if (key == null)
                        return null;
                    string dir = key.GetValue("InstallLocation") as string;
                    if (string.IsNullOrEmpty(dir))
                        return null;
                    string exe = Path.Combine(dir, BrowserExe);
                    return File.Exists(exe) ? exe : null;
                }
            }
            catch
            {
                return null;
            }
        }

        private static string EnumerateUninstall(RegistryHive hive, RegistryView view)
        {
            try
            {
                using (var baseKey = RegistryKey.OpenBaseKey(hive, view))
                using (var root = baseKey.OpenSubKey(UninstallKey))
                {
                    if (root == null)
                        return null;

                    foreach (string name in root.GetSubKeyNames())
                    {
                        if (name.IndexOf("Vantage", StringComparison.OrdinalIgnoreCase) < 0)
                            continue;

                        using (var key = root.OpenSubKey(name))
                        {
                            if (key == null)
                                continue;
                            string dir = key.GetValue("InstallLocation") as string;
                            if (string.IsNullOrEmpty(dir))
                                continue;
                            string exe = Path.Combine(dir, BrowserExe);
                            if (File.Exists(exe))
                                return exe;
                        }
                    }
                }
            }
            catch
            {
                // ignore and try the next registry view
            }
            return null;
        }

        /// <summary>
        /// Restores vantage.exe from a leftover .wubak after an interrupted
        /// update. Returns false when the process relaunched itself elevated.
        /// </summary>
        public static bool RecoverBackup(string browserPath, Options opts, bool portable)
        {
            string backup = browserPath + ".wubak";
            if (!File.Exists(backup))
                return true;

            try
            {
                File.Copy(backup, browserPath, true);
                File.Delete(backup);
                return true;
            }
            catch
            {
                if (!Native.IsAdmin() && !portable)
                {
                    string args = opts.RebuildArguments() + " /Restart";
                    if (Native.RunElevated(Native.ExePath, args.Trim()))
                        return false;
                }
                return true; // let the installer overwrite it
            }
        }

        /// <summary>ProductVersion (fallback FileVersion), trailing .0/.65535 removed.</summary>
        public static string GetVersion(string browserPath)
        {
            string version;
            try
            {
                var info = FileVersionInfo.GetVersionInfo(browserPath);
                version = info.ProductVersion;
                if (string.IsNullOrEmpty(version))
                    version = info.FileVersion;
            }
            catch
            {
                return null;
            }

            if (string.IsNullOrEmpty(version))
                return null;

            version = version.Trim();
            version = Regex.Replace(version, @"(\.(0|65535))+$", string.Empty);
            return string.IsNullOrEmpty(version) ? null : version;
        }

        /// <summary>Reads the PE Machine field: x86_64, i686 or arm64.</summary>
        public static string GetArchitecture(string browserPath)
        {
            try
            {
                using (var stream = new FileStream(browserPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                using (var reader = new BinaryReader(stream))
                {
                    stream.Seek(0x3C, SeekOrigin.Begin);
                    int peOffset = reader.ReadInt32();
                    stream.Seek(peOffset, SeekOrigin.Begin);
                    if (reader.ReadUInt32() != 0x00004550) // "PE\0\0"
                        return null;
                    ushort machine = reader.ReadUInt16();
                    switch (machine)
                    {
                        case 0x8664: return "x86_64";
                        case 0x014C: return "i686";
                        case 0xAA64: return "arm64";
                        default: return null;
                    }
                }
            }
            catch
            {
                return null;
            }
        }

        public static List<int> SplitVersion(string version)
        {
            var parts = new List<int>();
            if (string.IsNullOrEmpty(version))
                return parts;
            foreach (Match match in Regex.Matches(version, @"\d+"))
            {
                int value;
                if (int.TryParse(match.Value, out value))
                    parts.Add(value);
            }
            return parts;
        }
    }
}
