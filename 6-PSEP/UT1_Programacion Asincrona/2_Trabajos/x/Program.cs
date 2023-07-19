using System.Threading;
using System.Threading.Tasks;

namespace AsyncSample
{
    //definir un task con una funcion dentro es como declarar una funcion asincrona, 
    //y al darle start es como ejecutar ese metodo asincrono
    class Program {
        public static async Task Main() {
            var task = new Task(() => {
                Thread.Sleep(1000);
                Console.WriteLine("Tarea interna 1 del task");
            });
            task.Start();//similar a invocar un metodo asincrono

            var task2 = new Task(() => {
                Console.WriteLine("Tarea interna 2 del task");
            });
            task2.Start();

            int res = await MultAsync(5);
            Console.WriteLine(res);
            Console.WriteLine("Hago algo mas");
            await task;//espera a que termine task en este punto
            await task2;
            // int res = await tInt;
            //no pases a la siguiente linea hasta que termines task
            Console.WriteLine("He terminado la tarea");
        }

        public static async Task<int> MultAsync(int num) {
            var task = new Task<int>(() => {
                return num * num;
                });
            task.Start();
            int resul = await task;
            return resul;
        }
    }
}