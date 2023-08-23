
/**
 * Write a description of class Triangulo_Rectangulo here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class TrianguloRectangulo
{
    // instance variables - replace the example below with your own
    private double cateto1;
    private double cateto2;

    /**
     * Constructor
     */
    public TrianguloRectangulo(double queCateto1, double queCateto2)
    {
        cateto1 = queCateto1;  // initialise instance variables
        cateto2 = queCateto2;  
    }

    /**
     * Accesor para cateto1
     */
    public double getCateto1()
    {
        return cateto1;
    }

    /**
     * Accesor para cateto2
     */
    public double getCateto2()
    {
        return cateto2;
    }

    /**
     * Mutador para cateto1
     */
    public void setCateto1(double queCateto1)
    {
        cateto1 = queCateto1;
    }

    /**
     * Mutador para cateto1
     */
    public void setCateto2(double queCateto2)
    {
        cateto2 = queCateto2;
    }

    /**
     * Mostrar datos del triangulo

     */
    public void printTriangulo()
    {
        System.out.println("Datos del triangulo");
        System.out.println("------------------");
        System.out.println("Cateto1" + cateto1);
        System.out.println("Cateto2" + cateto2);
    }

    /**
     * Calcular y devolver la hipotenusa
     */
    public double calcularHipotenusa()
    {
    // double hipotenusa = Math.sqrt(cateto1*cateto1 + cateto2*cateto2);
    double hipotenusa = Math.hypot(cateto1, cateto2);
    return hipotenusa;
    }
    
}
