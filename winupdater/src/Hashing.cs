using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Vantage.WinUpdater
{
    internal static class Hashing
    {
        public static string Sha256(string path)
        {
            try
            {
                using (var sha = SHA256.Create())
                using (var stream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read))
                {
                    byte[] hash = sha.ComputeHash(stream);
                    var builder = new StringBuilder(hash.Length * 2);
                    foreach (byte b in hash)
                        builder.Append(b.ToString("X2"));
                    return builder.ToString();
                }
            }
            catch
            {
                return null;
            }
        }
    }
}
