
/**
 *  La clase modela un conversor de temperatura, de grados centigrados
 *  a grados Farenheit y viceversa
 * @author  
 * @version  
 */
public class Conversor
{
    // cantidad de grados asignado
    private double grados;
    
    /**
     * Constructor  
     */
    public Conversor()    {
         grados = 0;
    }

    /**
     * Accesor al numero de grados centigrados  
     */
    public double getGrados()    {
         return grados;
    }
    
     /**
     * Mutador  
     */
    public void setGrados (double queGrados)    {
         grados = queGrados;
    }
    
    /**
     * Convertir de Farenheit a centigrados
     */
    public double aCentigrados()    {
         return (grados - 32) * 5.0 / 9;
    }
    
        /**
     * Convertir de centigrados a Farenheit 
     */
    public double aFarenheit()    {
        return  (9.0 / 5) * grados + 32;
    }
}
