using System;
using System.IO;

namespace Vantage.WinUpdater
{
    /// <summary>Per-user settings and run log, stored in Vantage-WinUpdater.ini.</summary>
    internal sealed class Config
    {
        public string IniPath { get; private set; }
        public bool Portable { get; private set; }

        public Config(string iniPath, bool portable)
        {
            IniPath = iniPath;
            Portable = portable;

            try
            {
                if (!File.Exists(IniPath))
                    File.WriteAllText(IniPath, string.Empty);
            }
            catch
            {
                // A read-only location is handled by the AppData copy logic.
            }

            string workDir = Native.IniRead(IniPath, "Settings", "WorkDir", null);
            if (string.IsNullOrEmpty(workDir))
            {
                workDir = Native.TempDir;
                Native.IniWrite(IniPath, "Settings", "WorkDir", workDir);
            }
        }

        public string WorkDir
        {
            get
            {
                string dir = Native.IniRead(IniPath, "Settings", "WorkDir", null);
                if (string.IsNullOrEmpty(dir))
                    dir = Native.TempDir;
                try { Directory.CreateDirectory(dir); }
                catch { dir = Native.TempDir; }
                return dir;
            }
        }

        /// <summary>Parallel download connections (1-8), default 8.</summary>
        public int Threads
        {
            get
            {
                int value;
                if (!int.TryParse(Native.IniRead(IniPath, "Settings", "Threads", "8"), out value))
                    value = 8;
                if (value < 1) value = 1;
                if (value > 8) value = 8;
                return value;
            }
        }

        public string GetBrowserPath()
        {
            string value = Native.IniRead(IniPath, "Settings", "Path", null);
            return string.IsNullOrEmpty(value) ? null : value.Trim().Trim('"');
        }

        public void SetBrowserPath(string path)
        {
            Native.IniWrite(IniPath, "Settings", "Path", path);
        }

        public string GetLog(string key)
        {
            string value = Native.IniRead(IniPath, "Log", key, null);
            return string.IsNullOrEmpty(value) ? null : value;
        }

        public void SetLog(string key, string value)
        {
            // INI values are single-line: collapse any embedded newlines.
            if (value != null)
                value = value.Replace("\r", " ").Replace("\n", " ").Trim();
            Native.IniWrite(IniPath, "Log", key, value);
        }

        public void SetLastResult(string value)
        {
            SetLog("LastResult", value);
        }

        public void TouchLastRun()
        {
            SetLog("LastRun", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
        }
    }
}
