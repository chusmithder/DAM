using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace CryptoLib
{
    public class X
    {

        public static string RsaGetPubParsXml(RSACryptoServiceProvider rsa)
        {
            bool isPriv = false;
            RSAParameters pars = new RSAParameters();
            pars.Exponent = rsa.ExportParameters(isPriv).Exponent;
            pars.Modulus = rsa.ExportParameters(isPriv).Modulus;
            return RsaParsToXml(pars);
        }
        private static string RsaParsToXml(RSAParameters pars)
        {
            var serializer = new XmlSerializer(typeof(RSAParameters));
            var settings = new XmlWriterSettings
            {
                Encoding = new UTF8Encoding(true),
                Indent = false,
                NewLineHandling = NewLineHandling.None
            };
            using (var stringWriter = new Utf8StringWriter())
            {
                using (var xmlWriter = XmlWriter.Create(stringWriter, settings))
                {
                    serializer.Serialize(xmlWriter, pars);
                }
                return stringWriter.ToString();
            }
        }
        private static RSAParameters RsaParsFromXml(string data)
        {
            return new RSAParameters();
        }

        public static string RsaEncrypt(string text, string pubParsXml)
        {
            //datos a encriptar
            byte[] data = Encoding.UTF8.GetBytes(text);

            using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider())
            {
                rsa.FromXmlString(pubParsXml);

                byte[] resul = rsa.Encrypt(data, false);
                return Convert.ToBase64String(resul);
            }
        }

        public static string RsaDecrypt(string code, RSACryptoServiceProvider rsa)
        {
            byte[] data = Convert.FromBase64String(code);
            
            byte[] desencrip = rsa.Decrypt(data, false);

            return Encoding.UTF8.GetString(desencrip);
        }
        public static string SignedData(string text, RSACryptoServiceProvider rsa)
        {
            byte[] data = Encoding.UTF8.GetBytes(text);

            return Convert.ToBase64String(rsa.SignData(data, CryptoConfig.MapNameToOID("SHA256")));
        }
        public static bool VerifyData(string text, string signedText, string pubParsXml)
        {
            byte[] data = Encoding.UTF8.GetBytes(text);

            byte[] firma = Convert.FromBase64String(signedText);

            using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider())
            {
                rsa.FromXmlString(pubParsXml);

                return rsa.VerifyData(data, new SHA256CryptoServiceProvider(), firma);
            }
        }


        public static string AesEncrypt(string msg, string pwd, out string iv)
        {
            byte[] data = Encoding.UTF8.GetBytes(msg);
            byte[] password = Encoding.UTF8.GetBytes(pwd);

            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.GenerateIV();
                iv = Convert.ToBase64String(aesAlg.IV);

                var key = new Rfc2898DeriveBytes(password, aesAlg.IV, 1000).GetBytes(32);

                aesAlg.Key = key;

                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, aesAlg.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        csEncrypt.Write(data, 0, data.Length);
                        csEncrypt.FlushFinalBlock();

                        byte[] encryptedData = msEncrypt.ToArray();
                        return Convert.ToBase64String(encryptedData);
                    }
                }
            }
        }
        public static string AesDecrypt(string enc, string pwd, string sal)
        {
            byte[] encript = Convert.FromBase64String(enc);

            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = new Rfc2898DeriveBytes(pwd, Encoding.UTF8.GetBytes(sal)).GetBytes(32);
                aesAlg.IV = new Rfc2898DeriveBytes(pwd, Encoding.UTF8.GetBytes(sal)).GetBytes(16);

                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                byte[] desencript = decryptor.TransformFinalBlock(encript, 0, encript.Length);

                return Encoding.UTF8.GetString(desencript);
            }
        }

        public static string ShaHash(Object input)
        {
            byte[] data = Encoding.UTF8.GetBytes(input.ToString());

            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hash = sha256.ComputeHash(data);
                return Convert.ToBase64String(hash);
            }
        }

        public static string RandomString(int length)
        {
            const string valid = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
            StringBuilder res = new StringBuilder();
            using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider())
            {
                byte[] uintBuffer = new byte[sizeof(uint)];

                while (length-- > 0)
                {
                    rng.GetBytes(uintBuffer);
                    uint num = BitConverter.ToUInt32(uintBuffer, 0);
                    res.Append(valid[(int)(num % (uint)valid.Length)]);
                }
            }
            return res.ToString();
        }

    }

    public class Utf8StringWriter : StringWriter
    {
        public override Encoding Encoding => Encoding.UTF8;

    }
}
