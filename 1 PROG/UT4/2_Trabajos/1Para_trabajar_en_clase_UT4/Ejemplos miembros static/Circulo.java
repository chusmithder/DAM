import java.util.Random;
/**
 *  
 * 
 * Clase que contiene miembros static
 */
public class Circulo
{
    
    public static final double PI = 3.1416; //static se asocia a la clase, lo unico habitual para ponerlo en public
    private static Random generador = new Random();
    private static int contadorCirculos = 0; //se crea solo una para la clase
    private double radio;
    private int numero;
   
    /**
     * Constructor  
     */
    public Circulo(double radio)
    {
         contadorCirculos ++;
         numero = contadorCirculos;
         this.radio = radio;
         // numero++;
         //para evitar el problema
    }
    
    /**
     *    
     * 
     */
    public double getPerimetro()
    {
         return 2 * PI * radio;
    }
    
    /**
     *    
     * 
     */
    public  static int getContadorCirculos()
    {
         return contadorCirculos;
    }
    
    /**
     *  
     */
    public String toString()
    {
        return "Círculo: " + this.numero + 
                "\nRadio:" + radio + "\n";
    }
}
