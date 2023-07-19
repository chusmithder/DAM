using System;
using System.Threading;

namespace ExplicacionHilos2 {
    class Programa {
        static void Main(String[] args) {
            Thread t1 = new Thread(FirstFunction);
            Thread t2 = new Thread(SecondFunction);
            Thread t3 = new Thread(ThirdFunction);
            //nombres
            t1.Name = "First Thread";
            t2.Name = "Second Thread";
            t3.Name = "Third Thread";
            //prioridad
            t1.Priority = ThreadPriority.Lowest;
            t2.Priority = ThreadPriority.Highest;
            t3.Priority = ThreadPriority.AboveNormal;
            Console.WriteLine("Thread starts");
            t1.Start();
            t2.Start();
            t3.Start();
        }

        public static void FirstFunction(){
            for (int i = 0; i < 5; i++) {
                Console.WriteLine("First thread displays: " + i);
            }
        }
        public static void SecondFunction(){
            for (int i = 0; i < 5; i++) {
                Console.WriteLine("Second thread displays: " + i);
            }
        }
        public static void ThirdFunction(){
            for (int i = 0; i < 5; i++) {
                Console.WriteLine("Third thread displays: " + i);
            }
        }
    }
}