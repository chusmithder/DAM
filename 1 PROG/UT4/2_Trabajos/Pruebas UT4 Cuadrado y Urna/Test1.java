
/**
 *  
 * 
 * @author  
 * @version  
 */
public class Test1
{
     private Urna urna1;
     private Urna urna2;
     private Urna urna3;

    /**
     * Constructor
     */
    public Test1()    {
         
    }

    /**
     *  
     *    
     */
    public void metodo()    {
        urna1 = new Urna();
        System.out.println(urna1.toString());
        System.out.println(" nro bolas negras: " + urna1.cuantasNegras());
        
        urna2 = new Urna(2);
        System.out.println(urna2.toString());
        System.out.println(" nro bolas negras: " + urna2.cuantasNegras());
        
        // Bola bola1 = new Bola();
         // Bola bola2 = new Bola();
          // Bola bola3 = new Bola();
        urna3= new Urna(new Bola(), new Bola(1));
        System.out.println(urna3.toString());
        System.out.println(" nro bolas negras: " + urna3.cuantasNegras());
    }
}
