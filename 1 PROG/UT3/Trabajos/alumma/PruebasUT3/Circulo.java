
/** 
 *Representa a un circulo
 * @
 * @author- Chris
 * @version - 1.2
 */
public class Circulo {
    private final double PI = 3.1416;
    private double radio ;

    /**
     * Constructor 
     */
    public Circulo(double queRadio)
    {
        radio = queRadio;
    }

    /**
     * accesor para el radio
     *
     */
    public double getRadio()
    {

        return radio;
    }
    
    /**
     * Mutador para el radio
     */
    public void setRadio(double queRadio)
    {
        radio = queRadio;
    }

    /**
     * Calcular y devolver el area del circulo
     *
     */
    public double calcularArea()
    {
        double area = PI * radio * radio;
        return area;
    }

    /**
     * Calcular y devolver el perimetro del circulo
     */
    public double calcularPerimetro()
    {
        double perimetro = 2 * Math.PI * radio;
        return perimetro;
    }

    {
    }
}
