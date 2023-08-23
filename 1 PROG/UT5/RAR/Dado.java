
/**
 *  Modela un dado
 */
import java.util.Random;
public class Dado
{
	private int cara;
	private Random generador;

	/**
	 * Constructor de la clase Dado
	 */
	public Dado()
	{
		generador = new Random();
		cara = 1;
	}

	/**
	 * 
	 * 
	 * @param  
	 * @return     
	 */
	public int getCara()
	{
		
		return cara;
	}
	
	/**
	* Simula el lanzamiento de un  dado
	*/
	public void tirarDado()
	{
		
		cara = generador.nextInt(6) + 1;
	}
}
