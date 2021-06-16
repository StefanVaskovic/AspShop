using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Implementation
{
    public static class EncryptPassword
    {
        public static string Encrypt(string password)
        {
            var sha1 = new SHA1CryptoServiceProvider();
            var data = Encoding.ASCII.GetBytes(password);
            var sha1data = sha1.ComputeHash(data);
            //var aSCIIEncoding = new ASCIIEncoding();
            var hashedPassword = Convert.ToBase64String(sha1data);

            return hashedPassword;
        }
    }
}
