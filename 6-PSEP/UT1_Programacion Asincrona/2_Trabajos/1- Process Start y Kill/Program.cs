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
            while (opcion != 5) {
                switch(opcion) {
                    case 1: CalcButton_Click();
                        break;
                    case 2: NotepadButton_Click();
                        break;
                    case 3: WriteArg_Click();
                        break;
                    case 4: KillWriteArg_Click();
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
            Console.WriteLine("2 - Abrir archivo de notepad");
            Console.WriteLine("3 - Write");
            Console.WriteLine("4 - Hill process");
            Console.WriteLine("5 - Salir");
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
            return opcion >= 1 && opcion <= 5;
        }

        private void borrarPantalla() {
            Console.Clear();
        }
        
        private void CalcButton_Click() {
            ProcessStartInfo p = new ProcessStartInfo("calc.exe");
            Process.Start(p);
        }

        private void NotepadButton_Click() {
            ProcessStartInfo pInfo = new ProcessStartInfo();
            var prog = @"notepad";
            var arg = @"C:\projects\csharp\pstartgui\MainWindow.xaml.cs";
            ProcessStartInfo p = new ProcessStartInfo(prog, arg);
            Process.Start(p);
        }

        private void WriteArg_Click() {
            if(p1 == null) {
                var prog = @"C:\Users\chusm\Desktop\DAM2 Trabajos\PSEP\EJERCICIOS\2- WASP\writearg\bin\Debug\net6.0\writearg.exe";
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
                Console.WriteLine("El proceso no se ha creado, no se puede ejecutar metodo ");
            }
            }
        }

    }
