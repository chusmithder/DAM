using System;

namespace parametros {
    class Program {
        
        static void Main(String[] args) {
            if (args.Length > 0) {
                Console.WriteLine(args[0]);
            } else {
                Console.WriteLine("no pars");
            }
            Console.ReadLine();
        }

    }
}