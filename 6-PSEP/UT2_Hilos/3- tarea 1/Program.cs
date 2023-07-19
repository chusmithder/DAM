using System;
using System.Threading;

// Construye la siguiente aplicación:
// Se deben crear cinco hilos a partir de un único objeto. 
// Cada hilo será identificado por un nombre y un número, del 1 al 5.
// Todos los hilos comparten una variable, contador.
// Los hilos son creados de manera simultánea
// Todos los hilos intentarán acceder a la variable contador. Cuando accedan, deberán sumar su número de hilo al contador y dormir 3 segundos.
// Cuando accedan, deben asegurarse que ningún otro hilo podrá acceder al contador (control de la concurrencia).
public class Tarea1 {
    public  static int contador = 0;
    public static object control = new Object();
    public static void Main() {
        //crear hilos, establecer nombre, inicializar, 
        for (int i = 1; i <= 5; i++) {
            Thread h = new Thread(new ThreadStart(ThreadProc));
            h.Name = i.ToString();
            h.Start();
        }
    }

    public static void ThreadProc() {
        //hacer consultas sobre el hilo actual
        //hacer un join() para bloquear cierto hilo
        lock(control) {
            contador = contador + int.Parse(Thread.CurrentThread.Name);
            Console.WriteLine("hilo {0} -> contador: {1}", Thread.CurrentThread.Name, contador);
            Thread.Sleep(3000);
        }
    }
}