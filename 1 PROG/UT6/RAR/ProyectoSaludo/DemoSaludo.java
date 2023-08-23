 
/**
 *  Demo
 * 
 *  
 */
public class DemoSaludo
{
        private Saludo unSaludo;
        
        /**
         * Constructor de la clase DemoSaludo
         */
        public DemoSaludo()
        {
                unSaludo = new Saludo("Pepe");
                
        }
        
        /**
         * demo saludar
         * 
         */
        public void testSaludar()
    	{
    		
    		unSaludo.saludar();
    	}
        
        
}
