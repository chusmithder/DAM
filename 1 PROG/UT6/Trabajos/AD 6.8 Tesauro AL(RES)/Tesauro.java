import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.Map;
/**
 * Modela un diccionario en el que cada palabra
 * tiene asociados una serie de sin�nimos
 * 
 */
 
 

public class Tesauro
{
        // a cada clave se le asocia un conjunto de sin�nimos
        //los sin�nimos no se repiten
        private HashMap<String, HashSet<String>> tesauro;

        /**
         * Constructor de la clase Tesauro
         */
        public Tesauro(){ 
            tesauro = new HashMap<>();
        }

        /**
         * 
         * @param  palabra la palabra a a�adir
         *         sinonimo el sin�nimo de la palabra
         */
        public void a�adirSinonimo(String palabra, String sinonimo) {
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
         * a�ade una palabra junto con todos sus sin�nimos 
         * @param linea contiene la palabra y sus sin�nimos
         *         el separador entre palabras es el blanco
         *         la primera palabra es la clave, el resto sin�nimos
         */
        public void a�adirSinonimo(String linea) {
            linea = linea.trim();
            String[] palabraYsinonimos = linea.split("[ ]+");
            String palabra = palabraYsinonimos[0];
            //bucle para a�adir sinonimos...
            for(int i = 1; i < palabraYsinonimos.length; i++) {
                String sinonimo = palabraYsinonimos[i];
                a�adirSinonimo(palabra, sinonimo);
            }
        }
        
        /**
         * 
         * @param  sin el sin�nimo a borrar de cada conjunto
         *              de sin�nimos
         * @return   el conjunto de claves en las que estaba
         *            el sin�nimo borrado. Si no se borr�
         *            ninguno devuelve el conjunto vac�o
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
         * @param  representaci�n textual del map
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
