using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.Script.Serialization;

namespace Vantage.WinUpdater
{
    /// <summary>Parsed vd.json (version + download URL + sha256 for this architecture).</summary>
    internal sealed class ReleaseInfo
    {
        public string Version;
        public string Url;
        public string Sha256;

        public static ReleaseInfo Parse(string json, string architecture)
        {
            if (string.IsNullOrEmpty(json))
                return null;

            Dictionary<string, object> root;
            try
            {
                var serializer = new JavaScriptSerializer();
                root = serializer.DeserializeObject(json) as Dictionary<string, object>;
            }
            catch
            {
                return null;
            }

            if (root == null)
                return null;

            object versionObject;
            root.TryGetValue("version", out versionObject);
            string versionText = versionObject as string;

            if (string.IsNullOrEmpty(versionText))
                return null;

            Match match = Regex.Match(versionText, @"\d+(?:\.\d+)*(?:-\d+)?");
            if (!match.Success)
                return null;

            var info = new ReleaseInfo { Version = match.Value };

            object linksObject;
            var links = root.TryGetValue("links", out linksObject)
                ? linksObject as Dictionary<string, object>
                : null;

            if (links != null)
            {
                if (string.Equals(architecture, "arm64", StringComparison.OrdinalIgnoreCase))
                {
                    info.Url = GetString(links, "win_arm64_exe");
                    info.Sha256 = GetString(links, "win_arm64_exe_sha256");
                }
                else
                {
                    info.Url = GetString(links, "windows_exe");
                    info.Sha256 = GetString(links, "windows_exe_sha256");
                }
            }

            return info;
        }

        private static string GetString(Dictionary<string, object> dict, string key)
        {
            object value;
            if (!dict.TryGetValue(key, out value))
                return null;
            string text = value as string;
            return string.IsNullOrEmpty(text) ? null : text.Trim();
        }
    }
}
