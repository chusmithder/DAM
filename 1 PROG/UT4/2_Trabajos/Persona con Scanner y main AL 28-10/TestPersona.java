import java.util.Scanner;
/**
 * Punto de entrada a la aplicación
 * 
 * Desde línea de comandos nos situamos en el directorio base del proyecto:
 *      C:\.....>java TestPersona
 */
public class TestPersona
{
    public static void main(String[] args)    {
        // Scanner teclado = new Scanner(System.in);  // creamos el teclado

        // // pedir datos al usuario (nombre, edad, sueldo y estado civil
        // // crear un objeto Persona y
        // // mostrar los datos de la persona
        // System.out.println("Teclea el nombre");
        // String nombre = teclado.nextLine();// para string no es strin g es nextLi

        // System.out.println("Teclea la edad");
        // int edad = teclado.nextInt();// para string no es strin g es nextLi

        // System.out.println("Teclea el sueldo");
        // double sueldo = teclado.nextDouble();// para string no es strin g es nextLi

        // teclado.nextLine(); //Ignorar Intro 

        // System.out.println("Teclea el estadi CIVIL" );
        // char estado = teclado.nextLine().charAt(0);// para string no es strin g es nextLi
        // //en charAt los espacios

        // Persona persona = new Persona (nombre, edad, sueldo, estado);
        // System.out.println(persona.toString());
        Scanner teclado = new Scanner(System.in);
        //pedir datos al usuario
        //crear un objeto Persona y mostrar los datos de la persona
        System.out.println("Teclee nombre: ");
        String nombre = teclado.nextLine();

        System.out.println("Teclee edad: ");
        int edad = teclado.nextInt();

        System.out.println("Teclee sueldo: ");
        double sueldo = teclado.nextDouble();

        teclado.nextLine(); //ignorar el intro ultimo

        System.out.println("Teclee estado civil: ");
        char estado = teclado.nextLine().charAt(0);

        Persona persona = new Persona(nombre, edad, sueldo, estado);
        System.out.println(persona.toString());
    }

    

}