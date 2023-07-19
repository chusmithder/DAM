using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Xml.Serialization;

namespace MyRsaTools
{
    public class MRT
    {
        public static string ExportPublicParametersToXml(RSACryptoServiceProvider rsa)
        {
            RSAParameters publicParameters = new RSAParameters();
            publicParameters.Exponent = rsa.ExportParameters(false).Exponent;
            publicParameters.Modulus = rsa.ExportParameters(false).Modulus;
            using (StringWriter writer = new Utf8StringWriter())
            {
                XmlSerializer xml = new XmlSerializer(typeof(RSAParameters));
                xml.Serialize(writer, publicParameters);
                return writer.ToString();
            }
        }
        public static RSAParameters PublicParametersFromXml(string data)
        {
            XmlSerializer xml = new XmlSerializer(typeof(RSAParameters));
            object result;
            using (TextReader reader = new StringReader(data))
            {
                result = xml.Deserialize(reader);
            }
            return (RSAParameters)result;
        }

        public static string Encrypt(string text, RSAParameters publicParameters)
        {
            byte[] data = Encoding.Default.GetBytes(text);
            using (RSACryptoServiceProvider tester = new RSACryptoServiceProvider())
            {
                tester.ImportParameters(publicParameters);
                byte[] encrypted = tester.Encrypt(data, false);
                string base64 = Convert.ToBase64String(encrypted, 0, encrypted.Length);
                return base64;
            }
        }

        public static string Decrypt(string code, RSACryptoServiceProvider rsa)
        {
            byte[] encrypted = System.Convert.FromBase64String(code);
            byte[] decrypted = rsa.Decrypt(encrypted, false);
            string text = Encoding.UTF8.GetString(decrypted);
            return text;
        }

        public static string SignedData(string text, RSACryptoServiceProvider rsa)
        {
            byte[] data = Encoding.Default.GetBytes(text);
            byte[] xdata = rsa.SignData(data, new SHA1CryptoServiceProvider());
            string base64 = Convert.ToBase64String(xdata, 0, xdata.Length);
            return base64;
        }

        public static bool VerifyData(string text, string signedText, RSAParameters publicParameters)
        {
            byte[] data = Encoding.Default.GetBytes(text);
            byte[] signedData = Convert.FromBase64String(signedText);
            RSACryptoServiceProvider tester = new RSACryptoServiceProvider();
            tester.ImportParameters(publicParameters);
            return tester.VerifyData(data, new SHA1CryptoServiceProvider(), signedData);
        }

        public static void Main()
        {
            string PATH1 = "pub1.xml";

            // the maximum size of data which can be encrypted with RSA is 245 bytes !!!
            string TEXTO = "Mi clave AES super secreta";

            // El usuario 1 genera sus llaves y escribe la clave pública (módulo+exponente) a fichero            
            RSACryptoServiceProvider rsa1 = new RSACryptoServiceProvider(3072);
            string pubXml = MRT.ExportPublicParametersToXml(rsa1);
            System.IO.File.WriteAllText(PATH1, pubXml);
            Console.WriteLine(pubXml);

            //El usuario 2 lee la clave pública de 1 para utilizarla   
            string pubXml1 = System.IO.File.ReadAllText(PATH1);
            RSAParameters pubPars1 = MRT.PublicParametersFromXml(pubXml1);
            //El usuario 2 encripta el TEXTO con la clave pública de 1
            var datosEncriptadosConPub1 = MRT.Encrypt(TEXTO, pubPars1);
            Console.WriteLine(datosEncriptadosConPub1);

            // //El usuario 1 desencripta los DATOS con su clave privada
            var datosDesencriptados = MRT.Decrypt(datosEncriptadosConPub1, rsa1);
            Console.WriteLine(datosDesencriptados);



            //Si el usuario 1 quisiese firmar algo lo haría con su clave privada (sólo él tiene esa clave)
            var signedData = MRT.SignedData(TEXTO, rsa1);
            Console.WriteLine(signedData);

            //Cualquier usuario, como el 2, que dispusiese de la clave pública de 1 podría validar el origen
            var b = MRT.VerifyData(TEXTO, signedData, pubPars1);
            Console.WriteLine(b);

        }

    }

    public class Utf8StringWriter : StringWriter
    {
        public override Encoding Encoding => Encoding.UTF8;
    }
}

// Ejemplo de ejecución:

// <?xml version="1.0" encoding="utf-8"?>
// <RSAParameters xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
//   <Exponent>AQAB</Exponent>
//   <Modulus>+tIwPm9HXIOH0stMHoVyNknthYfbu40k2NcMqXNvVs1hIwGp3CUtWsdnfQJtVEPyVSRC3gcb22IQ7MfvxE5QRGqsYJosL1waReblexDfGXM+K3FMHOxrKVdO/5K9vf8EKx/imGJnrn7xNYxJwp1LYLqqMpY62tbNMBWBZ3NyJQgNntXkEn60EQpZ9VoA5kpkMN1W8chu2EbRiCtfD7LLNEnQSRQ27uoETjrrhDcWsDja93D7Cl2Uefb1q8GP/orT+csOYuC/UFnCEXvzF3OGs26cchx68ljTe/3RmJixsMcEj5U0cRnfSHXP+OsB6DDmIj9413/Qyo1x/VczE2JHSq8yYDWcsExhsCFWbC7Ey6dG2RRjzuJvd+RXelrTWfGxSZdqsnPD0WQNBoWKGLy56F2G8wnHzD3ZHuYE2uwno1Vwl75hLMmdeIJXYq5Sd7A4l1h7PS2P+PLCQcpcs6JCl8OismeAWJZp90//Qn0dxLC5/rIGUHL4Aqcv/I2GKdG5</Modulus>
// </RSAParameters>
// AUnd6f0PQ9XYfAq/jDgYyQMR/d5spcL6mpqUjlQimnCYxaR0kXLx72NlLizo93+vnBfP1lSLZW4f1CRbX5b+DXQwhLCRguoGjFQPohDX+w2atTpfDokAebNP1q6fJqVW3xXwN6oGfufvJS/BGAa7oLvkXnaXTWm7ZzVyiVoDJCi2CafFtMCuv6ybL6ZNDdh1RqRz7JU46RbFuTNKZWT4DGWY5QCQYMMMuQatNG83LBVF0Zg7Z9susGAWhk5yFLLaav204Z0Hk3ZxaLgZxQn7hU4WVgVpUn9ejM71jynLLOyqwiszmqwzUvr1r9BFEhHzthrX1MH3W8hDiYC+FA3GCgcayXbyvlb/19+UQqL9CWMUZcxYNRz6S5nXeXvHbZEwHBzCugf61mS0aHSzSYb5j3TCNIY3Uq6SKhHCfKnX2mn9cyG+kob4aDKLuou0f3VkdjAC9gC15ZhuDlr5wwHXMBwXCcEUwqW9XqidB+zjISejv3nqupVl8JflZ3fqW8Hv
// Mi clave AES super secreta
// p1DyHkCB4z6E/LG7AHWDPastILbO0uW+sXSbevxlNMS/FKcTXiiTQPGxmzX4rUGgn6TZkU6TAZhvY93T12LBZRnSKubpWCejHydVtbzDNzlq0nXG6ifSDqO9CtkA/+CrIZzatN2IUXJogBuInZFKEGh4giww9IsdOXEixSZjXmKbHGmcBwAobL7YZrNxU7WvOaZXBWGPBt0ZAugk5eZXYByClbn3rZ8JY5Gf62g73UR4jCi4sXQVtSgn5lxEZQ9NcbtKmFKfs8SPTFMAuDZRisAQl2z2vN4IHK0W7PjiaAnXc+CfTaqDJNdoHmyVm2xwhnjNb3BVeZ44OWpVjrbNqQcPZnw8VO1YQF14al9eXprMRA+7TKXl/8ZCwlfw2FChyqtxpwOGuhRcXGMnC7I8StirJhU/4T9bIglmdTgua2DrtNx9QGOfxDLaDZhCLr1jkoEwOA1OTXNFE99tCodKxKSMIg8tOAKUQe8qsXsvU82wyoE5oV/lDj3GOdhvzAV0
// True