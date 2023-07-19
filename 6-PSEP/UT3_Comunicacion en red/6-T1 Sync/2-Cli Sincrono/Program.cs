using System;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Text;
using System.Threading;

namespace clientesincrono {
    public class SynchronousSocketClient {

        public static void StartClient() {
            try {
//************************ SI NO TE DA, PUEDES PARSEAR TU IP ***************************
                // IPEndPoint localEndPoint = new IPEndPoint(IPAddress.Parse("TUIP"), 11000);
//**************************************************************************************

                //conexiones
                IPAddress ipAddress = getLocalIpAddress();//MAC OS
                IPEndPoint remoteEP = new IPEndPoint(IPAddress.Parse("192.168.1.127"), 11000);
                
                //socket para comunicarse con el servidor
                Socket sender = new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

                try {
                    //conectar con la ip y puerto del servidor
                    sender.Connect(remoteEP);
                    Console.WriteLine("Socket connected to {0}", sender.RemoteEndPoint.ToString());
                    
// -------------------------------- ejercicio 2 ---------------------------------------
                    bool control = true;
                    while (control) {
                        Console.Write("Enter integer: ");
                        int num = int.Parse(Console.ReadLine());
                        if (num == 0 || num == 1 || num == 2) {
                            //enviarlo al servidor (string a bytes)
                            byte[] msg = Encoding.ASCII.GetBytes(num.ToString() + "<EOF>");
                            int bytesSent = sender.Send(msg);
                            
                            //recibir msj de confirmacion del servidor
                            byte[] bytes = new byte[1024];
                            int byteRec = sender.Receive(bytes);
                            string texto = Encoding.ASCII.GetString(bytes, 0, byteRec);
                            Console.WriteLine("Servidor: {0}", texto);
                        } else {
                            //se termina el bucle
                            control = false;

                            //se envia "" y no un numero
                            byte[] msg = Encoding.ASCII.GetBytes("" + "<EOF>");
                            int bytesSent = sender.Send(msg);
                        }
                    }
                    Console.WriteLine("Valor no valido. FIN.");
// ------------------------------------------------------------------------------------
                    //cerrar conexion
                    sender.Shutdown(SocketShutdown.Both);
                    sender.Close();

                } catch (ArgumentNullException ane) {
                    Console.WriteLine("ArgumentNullException : {0}", ane.ToString());
                } catch (SocketException se) {
                    Console.WriteLine("SocketException : {0}", se.ToString());
                } catch (Exception e) {
                    Console.WriteLine("Unexpected exception : {0}", e.ToString());
                }

            } catch (Exception e) {
                Console.WriteLine(e.ToString());
            }
        }

        static IPAddress getLocalIpAddress() {
            IPAddress ipAddress = null;
            try {
                foreach (var netInterface in NetworkInterface.GetAllNetworkInterfaces()) {
                    if (netInterface.NetworkInterfaceType == NetworkInterfaceType.Wireless80211 ||
                        netInterface.NetworkInterfaceType == NetworkInterfaceType.Ethernet) {
                        foreach (var addrInfo in netInterface.GetIPProperties().UnicastAddresses) {
                            if (addrInfo.Address.AddressFamily == AddressFamily.InterNetwork) {
                                ipAddress = addrInfo.Address;
                            }
                        }
                    }
                }
                if (ipAddress == null) {
                    IPHostEntry ipHostInfo = Dns.GetHostEntry("127.0.0.1");
                    ipAddress = ipHostInfo.AddressList[0];
                }
            } catch (Exception) { }
            return ipAddress;
        }

        public static int Main(String[] args) {
            //En MACOS porque no se puede ordenar el orden de arranque: servidor, cliente
            Thread.Sleep(1000);
            StartClient();
            return 0;
        }
    }
}
// > dotnet run
// Socket connected to 192.168.1.104:11000
// Echoed test = This is a test