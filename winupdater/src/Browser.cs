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

        public static string Locate(Config cfg, string preferredPath = null)
        {
            // 1) Path handed over by the parent process. Needed after the
            //    updater relaunches itself from the %APPDATA% copy: there the
            //    "../vantage.exe" shortcut no longer works.
            if (IsInstallRootExe(preferredPath))
                return preferredPath;

            // 2) winupdater sits inside <install dir>\winupdater, so the
            //    browser is one level up. Most reliable source.
            string sibling = Path.GetFullPath(Path.Combine(Native.BaseDir, "..", BrowserExe));
            if (File.Exists(sibling))
                return sibling;

            // 3) Uninstall registry keys ("Vantage 153.7.0-1 (x86_64 zh-CN)").
            //    Old entries are never cleaned up reliably, so collect every
            //    real installation and pick the newest one instead of taking
            //    the first match (which used to be a stale 153.1.0-1 install
            //    and made the updater reinstall over and over).
            string installed = FindNewestInstalled();
            if (!string.IsNullOrEmpty(installed))
            {
                try { cfg.SetBrowserPath(installed); }
                catch { }
                return installed;
            }

            // 4) Path remembered in the ini (may have been picked on an older
            //    version, so validate it before trusting it).
            string saved = cfg.GetBrowserPath();
            if (IsInstallRootExe(saved))
                return saved;

            // 5) last resort: default install location
            string fallback = Path.Combine(Native.ProgramW6432, "Vantage Browser", BrowserExe);
            return File.Exists(fallback) ? fallback : null;
        }

        /// <summary>
        /// True when the path points at a vantage.exe inside a real
        /// installation (an install root always contains application.ini).
        /// Filters out stale copies left behind by old installers.
        /// </summary>
        private static bool IsInstallRootExe(string path)
        {
            if (string.IsNullOrEmpty(path) || !File.Exists(path))
                return false;
            string dir = Path.GetDirectoryName(path);
            if (string.IsNullOrEmpty(dir))
                return false;
            return File.Exists(Path.Combine(dir, "application.ini"));
        }

        private static List<string> RegistryCandidates()
        {
            var result = new List<string>();
            CollectRegistryCandidates(RegistryHive.LocalMachine, RegistryView.Registry64, result);
            CollectRegistryCandidates(RegistryHive.LocalMachine, RegistryView.Registry32, result);
            CollectRegistryCandidates(RegistryHive.CurrentUser, RegistryView.Registry64, result);
            CollectRegistryCandidates(RegistryHive.CurrentUser, RegistryView.Registry32, result);
            return result;
        }

        private static void CollectRegistryCandidates(RegistryHive hive, RegistryView view, List<string> result)
        {
            try
            {
                using (var baseKey = RegistryKey.OpenBaseKey(hive, view))
                using (var root = baseKey.OpenSubKey(UninstallKey))
                {
                    if (root == null)
                        return;

                    foreach (string name in root.GetSubKeyNames())
                    {
                        if (name.IndexOf("Vantage", StringComparison.OrdinalIgnoreCase) < 0)
                            continue;

                        using (var key = root.OpenSubKey(name))
                        {
                            if (key == null)
                                continue;

                            // Never treat the updater's own Add/Remove entry
                            // as a browser installation.
                            string displayName = key.GetValue("DisplayName") as string;
                            if (!string.IsNullOrEmpty(displayName) &&
                                displayName.IndexOf("WinUpdater", StringComparison.OrdinalIgnoreCase) >= 0)
                                continue;

                            string dir = key.GetValue("InstallLocation") as string;
                            if (string.IsNullOrEmpty(dir))
                                continue;

                            string exe = Path.Combine(dir, BrowserExe);
                            if (!IsInstallRootExe(exe))
                                continue;

                            bool duplicate = false;
                            foreach (string existing in result)
                            {
                                if (string.Equals(existing, exe, StringComparison.OrdinalIgnoreCase))
                                {
                                    duplicate = true;
                                    break;
                                }
                            }
                            if (!duplicate)
                                result.Add(exe);
                        }
                    }
                }
            }
            catch
            {
                // ignore and try the next registry view
            }
        }

        private static string FindNewestInstalled()
        {
            string best = null;
            var bestVersion = new List<int>();

            foreach (string candidate in RegistryCandidates())
            {
                string version = GetVersion(candidate);
                Diagnostics.Write("registry candidate=" + candidate + " version=" + version);

                var parsed = SplitVersion(version);
                if (best == null || CompareVersions(parsed, bestVersion) > 0)
                {
                    best = candidate;
                    bestVersion = parsed;
                }
            }

            return best;
        }

        private static int CompareVersions(List<int> left, List<int> right)
        {
            int count = Math.Max(left.Count, right.Count);
            for (int i = 0; i < count; i++)
            {
                int a = i < left.Count ? left[i] : 0;
                int b = i < right.Count ? right[i] : 0;
                if (a != b)
                    return a < b ? -1 : 1;
            }
            return 0;
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
                // The backup is the pre-update executable. When the browser
                // exe is present the install/update finished and only the
                // cleanup was interrupted — restoring would downgrade it,
                // which used to make the updater report an ancient version.
                if (File.Exists(browserPath))
                {
                    File.Delete(backup);
                    return true;
                }

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
