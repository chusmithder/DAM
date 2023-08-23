
/**
 *  Representa una dimensión
 *  
 *  @author - Christhoper Pinday Delgado
 */
public class Dimension  
{
    private double alto;
    private double ancho;
    private double largo;

    /**
     * constructor  
     */
    public Dimension(double alto, double ancho, double largo)    {
        this.alto = alto;
        this.ancho = ancho;
        this.largo = largo;

    }   

    /**
     * accesor para  el alto
     */
    public double getAlto()    {
        return alto;
    }

    /**
     * accesor para  el ancho
     */
    public double getAncho()    {
        return ancho;
    }

    /**
     * accesor para  el largo
     */
    public double getLargo()    {
        return largo;
    }

    /**
     * Devuelve una copia exacta al objeto actual
     */
    public Dimension obtenerCopia() {
        return new Dimension(alto, ancho, largo);
    }

    /**
     * Repesentación textual de la dimensión
     * (leer enunciado)
     */
    public String toString() {
        String resul = "";
        resul += String.format("%20s %10.2f(cm)\n", "Alto: ", alto);
        resul += String.format("%20s %10.2f(cm)\n", "Ancho: ", ancho);
        resul += String.format("%20s %10.2f(cm)\n", "Largo: ", largo);
        return resul;
    }

    /**
     * Muestra en pantalla el objeto actual
     * Este método se incluye como método de prueba
     * de la clase Dimension
     */
    public void print() {
        System.out.println(this.toString());
    }

    
}

