
/**
 * Representa a una rueda de una bicicleta
 */
public class Rueda  
{
    private double  presion;   
    
    /**
     * Constructor
     */
    public Rueda(double presion)
    {
        this.presion = presion; //this es una referencia
        //representa la referencia al objeto actual
    }

    /**
     * inflar la rueda
     */
    public void inflar( )
    {
        this.presion += 0.5; 
    }

    /**
     * desinflar la rueda
     */
    public void desinflar( )
    {
        presion -= 0.5; 
    }

    /**
     * true si está desinflada
     */
    public boolean estaDesinflada ()
    {
        return (presion == 0.0);
    }     
}
