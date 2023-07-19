/*
Ejemplo de servidor y cliente síncrono que se comunican utilizando
xml. (Código debajo de la imagen)

En el lado del servidor se ha descomentado el código de los métodos
Receive y Send para mostrar el código xml recibido y enviado.
*/

using System;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.IO;
using System.Xml.Serialization;

namespace syncxmlsrv
{
    public class Message
    {
        public string From { get; set; }
        public string To { get; set; }
        public string Msg { get; set; }
        public string Stamp { get; set; }

        public override string ToString()
        {
            return $"From: {From}\nTo: {To}\n{Msg}\nStamp: {Stamp}";
        }
    }

    public class SynchronousSocketListener
    {
        public static int TAM = 1024;
        public static int PORT = 11000;
        public static string NET_C = "192.168.1.0/24";//CASA (?)
        //public static string NET_C = "10.168.53.0/24";//AULA06

        public static void StartListening()
        {
            byte[] bytes = new Byte[TAM];

            IPAddress ipAddress = GetLocalIpAddressLike(NET_C); 
            IPEndPoint localEndPoint = new IPEndPoint(ipAddress, PORT);

            Socket listener = new Socket(ipAddress.AddressFamily,
                SocketType.Stream, ProtocolType.Tcp);

            try
            {
                listener.Bind(localEndPoint);
                listener.Listen(10);

                while (true)
                {
                    Console.WriteLine("Waiting for a connection at {0}...", ipAddress);
                    Socket handler = listener.Accept();

                    Message request = Receive(handler);
                    Console.WriteLine(request);

                    Message response = new Message { From = "0", To = "11", Msg = "Adios!", Stamp = "A.E." };
                    Send(handler, response);

                    handler.Shutdown(SocketShutdown.Both);
                    handler.Close();
                }

            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }

            Console.WriteLine("\nPress ENTER to continue...");
            Console.Read();
        }

        public static IPAddress GetLocalIpAddressLike(string net_c)
        {
            string ipBeginning = net_c.Substring(0, net_c.LastIndexOf('.'));
            IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
            IPAddress ipAddress = ipHostInfo.AddressList[0];
            int t = ipHostInfo.AddressList.Length;
            string ip;
            for (int i = 0; i < t; i++)
            {
                ip = ipHostInfo.AddressList[i].ToString();
                //Console.WriteLine(ip);//Imprime las IPs disponibles
                if (ip.StartsWith(ipBeginning))
                {
                    ipAddress = ipHostInfo.AddressList[i];
                }
            }
            return ipAddress;
        }

        private static void Send(Socket socket, Message message)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(Message));
            Stream stream = new MemoryStream();
            serializer.Serialize(stream, message);
            byte[] byteData = ((MemoryStream)stream).ToArray();
            // string xml = Encoding.ASCII.GetString(byteData, 0, byteData.Length);
            // Console.WriteLine(xml);
            int bytesSent = socket.Send(byteData);
        }

        private static Message Receive(Socket socket)
        {
            byte[] bytes = new byte[TAM];
            int bytesRec = socket.Receive(bytes);
            string xml = Encoding.ASCII.GetString(bytes, 0, bytesRec);
            // Console.WriteLine(xml);
            byte[] byteArray = Encoding.ASCII.GetBytes(xml);
            MemoryStream stream = new MemoryStream(byteArray);
            Message response = (Message)new XmlSerializer(typeof(Message)).Deserialize(stream);
            return response;
        }

        public static int Main(String[] args)
        {
            StartListening();
            return 0;
        }
    }
}