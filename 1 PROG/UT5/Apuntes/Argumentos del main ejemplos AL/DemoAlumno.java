
/**
 *  
 */
public class DemoAlumno
{

    /**
     *  
     *  Aceptar como argumentos del main el nombre y la nota de un alumno
     *  crear un objeto Alumno y mostrar su representación
     */
    public static void main(String[] args)    {
       System.out.println("Probando ....");
        if(args.length != 2){
            System.out.println("error en el n de argumentos" + 
            "Sintaxis: java DemoAlumno <nombre> <nota>" );
        }
        else{
            String nombre = args[0];
            int nota = Integer.parseInt(args[1]);
            Alumno alumno = new Alumno(nombre, nota);
            System.out.println(alumno.toString());
        }
    }
}
