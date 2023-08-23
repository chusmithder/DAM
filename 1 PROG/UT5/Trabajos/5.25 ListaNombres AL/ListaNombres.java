import java.util.Scanner;
import java.io.File;
import java.io.IOException;

/**
 * La clase mantiene una lista de nombres
 * en orden l�xicogr�fico  
 * 
 */

 

public class ListaNombres
{
        private String[]  lista;
        private int pos;

        /**
         * Constructor de la clase ListaNombres
         * n es el tama�o m�ximo de la lista
         */
        public ListaNombres(int n) 
        {              
              lista = new String[n];
              pos = 0;
        }

        /**
         * @return  true si la lista est� vac�a   
         */
        public boolean  listaVacia()
        {
            return pos == 0;
            
        }
        
        /**
         * 
         * @return  true si la lista est� llena   
         */
        public boolean  listaLlena()
        {
            return pos == lista.length;
        }
        
        /**
         * Inserta un nombre en la lista �nicamente
         * si no est� y la lista no est� llena. La inserci�n se hace de tal
         * manera que el nombre queda colocado en el 
         * lugar que le corresponde manteniendo el orden 
         * de la lista (no se utiliza ning�n algoritmo de ordenaci�n)
         * Importan may�sculas y min�sculas 
         * 
         * @param nombre el nombre a insertar
         * @return  true si la inserci�n se hace con �xito   
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
         *  Puesto que la lista est� en todo momento ordenada
         *  se hace una b�squeda binaria
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
         *  Si la lista est� vac�a devuelve null
         *  
         *  @return   el nombre m�s largo  
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
         * una letra determinada (s� importan may�sculas y min�sculas)
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
         * Borra un nombre de la posici�n indicada
         * 
         *
         * @param  p posici�n del nombre a borrar
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
         * Cuenta cu�ntos nombres empiezan por una determinada 
         * cadena sin importar   may�sculas o min�sculas
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
         * letra sin importar si es may�scula o min�scula
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
         * Representaci�n textual de la cadena
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
