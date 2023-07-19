// using System;
// using System.IO;
// using System.Security.Cryptography;
// using System.Text;
// using System.Xml.Serialization;

// namespace MyRsaTools
// {
//     public class RsaEncryption {
//         private static RSACryptoServiceProvider csp = new RSACryptoServiceProvider(2048);
//         private static RSAParameters _privateKey;
//         private static RSAParameters _publicKey;

//         public RsaEncryption() {
//             _privateKey = csp.ExportParameters(true);
//             _publicKey = csp.ExportParameters(false);
//         }

//         public string GetPublicKey() {
//             var sw = new StringWriter();
//             var xs = new XmlSerializer(typeof(RSAParameters));
//             xs.Serialize(sw, _publicKey);
//             return sw.ToString();
//         }

//         public void setPublicKey() {

//         }

//         public string GetPrivateKey() {
//             var sw = new StringWriter();
//             var xs = new XmlSerializer(typeof(RSAParameters));
//             xs.Serialize(sw, _privateKey);
//             return sw.ToString();
//         }

//         public string Encrypt(string plainText) {
//             csp = new RSACryptoServiceProvider();
//             csp.ImportParameters(_publicKey);
//             var data = Encoding.Unicode.GetBytes(plainText);
//             var cypher = csp.Encrypt(data, false);
//             return Convert.ToBase64String(cypher);
//         }

//         public string Decrypt(string cypherText) {
//             var dataBytes = Convert.FromBase64String(cypherText);
//             csp.ImportParameters(_privateKey);
//             var plainText = csp.Decrypt(dataBytes, false);
//             return Encoding.Unicode.GetString(plainText);;
//         }
//     }

//     public class Test{
//         public static void Main() {
//             RsaEncryption rsa = new RsaEncryption();
//             string cypher = string.Empty;

//             Console.WriteLine("Public key: {0}\n", rsa.GetPublicKey());
//             Console.WriteLine("-----------------");
//             Console.WriteLine(rsa.GetPrivateKey());

//             Console.WriteLine("Enter yout text to encrypt: ");
//             var text = Console.ReadLine();
//             if (!string.IsNullOrEmpty(text)) {
//                 cypher = rsa.Encrypt(text);
//                 Console.WriteLine(cypher);
//             }

//             Console.WriteLine("Press to decrypt: ");
//             Console.ReadLine();
//             var plainText = rsa.Decrypt(cypher);
//             Console.WriteLine("Decrypted message: {0}",plainText);
//             Console.ReadLine();
//         }
//     }
// }