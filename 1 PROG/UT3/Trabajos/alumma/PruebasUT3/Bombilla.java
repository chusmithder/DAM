
/**
 * Modela una bombilla
 * 
 * @author - Chris
 * @version (a version number or a date)
 */
public class Bombilla
{
    // instance variables - replace the example below with your own
    private String potencia;
    private boolean situacion;

    /**
     * Constructor 
     */
    public Bombilla(String quePotencia)
    {
        potencia = quePotencia;
        situacion = false;
    }
    
    /**
     * Accesor para la potencia
     */
    public String getPotencia()
    {
        // put your code here
        return potencia;
    }
    
    /**
    * Accesor para la situacion
    */
    public boolean get()
    {
        // put your code here
        return situacion;
    }
    
        /**
     * Mutador para la potencia
     */
    public void setPotencia(String quePotencia)
    {
        // put your code here
        potencia = quePotencia;
    }
    
    /**
     * Accesor para la potencia
     */
    public void cambiarSituacion()
    {
        // put your code here
        situacion = !situacion;
    }


}
