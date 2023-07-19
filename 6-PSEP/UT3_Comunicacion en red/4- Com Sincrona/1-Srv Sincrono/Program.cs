/*
El servidor local escucha en la dirección IP de la red local en el puerto
definido creando para ello un socket TCP referenciado como "listener". El
programa servidor entra en suspensión hasta que entra una conexión para 
la cual se crea un nuevo socket designado como "handler". Mediante este 
último socket se recibe la información del cliente en un buffer limitado 
de bytes que en este caso se concatenan a un string cada vez que se llena
el buffer con la información recibida. Al finalizar la recepción se
muestra el mensaje recibido, se convierte en otro array de bytes y 
se envía al cliente por el mismo socket "handler". Seguidamente se cierra
la conexión.
*/
using System;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Text;

namespace servidorsincrono
{
    public class SynchronousSocketListener
    {
        /*
        Un socket es un punto final de un enlace de comunicación
        bidireccional entre dos programas que se ejecutan en la red.
        Un socket está vinculado a un número de puerto para que la
        capa TCP pueda identificar la aplicación a la que se enviarán
        los datos. Un punto final es una combinación de una dirección
        IP y un número de puerto
        */

        public static int TAM = 1024;

        // Datos entrantes del cliente
        public static string data = null;

        public static void StartListening()
        {
            // Data buffer for incoming data.  
            //array de bytes, info a recibir
            byte[] bytes = new Byte[TAM];

            //configuracion para recibir las conexiones
            /*
            IPHostEntry host = Dns.GetHostEntry("localhost");
            IPAddress iPAddress = host.AddressList[0];
            IPEndPoint localEndPoint = new IPEndPoint(iPAddress, 11000);
            */

            // Establish the local endpoint for the socket.  
            // Dns.GetHostName returns the name of the   
            // host running the application.  
            //IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
            //IPAddress ipAddress = ipHostInfo.AddressList[0];
            IPAddress ipAddress = getLocalIpAddress();//MAC OS
            //ip del servidor, un puerto no ocupado por la pc del server
            // IPEndPoint localEndPoint = new IPEndPoint(ipAddress, 11000);
            IPEndPoint localEndPoint = new IPEndPoint(IPAddress.Parse("192.168.1.127"), 11000);
            // Create a TCP/IP socket.  
            Socket listener = new Socket(ipAddress.AddressFamily,
                SocketType.Stream, ProtocolType.Tcp);

            // Bind the socket to the local endpoint and   
            // listen for incoming connections. 
            //unir el socket con el endpoint local y
            //escuchar por conexiones entrantes
            try
            {
                //asignar al socket la ip del servidor y el puerto 
                //por el que escucha
                listener.Bind(localEndPoint);
                //numero maximo de conexiones en espera (si ya existe conexion)
                listener.Listen(10);

                // Start listening for connections. 
                //los sockets envian y reciben bytes (no string, ...)
                while (true)
                {
                    Console.WriteLine("Waiting for a connection...");
                    // Program is suspended while waiting for an incoming connection.  
                    Socket handler = listener.Accept();//aceptar conexion del cliente
                    Console.WriteLine("Conexion aceptada...");
                    //listo para trabajar

                    data = null;
                    //recibir info en bytes
                    //bytes: donde se alamacena info
                    int bytesRec = handler.Receive(bytes);
                    //num de bytes que nos envio el cliente
                    // handler.Receive(bytes, 0, bytes.Length, 0);
                    
                    //convierte bytes recibidos en un string
                    data += Encoding.ASCII.GetString(bytes, 0, bytesRec);
                    // An incoming connection needs to be processed.  
                    while (bytesRec == TAM)
                    {
                        bytesRec = handler.Receive(bytes);
                        data += Encoding.ASCII.GetString(bytes, 0, bytesRec);
                    }

                    // Show the data on the console.  
                    Console.WriteLine("Text received : {0}", data);

                    // Echo the data back to the client.  
                    //convierte string en bytes para enviarlo
                    byte[] msg = Encoding.ASCII.GetBytes(data);

                    handler.Send(msg);
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