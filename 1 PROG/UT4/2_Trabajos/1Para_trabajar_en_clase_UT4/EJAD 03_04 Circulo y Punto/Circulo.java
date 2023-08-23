
/**
 * La clase representa a circulos con un centro
 * y un valor determinado de radio
 * 
 * @author 
 * @version 
 */
public class Circulo
{
    private final double PI = 3.14;
    private double radio;
    private Punto unPunto;
     /**
     * constructor para los objetos de la clase Circulo
     * 
     */
    public Circulo(int x, int y, double radio)
    {
       radio = 0;
       
    }
    
   
    /**
     * 
     * @return devuelve el radio del c�rculo    
     */
    public double getRadio()
    {
        return radio;
    }
    
        
      /**
     * 
     * @param   El nuevo valor del radio
     */
    public void setRadio(int nuevoRadio)
    {
        radio = nuevoRadio;
    }
    
    /**
     * @return devuelve el �rea del c�rculo
     */
    public double calcularArea()
    {
        return 2 * PI * radio * radio;
    }
    
    /**
     * @return devuelve el per�metro del c�rculo
     */
    public double calcularPer�metro()
    {
        return 2 * PI * radio;
    }
    
 
    
}
