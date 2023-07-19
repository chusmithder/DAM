/*
El cliente se debe conectar a la dirección del servidor al
puerto definido para ello. Como ambos se ejecutan en la 
misma máquina en las pruebas se utiliza el mismo mecanismo
para obtener la dirección IP del servidor (es la misma que
la del cliente). Para realizar la conexión se crea un socket
TCP llamado "sender" con el que se conecta al servidor. El
texto que se va a enviar se transforma a un array de bytes.
Se envían los bytes y se reciben otros bytes en otro array 
de bytes que se transforman en texto para ser mostrado. 
Finalmente se cierra el socket si no ha sido cerrado en el 
otro extremo por el servidor.

Si no se puede definir el orden de ejecución con indicando
que primero sea el servidor y luego el cliente se puede hacer
manualmente y por si acaso meter un Thread.Sleep en el cliente
 para que el socket de escucha del servidor sea creado. 
*/

using System;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Text;
using System.Threading;

namespace clientesincrono {
    public class SynchronousSocketClient {

        public static void StartClient() {
            // Data buffer for incoming data. 
            //array de bytes para recibir datos del servidor 
            byte[] bytes = new byte[1024];

            // Connect to a remote device.  
            try {
                // Establish the remote endpoint for the socket.  
                // This example uses port 11000 on the local computer.  
                //IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
                //IPAddress ipAddress = ipHostInfo.AddressList[0];
                IPAddress ipAddress = getLocalIpAddress();//MAC OS
                // IPEndPoint remoteEP = new IPEndPoint(ipAddress, 11000);

                //ip del servidor al que se ba a conectar
                IPEndPoint remoteEP = new IPEndPoint(IPAddress.Parse("192.168.1.127"), 11000);
                
                // Create a TCP/IP  socket.
                //socket para comunicarse con el servidor
                Socket sender = new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

                // Connect the socket to the remote endpoint. Catch any errors.  
                try {
                    //conectar con la ip y puerto del servidor
                    sender.Connect(remoteEP);

                    Console.WriteLine("Socket connected to {0}", sender.RemoteEndPoint.ToString());

                    // Encode the data string into a byte array.  
                    //convertir el texto ingresado por el cliente en un array de bytes
                    //para enviarlo al servidor
                    byte[] msg = Encoding.ASCII.GetBytes("This is a test");

                    // Send the data through the socket.
                    //enviar datos al servidor, devuelve el numero de bytes
                    int bytesSent = sender.Send(msg);

                    // Receive the response from the remote device.  
                    //recibir info
                    int bytesRec = sender.Receive(bytes);
                    Console.WriteLine("Echoed test = {0}", Encoding.ASCII.GetString(bytes, 0, bytesRec));

                    // Release the socket.  
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
            Thread.Sleep(4000);
            StartClient();
            return 0;
        }
    }
}
// > dotnet run
// Socket connected to 192.168.1.104:11000
// Echoed test = This is a test