using System;
using System.Net;

namespace Vantage.WinUpdater
{
    /// <summary>Shared HTTP configuration and request creation.</summary>
    internal static class HttpRequestFactory
    {
        private static bool _initialized;

        public static void Initialize()
        {
            if (_initialized)
                return;
            _initialized = true;

            // Cloudflare and the rest of the modern web require TLS 1.2+.
            try { ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12; } catch { }
            // Old updater used curl --ssl-no-revoke; keep the same behaviour
            // so offline/CRL-blocked networks do not stall.
            try { ServicePointManager.CheckCertificateRevocationList = false; } catch { }
            try { ServicePointManager.DefaultConnectionLimit = 64; } catch { }
            try { ServicePointManager.Expect100Continue = false; } catch { }
            try { ServicePointManager.EnableDnsRoundRobin = true; } catch { }
        }

        public static HttpWebRequest Create(string url)
        {
            Initialize();

            var request = (HttpWebRequest)WebRequest.Create(url);
            request.UserAgent = "Vantage-WinUpdater/2.0";
            request.AllowAutoRedirect = true;
            request.KeepAlive = false;
            // The previous curl-based updater connected directly (Windows curl
            // does not pick up the WinINet proxy). Mirror that: a stale local
            // proxy setting is a common cause of connect timeouts.
            request.Proxy = null;
            request.Timeout = 15000;
            request.ReadWriteTimeout = 60000;
            return request;
        }

        public static string Describe(Exception exception)
        {
            var webException = exception as WebException;
            if (webException != null)
            {
                var response = webException.Response as HttpWebResponse;
                if (response != null)
                {
                    try
                    {
                        return "HTTP " + (int)response.StatusCode + " " + response.StatusDescription;
                    }
                    catch
                    {
                        // fall through to the message below
                    }
                }

                return webException.Status + ": " + webException.Message;
            }

            return exception.Message;
        }
    }
}
