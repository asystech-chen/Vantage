using System;
using System.IO;
using System.Net;
using System.Text;

namespace Vantage.WinUpdater
{
    /// <summary>
    /// Lightweight run log in %TEMP%\Vantage-WinUpdater.log. Used to diagnose
    /// network problems on machines we cannot inspect directly.
    /// </summary>
    internal static class Diagnostics
    {
        private static readonly object Sync = new object();
        private static readonly string LogPath =
            Path.Combine(Native.TempDir, "Vantage-WinUpdater.log");

        public static string LogFile
        {
            get { return LogPath; }
        }

        public static void Start(string context)
        {
            lock (Sync)
            {
                try
                {
                    var info = new FileInfo(LogPath);
                    if (info.Exists && info.Length > 512 * 1024)
                        File.Delete(LogPath);

                    WriteUnlocked("===== " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " " + context + " =====");
                    WriteUnlocked("exe=" + Native.ExePath);
                    WriteUnlocked("os=" + Environment.OSVersion + " clr=" + Environment.Version +
                                  " 64bitProcess=" + Environment.Is64BitProcess);
                    WriteUnlocked("admin=" + Native.IsAdmin());

                    try
                    {
                        var proxy = WebRequest.DefaultWebProxy;
                        var uri = new Uri("https://asystech.cn/");
                        if (proxy != null)
                        {
                            var target = proxy.GetProxy(uri);
                            WriteUnlocked("systemProxy=" +
                                          (target == null ? "(direct)" : target.ToString()) +
                                          " bypassed=" + proxy.IsBypassed(uri));
                        }
                        else
                        {
                            WriteUnlocked("systemProxy=(null)");
                        }
                    }
                    catch (Exception ex)
                    {
                        WriteUnlocked("systemProxy error: " + ex.Message);
                    }

                    try
                    {
                        var addresses = Dns.GetHostAddresses("asystech.cn");
                        var parts = new System.Collections.Generic.List<string>();
                        foreach (var address in addresses)
                            parts.Add(address.ToString());
                        WriteUnlocked("dns=" + string.Join(", ", parts.ToArray()));
                    }
                    catch (Exception ex)
                    {
                        WriteUnlocked("dns error: " + ex.Message);
                    }
                }
                catch
                {
                    // logging must never break the updater
                }
            }
        }

        public static void Write(string message)
        {
            lock (Sync)
            {
                WriteUnlocked(message);
            }
        }

        private static void WriteUnlocked(string message)
        {
            try
            {
                File.AppendAllText(LogPath,
                    DateTime.Now.ToString("HH:mm:ss.fff") + " " + message + Environment.NewLine,
                    Encoding.UTF8);
            }
            catch
            {
                // best effort
            }
        }
    }
}
