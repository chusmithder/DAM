
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
    private Punto centro;

    /**
     * constructor para los objetos de la clase Circulo
     * 
     */
    public Circulo(double radio, Punto centro){
        this.radio = radio;
        this.centro = centro;
    }

    /**
     * Constructor para los objetos de la clase circulo
     */
    public Circulo(double radio) {
        this.radio = radio;
        centro = new Punto(0, 0);
    }

    /**
     * 
     * @return devuelve el radio del círculo    
     */
    public double getRadio()
    {
        return radio;
    }

    /**
     * 
     */
    public Punto getCentro() {
        return centro; //devuelve una referencia a centro
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
     * @return devuelve el área del círculo
     */
    public double calcularArea()
    {
        return 2 * PI * radio * radio;
    }

    /**
     * @return devuelve el perímetro del círculo
     */
    public double calcularPerímetro()
    {
        return 2 * PI * radio;
    }

    /**
     * 
     */
    public void setCenrtoX(int x) {
        centro.setX(x);
    }

    /**
     * 
     */
    public void setCenrtoY(int y) {
        centro.setY(y);
    }

    /**
     * 
     */
    public void printCirculo() {
        System.out.println(centro.toString() + "Radio: " + radio);
    }

    /**
     * 
     */
    public String toString() {
        return centro.toString() + "\n" + "Radio: " + radio;
    }

}
