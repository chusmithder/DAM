using System;
using System.Threading;


public class Tarea1 {
    public static void metodo() {
        // var ran = new Random();
        // int random = ran.Next(1, 5);
        Thread actual = Thread.CurrentThread;
        // Console.WriteLine("el hllo es: {0}", actual.ManagedThreadId);
        Console.WriteLine("el hllo es: {0}", actual.Name);
        // Thread.Sleep(random * 1000);
        Thread.Sleep(3000);
    }


    public static void Main() {
        Console.WriteLine("Creador de hilos");
        for (int i = 0; i < 5; i++) {
            Thread hilo = new Thread(new ThreadStart(metodo));
            hilo.Name = i.ToString();
            //
            // ThreadState estado = h.ThreadState;
            
            switch(i) {
                case 0:     hilo.Priority = ThreadPriority.Lowest;
                    // lock (h) {
                    //     Monitor.TryEnter(h, TimeSpan.FromMilliseconds(4000), false);
                    // }
                    break;
                case 1:     hilo.Priority = ThreadPriority.BelowNormal;
                    break;
                case 2:     hilo.Priority = ThreadPriority.Normal;
                    break;
                case 3:     hilo.Priority = ThreadPriority.AboveNormal;
                    break;
                case 4:     hilo.Priority = ThreadPriority.Highest;
                    break;  
            }
            hilo.Start();
            // hilo.Join();
        }
    }
}