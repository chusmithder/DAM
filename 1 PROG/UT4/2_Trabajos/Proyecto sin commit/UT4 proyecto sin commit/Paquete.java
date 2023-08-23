import java.util.Random;
/**
 *  Un objeto de esta clase guarda los datos de un
 *  paquete
 * 
 * @author - Christhoper Pinday Delgado
 *  
 */
public class Paquete 
{
    private Random generador;
    private Dimension dimension;
    private double peso;

    /**
     * Constructor 1 sin parámetros
     * Crea el paquete con 40 , 30, 50 de
     * alto, ancho, largo (en cm) y peso 8 Kg
     */
    public Paquete()    {
        dimension = new Dimension(40, 30, 50);
        peso = 8;
    }

    /**
     * Constructor 2 
     *  Crea el paquete con el alto, ancho, largo (en cm) indicados
     *  y peso un valor aleatorio entre 2 y 8 Kg inclusive
     *  Se crea aquí el generador
     */
    public Paquete(double alto, double ancho, double largo)    {
        generador = new Random();
        dimension = new Dimension(alto, ancho, largo);
        peso = generador.nextInt(7) + 2;
    }

    /**
     * Constructor 3 
     * Crea el paquete a la dimension y peso indicados
     * 
     */
    public Paquete(Dimension dimension, double peso)    {
        this.dimension = new Dimension(dimension.getAlto(), dimension.getAncho(), dimension.getLargo());
        this.peso = peso;
    }

    /**
     * accesor para la dimensión
     */
    public Dimension getDimension() {
        return this.dimension;

    }

    /**
     * accesor para el peso
     */
    public double getPeso() {
        return this.peso;

    }

    /**
     * calcula y devuelve el volumen del paquete (en cm3)
     * El volumen = alto x ancho x largo
     */
    public double calcularVolumen() {
       return dimension.getAlto() * dimension.getAncho() * dimension.getLargo();

    }

    /**
     * calcula y devuelve el peso volumétrico del paquete (en Kg)
     * Peso volumétrico = volumen del paquete / 5000
     */
    public double calcularPesoVolumetrico() {
       return  calcularVolumen() / 5000;
    }

    /**
     *  Devuelve el peso facturable de un paquete
     *  Siempre es el valor mayor entre su peso real y su peso volumétrico
     *  es el valor que se utiliza para calcular el coste de envío del paquete
     *      
     */
    public double calcularPesoFacturable() {
        double mayor;
        if(calcularPesoVolumetrico() > peso){
            mayor = calcularPesoVolumetrico();
        }
        else{
            mayor = peso;
        }
        return mayor;
    }

    /**
     * Devuelve una copia exacta al objeto actual
     * Se obtienen copias también de los objetos que contenga
     */
    public Paquete obtenerCopia() {
       Paquete copia = this;
       return copia;
    }

    /**
     * Representación textual del paquete
     *  (leer enunciado)
     */
    public String toString() {
        String resul = "";
        resul += String.format("%20s\n", "Descripción del paquete: ");
        resul += dimension.toString();
        resul += String.format("%20s %10.2f(cm3)\n", "Volumen: ", calcularVolumen());
        resul += String.format("%20s %10.2f(kg)\n", "Peso volumétrico: ", calcularPesoVolumetrico());
        return resul;
    }
    
    /**
     * Muestra en pantalla el objeto actual
     * Este método se incluye como método de prueba
     * de la clase Paquete
     */
    public void print() {
        System.out.println(this.toString());
    }  

}
