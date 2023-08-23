
/**
 * Modela un diccionario en el que cada palabra
 * tiene asociados una serie de sinónimos
 * 
 */
 
 

public class Tesauro
{
        // a cada clave se le asocia un conjunto de sinónimos
        //los sinónimos no se repiten
        private                           tesauro;

        /**
         * Constructor de la clase Tesauro
         */
        public Tesauro()
        {
                tesauro =  
        }

        /**
         * 
         * @param  palabra la palabra a añadir
         *         sinonimo el sinónimo de la palabra
         */
        public void añadirSinonimo(String palabra, String sinonimo)
        {
                
            
            
        }
        
        /**
         * añade una palabra junto con todos sus sinónimos 
         * @param linea contiene la palabra y sus sinónimos
         *         el separador entre palabras es el blanco
         *         la primera palabra es la clave, el resto sinónimos
         */
        public void añadirSinonimo(String linea)
        {
              
            
            
            
        }
        /**
         * 
         * @param  sin el sinónimo a borrar de cada conjunto
         *              de sinónimos
         * @return   el conjunto de claves en las que estaba
         *            el sinónimo borrado. Si no se borró
         *            ninguno devuelve el conjunto vacío
         */
        public HashSet<String> borrarSinonimo(String sin)
        {
                
            
            
                
        }
        
        /**
         * 
         * @param  representación textual del map
         * @return     
         */
        public String toString()
        {
                
            
                
        }
        
        /**
         * 
         * Visualiza el tesauro    
         */
        public void escribirTesauro()
        {
        
                System.out.println(toString());
        }
        
        
        
        
}
