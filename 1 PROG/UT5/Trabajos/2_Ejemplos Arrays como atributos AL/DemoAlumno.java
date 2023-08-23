import java.util.Scanner;

/**
 * 
 *
 */
public class DemoAlumno
{

    /**
     *  
     *  
     */
    public static void main(String[] args)
    {
        Scanner teclado = new Scanner(System.in);
        System.out.print("Dame nombre del alumno/a: ");
        String nombre = teclado.nextLine();
        Alumno alumno = new Alumno(nombre);
        // pedimos sus asignaturasy las registramos
        for (int n = 1; n <= Alumno.MAX_ASIGNATURAS; n++)        {
            System.out.print("Dame nota " + n + " del alumno/a: ");
            int nota = teclado.nextInt();
            alumno.registrarNota(nota);
        }
        System.out.println("\nInformación  del alumno/a: " + alumno.toString());
        System.out.print("Total suspensos " + alumno.totalSuspensos());
    }
}
