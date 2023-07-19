using System;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Text;

namespace servidorsincrono
{
    public class SynchronousSocketListener
    {
       
        public static int TAM = 1024;
        // public static string data = null;

        public static void StartListening()
        {
            

//************************ SI NO TE DA, PUEDES PARSEAR TU IP ***************************
            // IPEndPoint localEndPoint = new IPEndPoint(IPAddress.Parse("TUIP"), 11000);
//**************************************************************************************
            
            //conexiones
            IPAddress ipAddress = getLocalIpAddress();//MAC OS
            IPEndPoint localEndPoint = new IPEndPoint(IPAddress.Parse("192.168.1.127"), 11000); 
            
            //socket de espera a conexiones
            Socket listener = new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);
            
            try
            {
                //asignar al socket la ip del servidor y el puerto 
                listener.Bind(localEndPoint);

                //numero maximo de conexiones en espera (si ya existe conexion)
                listener.Listen(10);

                // Start listening for connections
                while (true)
                {
                    // Program is suspended while waiting for an incoming connection.
                    Console.WriteLine("Esperando una conexion ...");
                    
                    //se acepta la conexion
                    Socket handler = listener.Accept();//aceptar conexion del cliente
                    Console.WriteLine("Conexion aceptada ...");
                    
                    //array de ocurrencias de 0, 1 y 2
                    int[] ocurrencias = new int[]{0, 0, 0}; //[0s,1s,2s]

                    //bucle para recibir varios mensajes
                    while (true)
                    {
                        //almacenar datos
                        string data = "";

                        //para recibir datos del cliente
                        byte[] bytes = null;

                        //bucle para solo un mensaje
                        while (true) 
                        {
                            bytes = new byte[1024];

                            //recibimos el mensaje del cliente
                            int byteRec = handler.Receive(bytes);

                            //convertimos el mensaje de bytes a string
                            data = Encoding.ASCII.GetString(bytes, 0, byteRec);

                            //si termina por <EOF> termina de enviarse ese unico msj
                            if (data.IndexOf("<EOF>") > -1) {
                                break;
                            }
                        }
                        //quitamos <EOF> de data
                        data =  data.Replace("<EOF>", "");
                        if (data == "") 
                        {
                            break;
                        } 
                        else
                        {
                            int num = int.Parse(data);
                            
                            // incrementar la ocurrencia de un numero
                            ocurrencias[num]++;

// -------------------------------- ejercicio 1 ---------------------------------------
                            Console.WriteLine("{0} sent: {1}", handler.RemoteEndPoint, data);
// ------------------------------------------------------------------------------------

// -------------------------------- ejercicio 3 ---------------------------------------
                            Console.WriteLine("[0]: {0} [1]: {1} [2]: {2} ", ocurrencias[0], ocurrencias[1], ocurrencias[2]);
// ------------------------------------------------------------------------------------

                            //enviar mensaje de confirmacion al cliente
                            byte[] msg = Encoding.ASCII.GetBytes("recibido");
                            handler.Send(msg);
                        }
                        
                    }
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

        static IPAddress getLocalIpAddress()
        {
            IPAddress ipAddress = null;
            try
            {
                foreach (var netInterface in NetworkInterface.GetAllNetworkInterfaces())
                {
                    if (netInterface.NetworkInterfaceType == NetworkInterfaceType.Wireless80211 ||
                        netInterface.NetworkInterfaceType == NetworkInterfaceType.Ethernet)
                    {
                        foreach (var addrInfo in netInterface.GetIPProperties().UnicastAddresses)
                        {
                            if (addrInfo.Address.AddressFamily == AddressFamily.InterNetwork)
                            {
                                ipAddress = addrInfo.Address;
                            }
                        }
                    }
                }
                if (ipAddress == null)
                {
                    IPHostEntry ipHostInfo = Dns.GetHostEntry("127.0.0.1");
                    ipAddress = ipHostInfo.AddressList[0];
                }
            }
            catch (Exception) { }
            return ipAddress;
        }

        public static int Main(String[] args)
        {
            StartListening();
            return 0;
        }
    }
}
// > dotnet run
// Waiting for a connection...
// Text received : This is a test
// Waiting for a connection...
//