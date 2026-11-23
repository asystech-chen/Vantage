using System;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using System.Security.Principal;
using System.Text;

namespace Vantage.WinUpdater
{
    /// <summary>Small Win32 / framework helpers shared by all modes.</summary>
    internal static class Native
    {
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode)]
        private static extern uint GetPrivateProfileString(
            string lpAppName, string lpKeyName, string lpDefault,
            StringBuilder lpReturnedString, uint nSize, string lpFileName);

        [DllImport("kernel32.dll", CharSet = CharSet.Unicode)]
        private static extern bool WritePrivateProfileString(
            string lpAppName, string lpKeyName, string lpString, string lpFileName);

        public static string IniRead(string file, string section, string key, string fallback = null)
        {
            var sb = new StringBuilder(4096);
            string def = fallback ?? string.Empty;
            GetPrivateProfileString(section, key, def, sb, (uint)sb.Capacity, file);
            return sb.ToString();
        }

        public static void IniWrite(string file, string section, string key, string value)
        {
            WritePrivateProfileString(section, key, value ?? string.Empty, file);
        }

        public static void IniDeleteSection(string file, string section)
        {
            WritePrivateProfileString(section, null, null, file);
        }

        public static bool IsAdmin()
        {
            try
            {
                using (var id = WindowsIdentity.GetCurrent())
                    return new WindowsPrincipal(id).IsInRole(WindowsBuiltInRole.Administrator);
            }
            catch
            {
                return false;
            }
        }

        public static string CurrentUserName()
        {
            try { return WindowsIdentity.GetCurrent().Name; }
            catch { return Environment.UserName; }
        }

        public static string CurrentUserSid()
        {
            try
            {
                using (var id = WindowsIdentity.GetCurrent())
                    return id.User == null ? string.Empty : id.User.Value;
            }
            catch
            {
                return string.Empty;
            }
        }

        public static string ShortUserName()
        {
            string name = CurrentUserName();
            int slash = name.LastIndexOf('\\');
            return slash >= 0 ? name.Substring(slash + 1) : name;
        }

        public static string ExePath
        {
            get { return System.Reflection.Assembly.GetExecutingAssembly().Location; }
        }

        public static string BaseDir
        {
            get { return Path.GetDirectoryName(ExePath); }
        }

        public static string ProgramW6432
        {
            get
            {
                string v = Environment.GetEnvironmentVariable("ProgramW6432");
                if (string.IsNullOrEmpty(v))
                    v = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles);
                return v;
            }
        }

        public static string AppDataWinUpdater
        {
            get
            {
                return Path.Combine(
                    Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
                    "Vantage", "WinUpdater");
            }
        }

        public static string TempDir
        {
            get { return Path.GetTempPath().TrimEnd('\\'); }
        }

        public static string ComSpec
        {
            get
            {
                string v = Environment.GetEnvironmentVariable("ComSpec");
                return string.IsNullOrEmpty(v) ? "cmd.exe" : v;
            }
        }

        public static bool RunElevated(string exePath, string arguments)
        {
            try
            {
                var psi = new ProcessStartInfo(exePath, arguments)
                {
                    UseShellExecute = true,
                    Verb = "runas",
                    WorkingDirectory = Path.GetDirectoryName(exePath)
                };
                Process.Start(psi);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static Process StartHidden(string fileName, string arguments)
        {
            var psi = new ProcessStartInfo(fileName, arguments)
            {
                UseShellExecute = false,
                CreateNoWindow = true,
                WindowStyle = ProcessWindowStyle.Hidden,
                RedirectStandardOutput = true,
                RedirectStandardError = true
            };
            return Process.Start(psi);
        }

        public static string ReadAll(Process p)
        {
            try
            {
                string output = p.StandardOutput.ReadToEnd();
                string error = p.StandardError.ReadToEnd();
                if (!string.IsNullOrEmpty(error))
                    return string.IsNullOrEmpty(output) ? error : output + Environment.NewLine + error;
                return output;
            }
            catch
            {
                return string.Empty;
            }
        }

        public static void TryDelete(string path)
        {
            try
            {
                if (File.Exists(path))
                    File.Delete(path);
            }
            catch
            {
                // best effort
            }
        }

        public static string EscapeXml(string value)
        {
            return System.Security.SecurityElement.Escape(value ?? string.Empty);
        }
    }
}
