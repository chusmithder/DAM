import   java.util.Scanner;
public class TestPersona
{
	public static void main(String[] args)
	{
		Persona  p = new Persona();
		Scanner   teclado = new Scanner(System.in);
		String nombre;
		System.out.print(" Nombre de la persona  ");
		nombre = teclado.nextLine();
		p.setNombre(nombre);
		System.out.print("Edad de la persona  ");
		p.setEdad(teclado.nextInt());
		System.out.println(p.toString());
	}
}