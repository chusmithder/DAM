// using System;
// using System.IO;
// using System.Security.Cryptography;
// using System.Text;
// using System.Xml.Serialization;

// namespace MyRsaTools
// {
//     public  class Funciones {
//         public static RSAParameters llavePublica;
//         public static RSAParameters llavePrivada;

//         public void GenerarLlaves() {
//             using(var rsa = new RSACryptoServiceProvider(2048)) {
//                 rsa.PersistKeyInCsp = false;
//                 llavePublica = rsa.ExportParameters(false);
//                 llavePrivada = rsa.ExportParameters(true);
//             }
//         }

//         public byte[] Encriptar(byte[] msg) {
//             byte[] tCifrado = null;

//             using(var rsa = new RSACryptoServiceProvider(2048)) {
//                 rsa.PersistKeyInCsp = false;
//                 rsa.ImportParameters(llavePublica);
//                 tCifrado = rsa.Encrypt(msg, true);
//             }
//             return tCifrado;
//         }

//         public byte[] Desencriptar(byte[] msg) {
//             byte[] tDecifrado = null;

//             using(var rsa = new RSACryptoServiceProvider(2048)) {
//                 rsa.PersistKeyInCsp = false;
//                 rsa.ImportParameters(llavePrivada);
//                 tDecifrado = rsa.Decrypt(msg, true);
//             }
//             return tDecifrado;
//         }

//     }

//     public class Encriptacion{
//         // public byte[] desencriptado;

//         Funciones funciones = new Funciones();

//         string Encriptar(string mensaje) {
//             funciones.GenerarLlaves();
//             byte[] encriptado = funciones.Encriptar(Encoding.UTF8.GetBytes(mensaje));
//             return BitConverter.ToString(encriptado).Replace("-", "");
//         }

//         string Desencriptar(string enc) {
//             funciones.GenerarLlaves();
//             byte[] desencriptado = funciones.Desencriptar(Encoding.UTF8.GetBytes(enc));
//             // return Encoding.UTF8.GetString(desencriptado);
//             return Convert.ToBase64String(desencriptado, 0, desencriptado.Length);
//         }

//         // public static void Main() {
//         //     Encriptacion encriptacion = new Encriptacion();
//         //     string mensaje = "hola mundo";
//         //     string encriptado = encriptacion.Encriptar(mensaje);
//         //     Console.WriteLine(encriptado);
//         //     Console.WriteLine("------------------");

//         //     string desencriptado = encriptacion.Desencriptar(encriptado);
//         //     Console.WriteLine(desencriptado);
//         // }

//     }   
// }

