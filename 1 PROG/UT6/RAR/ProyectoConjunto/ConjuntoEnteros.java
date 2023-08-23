
/**
 *   clase ConjuntoEnteros 
 */
import java.util.HashSet;
import java.util.Iterator;

public class ConjuntoEnteros
{
        
        private HashSet<Integer> enteros;

        /**
         * Constructor de la clase ConjuntoEnteros
         */
        public ConjuntoEnteros(int tamaño)
        {
                enteros = new HashSet<Integer>();
                for (int i = 1; i <= tamaño; i++) {
                        enteros.add(i); //se hace boxing
				}
        }
        
		/**
         * añade un nº al conjunto
         */
        public void addNumero(int n)
        {
                enteros.add(n); // enteros.add(new Integer(n));
        }

        /**
         * 
         * obtiene un conjunto de pares
         */
        public HashSet<Integer> getPares()
        {
                HashSet<Integer> pares = new HashSet<Integer>();
                Iterator<Integer> it = enteros.iterator();
                while (it.hasNext())
                {
                        int n = it.next(); // n = it.next().intValue();
                        if (n % 2 == 0) {
                                pares.add(n);
						}
                }
                return pares;
                                
        }
        
		/**
         * borra el primer elemento del conjunto
         */
        public void borrar()
        {
                enteros.remove(0);
        }
		
        /**
         * borra todos los pares
         */
        public void borrarPares()
        {
                Iterator<Integer> it = enteros.iterator();
                while (it.hasNext())   {
                        int n = it.next(); // n = it.next().intValue();
                        if (n % 2 == 0) {
                                it.remove();
						}
                }
        }
        
         /**
         * escribir conjunto
         */
        public void printConjunto()
        {
                printConjunto(enteros);
        }
        
       
         /**
         * escribir conjunto
         */
        private void printConjunto(HashSet<Integer> cjto)
        {
           
                System.out.print("[ ");
                for (Integer i: cjto) {
                     System.out.print(i.intValue() + "  "); 
				}
                System.out.println("]");
        }
}
