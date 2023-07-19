using System;
using System.Diagnostics;
using System.Threading;

class program
{
    static void Main(string[] args)
    {
        //ejecuta el programa y le pasa el parametro
    //    var prog = @"C:\Users\AlumMA\Desktop\Trabajos\PSEP\UT1\EJ2\writearg\bin\Debug\net6.0\writearg.exe"; 
    //    var arg = "hola";
    //    Process.Start(prog, arg);
    //    Process.Start(prog, arg);
       // Ver writearg en ProcessExplorer (SysinternalsSuite)
       // y terminar los dos procesos si es el caso.
       //getProcessByName // async / await: ( 2 o mas a la vez) 
        
        var prog = @"C:\Users\chusm\Desktop\DAM2 Trabajos\PSEP\EJERCICIOS\1-WASP\writearg\bin\Debug\net6.0\writearg.exe";
        var arg = "Hola";
        Process.Start(prog, arg);
        Process p = Process.Start(prog, arg);
        p.Kill();
    }
}