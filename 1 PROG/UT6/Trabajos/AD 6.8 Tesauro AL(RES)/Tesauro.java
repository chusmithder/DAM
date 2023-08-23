import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.Map;
/**
 * Modela un diccionario en el que cada palabra
 * tiene asociados una serie de sinónimos
 * 
 */
 
 

public class Tesauro
{
        // a cada clave se le asocia un conjunto de sinónimos
        //los sinónimos no se repiten
        private HashMap<String, HashSet<String>> tesauro;

        /**
         * Constructor de la clase Tesauro
         */
        public Tesauro(){ 
            tesauro = new HashMap<>();
        }

        /**
         * 
         * @param  palabra la palabra a añadir
         *         sinonimo el sinónimo de la palabra
         */
        public void añadirSinonimo(String palabra, String sinonimo) {
            if (palabra != null && sinonimo != null) {
                palabra = palabra.toUpperCase();
                sinonimo = sinonimo.toUpperCase();
                //si ya esta la palabra...
                if (tesauro.containsKey(palabra)) {
                    tesauro.get(palabra).add(sinonimo);
                }
                else { //si el tasauro no la contiene
                    HashSet<String> sinonimos = new HashSet<String>();
                    sinonimos.add(sinonimo);
                    tesauro.put(palabra, sinonimos);
                }
            }
            
        }
        
        /**
         * añade una palabra junto con todos sus sinónimos 
         * @param linea contiene la palabra y sus sinónimos
         *         el separador entre palabras es el blanco
         *         la primera palabra es la clave, el resto sinónimos
         */
        public void añadirSinonimo(String linea) {
            linea = linea.trim();
            String[] palabraYsinonimos = linea.split("[ ]+");
            String palabra = palabraYsinonimos[0];
            //bucle para añadir sinonimos...
            for(int i = 1; i < palabraYsinonimos.length; i++) {
                String sinonimo = palabraYsinonimos[i];
                añadirSinonimo(palabra, sinonimo);
            }
        }
        
        /**
         * 
         * @param  sin el sinónimo a borrar de cada conjunto
         *              de sinónimos
         * @return   el conjunto de claves en las que estaba
         *            el sinónimo borrado. Si no se borró
         *            ninguno devuelve el conjunto vacío
         */
        public HashSet<String> borrarSinonimo(String sin) {
            //debemos recorrer todas las claves del map para ver si contienen el sin
            HashSet<String> conjPalabrasCuyoSinBorramos = new HashSet<>();
            // conjunto que contiene las palabras
            Set<String> conjuntoClaves = tesauro.keySet();
            for(String clave: conjuntoClaves) {
                if (tesauro.get(clave).contains(sin)) {
                    conjPalabrasCuyoSinBorramos.add(clave);
                    tesauro.get(clave).remove(sin);
                }
            }
            return conjPalabrasCuyoSinBorramos;
        }
        
        /**
         * 
         * @param  representación textual del map
         * @return     
         */
        public String toString() {
            // conjunto "visual" de claves para recorrer el map
            StringBuilder sb = new StringBuilder();
            Set<String> palabras = tesauro.keySet();
            for (String palabra: palabras) {
                sb.append(palabra + ": \n");
                HashSet<String> sinonimosDePal = tesauro.get(palabra);
                for (String sin: sinonimosDePal) {
                    sb.append(sin + "\t");
                }
                sb.append("\n");
            }
            return sb.toString();
        }
        
        /**
         * 
         * Visualiza el tesauro    
         */
        public void escribirTesauro() {
            System.out.println(toString());
        }
}
