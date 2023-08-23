
/**
 * Pruebas con la clase Scanner
 *  
 */
import java.util.Scanner;
public class PruebaScanner
{
	// variables de instancia
	private Scanner teclado;

	/**
	 * Constructor de la clase PruebaScanner
	 */
	public PruebaScanner()
	{
		teclado = new Scanner(System.in);
	}

	/**
	 * 
	 * 
	 * @param  
	 * @return     
	 */
	public void  test1()
	{
		System.out.println("Introduzca nombre: ");
		String nombre = teclado.next();
		System.out.println("Nombre: " + nombre);
		String restoLinea = teclado.nextLine();
		System.out.println("Resto de la línea: " + restoLinea);
	}
	
	public void  test2()
	{
	        int x, y;
		System.out.println("Introduzca números: ");
		x = teclado.nextInt();
		y = teclado.nextInt();
		System.out.println("Números: " + x + "  " + y );
		teclado.nextLine();
		String linea = teclado.nextLine();
		System.out.println("Línea completa: " + linea);
		
	}
	
	public void  test3()
	{
	        String str1, str2;
		System.out.println("Introduzca cadenas: ");
		str1 = teclado.nextLine();
		str2 = teclado.nextLine();
		System.out.println("Cadenas: " + str1 + " - " + str2 );
			
	}
	
	

 
 
}
