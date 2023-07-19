using System;
using System.Diagnostics;
using System.Threading;


namespace pstartgui {
    
    public  class MainWindow  {

        private Process p1 = null;
        public MainWindow() {
            ejecutar();
        }
        static void Main(string[] args){
            MainWindow main = new MainWindow();
        }
        
        public void ejecutar() {
            borrarPantalla();
            int opcion = menu();
            while (opcion != 6) {
                switch(opcion) {
                    case 1: abrirCalculadora();
                        break;
                    case 2: abrirYTenChrome();
                        break;
                    case 3: AbrirArchivoEnNotepad();
                        break;
                    case 4: KillWriteArg_Click();
                        break;
                    case 5: writearg();
                        break;
                }
                // esperar(5000); //eperar 5 segundos
                // borrarPantalla();
                opcion = menu();
            }

        }

        private void esperar(int milisegundos) {
            Thread.Sleep(milisegundos);
        }

        private int menu() {
            Console.WriteLine("-- MENU --");
            Console.WriteLine("1 - Abrir calculadora");
            Console.WriteLine("2 - Abrir youtube en Chrome");
            Console.WriteLine("3 - Abrir archivo en bloc de notas");
            Console.WriteLine("4 - Hill process");
            Console.WriteLine("5 - Writearg");
            Console.WriteLine("6 - Salir");
            int opcion = leerOpcion("Introduzca una opcion");
            while (!opcionCorrecta(opcion)) {
                opcion = leerOpcion("Error, introduzca opcion correcta");
            }
            return opcion;
        }

        private int leerOpcion(String mensaje) {
            int opcion;
            try {
                Console.WriteLine(mensaje);
                opcion = int.Parse(Console.ReadLine());
                
            } catch (Exception e) {
                opcion = 0; // opcion incorrecta
            }
            return opcion;
        }

        private bool opcionCorrecta(int opcion) {
            return opcion >= 1 && opcion <= 6;
        }

        private void borrarPantalla() {
            Console.Clear();
        }
        
        private void abrirCalculadora() {
            ProcessStartInfo p = new ProcessStartInfo("calc.exe");
            Process.Start(p);
        }

        private void abrirYTenChrome() {
            ProcessStartInfo pInfo = new ProcessStartInfo();
            var prog = @"C:\Program Files\Google\Chrome\Application\chrome.exe";
            var arg = @"https://www.youtube.com/watch?v=yrvSq0g0hh8";
            ProcessStartInfo p = new ProcessStartInfo(prog, arg);
            Process.Start(p);
        }

        
        private void AbrirArchivoEnNotepad() {
            ProcessStartInfo pInfo = new ProcessStartInfo();
            var prog = @"notepad";
            var arg = @"C:\Users\chusm\Desktop\DAM2 Trabajos\PSEP\EJERCICIOS\3- Tarea 1\Program.cs";
            ProcessStartInfo p = new ProcessStartInfo(prog, arg);
            Process.Start(p);
        }

        private void writearg() {
            if(p1 == null) {
                var prog = @"C:\Users\chusm\Desktop\DAM2 Trabajos\PSEP\EJERCICIOS\3- Tarea 1\bin\Debug\net6.0\3- Tarea 1.exe";
                var arg = "texto";//ParTextBox.Text;
                ProcessStartInfo info = new ProcessStartInfo(prog, arg);
                // su valor por defecto es false, si se establece a true no se "crea" ventana
                info.CreateNoWindow = false;
                info.WindowStyle = ProcessWindowStyle.Normal;
                // indica si se utiliza el cmd para lanzar el proceso
                info.UseShellExecute = true;
                // iniciar el proceso
                p1 = Process.Start(info);
            }
        }

        private void KillWriteArg_Click() {
            if(p1 != null && !p1.HasExited) {
                p1.Kill();
                p1 = null;
            } else {
                Console.WriteLine("El proceso no se ha creado, no se puede detener metodo ");
            }
            }
        }

    }
