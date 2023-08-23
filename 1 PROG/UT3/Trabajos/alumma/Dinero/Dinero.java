
/**
 *  Clase Dineroa
 *  
 */
public class Dinero
{
    //asumimos euros valor euro natural y menor que 100
    private final int DIEZ = 10;
    private final int CINCO = 5;
    private final int DOS = 2;
    private final int UNO = 1;
    private int euros;

    /**
     * Constructor  
     */
    public Dinero(int queEuros)    {
         euros = queEuros;
    }

    /**
     *  Accesor para ver cantidad de euros
     */
    public int getEuros()    {
         return euros;
    }
    
    /**
     *  Mutador para modificar la cantidad de euros
     */
    public void setEuros(int queEuros)    {
         euros = queEuros;
    }
    
    /**
     *  Metodo que muestra la descomposicion del dinero en el minimos numero de
     *  billetes de 5, monedas de 2 y monedas de 1
     */
    public void printDescomposicionMonedas()    {
        int aux = euros;
        
        int billetes10 = aux / DIEZ;
        aux = aux % DIEZ;
        
        int billetes5 = aux / CINCO; 
        aux = aux % CINCO;
        
        int monedas2 = aux/2;
        aux = aux % 2;
        
        int monedas1 = aux/1;
        
        System.out.println(euros + " € son");
        System.out.println("Billetes de 10 = " + billetes10 );
        System.out.println("Billetes de 5 = " +  billetes5 );
        System.out.println("Monedas de 2 = " + monedas2);
        System.out.println("Monedas de 1 = " + monedas1 );
    }
    
}
