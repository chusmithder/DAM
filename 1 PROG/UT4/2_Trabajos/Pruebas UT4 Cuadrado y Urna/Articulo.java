
/**
 *  
 * 
 * @author  
 * @version  
 */
public class Articulo
{
    private String  nombre;   
    private double precio;

    /**
     * Constructor  
     */
    public Articulo(String nombre, double precio)    {
        this.nombre = nombre;
        this.precio = precio;

    }

    /**
     * 
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * 
     */
    public double getPrecio() {
        return precio;
    }

    /**
     * 
     */
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    /**
     * 
     */
    public boolean masBaratoQue(Articulo a) {
         
        return true;
    }
	
	 /**
     * 
     */
    public String toString() {
        return "Nombre: " + this.nombre + "\nPrecio: " + this.precio;
    }

}
