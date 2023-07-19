//lock hace que solo un hilo a la vez entre a la seccion critica
using System;
using System.Threading;

namespace EjemploLock
{
    class Program {
        private static int conteo = 0;
        private static bool ejecutar = true;

        //usamos este objeto para crear el lock
        private static object control = new object();
        private static int id1 = 0;
        private static int id2 = 0;

        public static void Main() {
            //crear hilos
            Thread hilo1 = new Thread(new ThreadStart(incremento));
            hilo1.Start();
            id1 = hilo1.ManagedThreadId;

            Thread hilo2 = new Thread(new ThreadStart(incremento));
            hilo2.Start();
            id2 = hilo2.ManagedThreadId;

            while (ejecutar) {
                if (conteo > 50) {
                    ejecutar = false;
                }
            }
        }

        static void incremento() {
            while (ejecutar) {
                //lock hace que solo un hilo a la vez entre a la seccion critica
                lock(control) {
                    //cambiamos color consola dependiendo del hilo actual
                    if (Thread.CurrentThread.ManagedThreadId == id1) {
                        Console.ForegroundColor = ConsoleColor.White;
                    } if (Thread.CurrentThread.ManagedThreadId == id2) {
                        Console.ForegroundColor = ConsoleColor.Green;
                    }

                    conteo = conteo + 1;
                    Console.WriteLine("-----");
                    Console.WriteLine(Thread.CurrentThread.ManagedThreadId + " -> " + conteo);
                    Thread.Sleep(200);
                }
            }
        }        
    }
}