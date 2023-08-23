
/**
 *  
 * 
 * @author  
 * @version  
 */
public class DemoRecursivos
{


    /**
     * Constructor  
     */
    public DemoRecursivos()
    {

    }

    /**
     *  
     * 
     * @param   
     * 
     */
    public int factorial(int n)
    {
        if (n == 0 || n == 1) {
            return 1;
        }
        return n * factorial(n - 1);
    }

    /**
     * 
     */
    public int factorialV2(int n)
    {
        int resul;
        if  (n == 1 || n == 0) {
            resul = 1;
        }
        else  {
            resul = n * factorial(n - 1);
        }
        return resul;
    }
}
