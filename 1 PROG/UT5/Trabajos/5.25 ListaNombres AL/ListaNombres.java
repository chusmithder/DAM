import java.util.Scanner;
import java.io.File;
import java.io.IOException;

/**
 * La clase mantiene una lista de nombres
 * en orden léxicográfico  
 * 
 */

 

public class ListaNombres
{
        private String[]  lista;
        private int pos;

        /**
         * Constructor de la clase ListaNombres
         * n es el tamaño máximo de la lista
         */
        public ListaNombres(int n) 
        {              
              lista = new String[n];
              pos = 0;
        }

        /**
         * @return  true si la lista está vacía   
         */
        public boolean  listaVacia()
        {
            return pos == 0;
            
        }
        
        /**
         * 
         * @return  true si la lista está llena   
         */
        public boolean  listaLlena()
        {
            return pos == lista.length;
        }
        
        /**
         * Inserta un nombre en la lista únicamente
         * si no está y la lista no está llena. La inserción se hace de tal
         * manera que el nombre queda colocado en el 
         * lugar que le corresponde manteniendo el orden 
         * de la lista (no se utiliza ningún algoritmo de ordenación)
         * Importan mayúsculas y minúsculas 
         * 
         * @param nombre el nombre a insertar
         * @return  true si la inserción se hace con éxito   
         *
         */
        public boolean insertarNombre(String nombre) {
             if (!listaLlena() && !estaNombre(nombre)) {
                 int i = pos - 1;
                 while (i >= 0 && lista[i].compareTo(nombre) > 0) {
                    lista[i + 1] = lista[i];
                    i--;
                 }
                 lista[i + 1] = nombre; // insertar el valor
                 pos ++;
                 return true;
             }
            return false;
        }
        
        /**
         *  Busca un nombre en la lista
         *  Puesto que la lista está en todo momento ordenada
         *  se hace una búsqueda binaria
         *  @param  nombre el nombre a buscar
         *  @return   true si ya existe el nombre en la lista  
         *   
         */
        private boolean estaNombre(String nombre)
        {
                
                // for (int i = 0; i < pos; i++) {
                    
                    // if (lista[i].equals(nombre)) {
                        // return true;
                    // }
                // }
                // return false;
                boolean encontrado = false;
                int izquierda = 0;
                int derecha = pos - 1;
                while (izquierda <= derecha && !encontrado) {
                    int mitad = (izquierda + derecha) / 2;
                    if (lista[mitad].compareTo(nombre) == 0){
                        encontrado = true;
                    }
                    else if (lista[mitad].compareTo(nombre) > 0) {
                        derecha = mitad - 1;
                    }
                    else {
                        izquierda = mitad + 1;
                    }
                }
                return encontrado;
            
        }
        
        /**
         *  Busca y devuelve el nombre de mayor longitud
         *  en la lista. Si hay varios devuelve el
         *  primero encontrado
         *  Si la lista está vacía devuelve null
         *  
         *  @return   el nombre más largo  
         *  
         */
        public String nombreMasLargo()
        {
               if (listaVacia()) {
                   return null;
               }
               else {
                    int posMax = 0;
                    for (int i = 0; i < pos; i++) {
                        if (lista[i].length() > lista[posMax].length()) {
                            posMax = i;
                        }
                    } 
                    boolean control = false;
                    int i = 0;
                    while (i < pos && !control) {
                        if (lista[i] == lista[posMax]){
                            control = true;
                        }
                        else {
                            i++;
                        }
                    }
                    return lista[i];
               }
        }
        
        /**
         * Borra de la lista los nombres que empiezan por 
         * una letra determinada (sí importan mayúsculas y minúsculas)
         * No es lo mismo borrarLetra('A') que borrarLetra('a')
         *
         * @param letra la letra por la que han de empezar los nombres 
         *    
         */
        public void borrarLetra(char letra)
        {
            int i = 0;
            while (i < pos) {
                if (lista[i].startsWith(String.valueOf(letra))){
                        borrarDePosicion(i);
                }
                else{
                    i++;
                }
            }
        }
        
        /**
         * Borra un nombre de la posición indicada
         * 
         *
         * @param  p posición del nombre a borrar
         *  
         */
        private void borrarDePosicion(int p)
        {
               if (p >= 0 && p < pos && !listaVacia()) {
                   System.arraycopy(lista, p + 1, lista, p, pos - p - 1);
                   pos--;
               }
        }
         
       
        
        /**
         * Cuenta cuántos nombres empiezan por una determinada 
         * cadena sin importar   mayúsculas o minúsculas
         *
         * @param  la cadena de comienzo
         * @return  la cantidad de nombres calculados   
         */
        public int empiezanPor(String inicio)
        {
            String auxInicio = inicio.toLowerCase();
            int empiezan = 0;
            for (int i = 0; i < pos; i++) {
                String auxLista = lista[i].toLowerCase();
                if (auxLista.startsWith(auxInicio)) {
                    empiezan++;
                }
            }
            return empiezan;
                
        }
        
         /** 
         * 
         * Devuelve un array con los  nombres que empiezan por una determinada 
         * letra sin importar si es mayúscula o minúscula
         * 
         * @param  la letra de comienzo
         * @return  la cantidad de nombres encontrados
         *          con esa letra   
         */ 
        public String[] empiezanPorLetra(char letra)
        {
            String aux = String.valueOf(letra);
            aux = aux.toLowerCase();
            int tam = empiezanPor(aux);
            String[] empiezan = new String[tam];
            int p = 0;
            for (int i = 0; i < pos; i++) {
                String auxLista = lista[i].toLowerCase();
                if (auxLista.startsWith(aux)) {
                    empiezan[p] = lista[i];
                    p++;
                }
            }
            return empiezan;
        }
        
       /**
         * Representación textual de la cadena
         * 
         * @return la cadena resultante    
         */
        public String toString()
        {
            String resul = "";
            for (int i = 0; i < pos; i++) {
                resul += lista[i] + "\n";
            }
            return resul;
        }
        
          /**
         *  Mostrar la lista en pantalla 
         */
        public void printLista()
        {
                System.out.println(this.toString());
        }
        
          /**
         * Lee de un fichero de texto una serie 
         * de nombres con ayuda de un objeto de la 
         * clase Scanner y los almacena en la lista
         */
        public void cargarDeFichero() 
        {
            Scanner sc = null;
            try    {
                     sc = new Scanner(new File("nombres.txt"));
                     while (sc.hasNextLine() && !listaLlena()) {
                          insertarNombre(sc.nextLine());
                     }                          
                     
             }
             catch (IOException e)      {
                     e.printStackTrace();
             }
             finally {
                 sc.close();
             }
             
        }
        
}
