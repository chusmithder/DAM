import java.util.TreeSet;
import java.util.TreeMap;
import java.util.Set;
import java.util.Map;
import java.util.Iterator;

/**
 * Un map que asocia nombres de paises con el conjunto de  idiomas que se hablan en ellos
 * Se quiere recuperar los nombres de los paises ordenados alfabéticamente
 * Se quiere recuperar los nombres de los idiomas ordenados alfabéticamente
 * 
 * Define el atributo mapPaises de forma adecuada
 */
public class MapPaises
{
    private                                paises;

    /**
     * Constructor  
     */
    public MapPaises()
    {
        paises =  
       
    }

    /**
     *  añade un país (siempre en mayúsculas) y el idioma asociado
     *  Si la clave ya existe se añade el idioma al conjunto de idiomas del país
     *  Si la clave no existe se añade una nueva entrada con el pais y el conjunto
     *  formado por idioma
     */
    public void add(String pais, String idioma)
    {
        
        
        
        
    }

    /**
     *  Devuelve el conjunto de idiomas que hablan en el pais indicado
     *  
     *
     */
    public TreeSet<String> idiomasQueHablanEn(String pais)
    {
         
    }

    /**
     *  Devuelve cuántos idiomas hablan en el pais indicado
     *  0 si el pais no existe 
     *
     */
    public int totalIdiomasQueHablanEn(String pais)
    {
        
    }

    /**
     *  Representación textual del map de la forma
     *  Pais = {idioma1, idioma2, ....}
     *  Usa StringBuilder para las concatenaciones
     *  Para iterar sobre el map usa el conjunto de entradas y un for mejorado
     */
    public String  toString()
    {
        
        
        
        
    }

    /**
     *  Conjunto de paises en los que se habla el idioma indicado
     *  Importa el orden en el conjunto devuelto
     *  Usa el conjunto de claves y un iterador
     */
    public TreeSet<String> paisesQueHablanIdioma(String idioma)
    {
         
        
        
    }

    /**
     *  Dados dos países devuelve el conjunto de idioma/s comunes que se hablan en ellos
     *  Si no hay devuelve el conjunto vacío. Si los países no existen también se devuelve 
     *  conjunto vacío
     *
     */
    public TreeSet<String>  idiomasComunes(String pais1, String pais2)
    {
       
        
        
    }

    /**
     *  
     *
     */
    public void printPaises()
    {
        System.out.println(this.toString());
    }


}
