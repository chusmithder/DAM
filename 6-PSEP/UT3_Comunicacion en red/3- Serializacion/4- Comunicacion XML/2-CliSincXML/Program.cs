using System;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Text;
using System.IO;
using System.Xml.Serialization;

namespace syncxmlcli
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

    public class SynchronousSocketClient
    {
        public static string NET_C = "192.168.1.0/24";//CASA (?)
        //public static string NET_C = "10.168.53.0/24";//AULA06
        public static int TAM = 1024;
        public static int PORT = 11000;

        public static void StartClient()
        {
            IPAddress ipAddress = GetLocalIpAddressLike(NET_C);
            IPEndPoint remoteEP = new IPEndPoint(ipAddress, PORT);

            Socket socket = new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

            socket.Connect(remoteEP);

            Console.WriteLine("Socket connected to {0}", socket.RemoteEndPoint.ToString());

            Message request = new Message { From = "11", To = "22", Msg = "Hola!", Stamp = "Aitor E." };

            Send(socket, request);

            Message response = Receive(socket);

            Console.WriteLine(response);

            socket.Shutdown(SocketShutdown.Both);
            socket.Close();
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
            StartClient();
            return 0;
        }
    }
}