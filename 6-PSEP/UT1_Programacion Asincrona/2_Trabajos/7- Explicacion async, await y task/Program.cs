using System.Threading;
using System.Threading.Tasks;

namespace AsyncSample
{
    class Program {
        static void Main(string[] args) {
            //para simular async en main, ya que main no puede ser async:
            Task.Run(async() => {
                Barman oBarman = new Barman();
                //programacion secuencial o sincrona
                //hago uno, termina, y luego empieza el otro
                
                Task<bool> tBool = oBarman.calientaSnack(); //solo cersiora que haga eso, y en seguida haga lo otro
                
                oBarman.hacerCoctel();

                //para asegurar que termine y obtener el resultado que va a regresar
                bool boolResult = await tBool;// se asegura que calientaSnack() termine en esta linea
                //si no pongo esto, a lo mejor termina o no y se termina el main
                //termina de hacer el coctel, espera hasta que termine el snack

            }).GetAwaiter().GetResult();

            
        } 

        public class Barman {
            //metodo asincrono: cuando se ejecuta 
            //otros metodos pueden hacerlo tambien
            public async Task<bool> calientaSnack() { //con esto dice ser asincrono, pero no hace nada asincrono internamente
                //simula calentar mientras hace algo mas
                Console.WriteLine("Mete el snack al horno");
                // Thread.Sleep(10000); //5s //esto no sirve para hacer caso real asincrono
                //debemos hacer algo que sea asincrono, por ejemplo metodo asincrono de una libreria de .net
                HttpClient cliente = new HttpClient();
                await cliente.GetAsync("http://youtube.com");

                Console.WriteLine("Saca el snack al horno");
                return true;
            }

            //esta tarea no es asincrona, ya que el coctel
            //se prepara sin interrupcion
            public void hacerCoctel() {//este no es asincrono ya que al hacer coctel debo estar ahi
                Console.WriteLine("Comienza a hacer coctel");
                // Thread.Sleep(5000); //tarda 10s en hacer coctel
                Console.WriteLine("Termina de hacer el coctel");
            }

        }
    }
}