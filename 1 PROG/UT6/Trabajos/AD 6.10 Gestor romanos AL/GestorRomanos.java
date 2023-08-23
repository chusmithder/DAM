import java.util.TreeMap;
import java.util.Set;
/**
 * La clase GestorArabigos genera una lista
 * de nºs arábigos con sus correspondientes
 * nºs romanos.
 * La lista está ordenada por nº arábigo
 * Para modelar la lista se utiliza un TreeMap
 */
 

public class GestorRomanos
{
    
    private  TreeMap<Integer, String> listaArabigos; //(arab, rom)(arab, rom)
    private ConversorRomanos conversor;

    /**
     * Constructor 
     */
    public GestorRomanos(ConversorRomanos conversor) {
        this.conversor = conversor;
        listaArabigos = new TreeMap<>();
    }

    /**
     * Añadir un romano. Se añade la clave que es 
     * su valor arábigo y el valor asociado que es
     * el nº romano
     * 
     * @param  romano el nº romano se añade como 
     *          valor asociado.
     * 
     */
    public void añadirRomano(String romano) {
        romano = romano.toUpperCase(); 
        int arabigo = conversor.convertir(romano);
        listaArabigos.put(arabigo, romano);
    }
    
    /**
     * Añadir varios romanos.  
     * 
     * @param  el array con los nºs romanos
     * 
     */
    public void añadirRomanos(String[] romanos) {
        for (String romano: romanos) {
            añadirRomano(romano);
        }
    }
    
    /**
     * representación  textual del map
     *
     */
    public String toString() {
       StringBuilder sb = new StringBuilder();
       Set<Integer> conjuntoNumeros = listaArabigos.keySet();
       for (Integer num: conjuntoNumeros) {
           String romano = listaArabigos.get(num);
           sb.append(num.intValue() + " - " + romano + "\n");
       }
       return sb.toString();
    }
    
  /**
     * Mostrar la lista de arábigos   
     *  
     */
    public void escribirListaArabigos()    {
        System.out.println(this.toString());
    }
}
