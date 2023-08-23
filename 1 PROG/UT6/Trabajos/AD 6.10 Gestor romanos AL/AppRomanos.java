 
/**
 * La clase que inicia el gestor de romanos
 * 
 */
public class AppRomanos
{
    public static void main (String[] args) {
        if (args.length == 0) {
            System.out.println("Error, Sintaxis: java AppRomanos <romano1> <romano2> <romano3> ....");
        }
        else {
            GestorRomanos gr = new GestorRomanos(new ConversorRomanos());
            gr.añadirRomanos(args);
            gr.escribirListaArabigos();
        }
         }
        
        
        
}
