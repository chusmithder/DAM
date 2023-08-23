
/**
 * La clase mantiene una lista de nombres
 * en orden léxicográfico  
 * 
 */
import java.util.Scanner;
import java.io.File;
import java.io.IOException;
 

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
              
        }

        /**
         * @return  true si la lista está vacía   
         */
        public boolean  listaVacia()
        {
                 
            
        }
        
        /**
         * 
         * @return  true si la lista está llena   
         */
        public boolean  listaLlena()
        {
                
            
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
        public boolean insertarNombre(String nombre)
        {
              
            
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
                
                
        }
        
       /**
         * Representación textual de la cadena
         * 
         * @return la cadena resultante    
         */
        public String toString()
        {
                
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
