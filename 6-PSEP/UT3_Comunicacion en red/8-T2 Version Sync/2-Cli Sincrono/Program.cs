﻿using System;
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
                IPEndPoint remoteEP = new IPEndPoint(ipAddress, 11000);
                
                //socket para comunicarse con el servidor
                Socket sender = new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

                try {
                    //conectar con la ip y puerto del servidor
                    sender.Connect(remoteEP);
                    Console.WriteLine("Socket connected to {0}", sender.RemoteEndPoint.ToString());
                    
            // enviar datos -------------------------------------------------------------------------
                    string msgFinal = "";
                    int intento = 1;
                    while (intento <= 3) {
                        Console.WriteLine("Introduce usuario...");
                        string usuario = Console.ReadLine();
                        
                        Console.WriteLine("Introduce contraseña...");
                        string contra = Console.ReadLine();

                        byte[] msg = Encoding.ASCII.GetBytes(usuario + "*" + contra + "<EOF>");
                        int bytesSent = sender.Send(msg);

            // recibir datos ---------------------------------------------
                        byte[] bytes = new byte[1024];
                        int byteRec = sender.Receive(bytes);
                        string respSrv = Encoding.ASCII.GetString(bytes, 0, byteRec);
                        Console.WriteLine("Servidor: {0}", respSrv);

                        if (respSrv == "ACCESO PERMITIDO") {
                            msgFinal = "ACCESO A BASE DE DATOS";
                            break;
                        } else {
                            Console.WriteLine("Te quedan {0} intentos", 3 - intento);
                            Console.WriteLine("-----------------------------------");
                            msgFinal = "NO PUEDES ACCEDER A LA BASE DE DATOS";
                            intento++;
                        }
                    }
                    Console.WriteLine(msgFinal);
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