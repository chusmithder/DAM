
/**
 *  Los objetos de esta clase serán ordenadores.
 * 
 * @author  
 * @version  
 */
public class Ordenador
{
    //cantidad maxima dememoria que pueden tener en Mb 
    private int maxMemoria;
    //cantidad de memoria instalada
    private int memoriaInstalada;

    /**
     * Constructor  de la clase
     * Verifica que el parametro queMemoriaMax sea mayor que 0
     * Si es negativo la memoria maxima inicia con 1024
     */
    public Ordenador(int queMaxMemoria)    {
        if (queMaxMemoria > 0){
            maxMemoria = queMaxMemoria;
        }
        else { // queMaxMemoria <= 0
            maxMemoria = 1024;
        }

        memoriaInstalada = 0; // bytes
    }

    /**
     * Accesor 
     * Devuelve la maxima memoria permitida    
     */
    public int getMaxMemoria()    {
        return maxMemoria;
    }

    /**
     *  Devuelve la memoria que queda disponible
     */
    public int obtenerMemoriaDisponible() {
        return (maxMemoria - memoriaInstalada);
    }

    /**
     *  Mutador
     *  Libera toda la memoria instalada
     */
    public void vaciarMemoria() {
        memoriaInstalada = 0;
    }

    /**
     *  Mutador
     *  Instalar 256 Mb
     *  
     */
    public boolean instalar256Mb() {
        int memoriaDisponible = maxMemoria - memoriaInstalada;
        if (memoriaDisponible < 256){
            return false;
        }
        else { 
            memoriaInstalada = memoriaInstalada + 256;
            return true;
        }
        
    }

    /**
     *  Mutador
     *  Instalar memoria que se indica en el parámetro
     *  memoriaInstalada = memoriaInstalada + cantidad
     */
    public boolean instalarMemoria(int cantidad) {
        int memoriaDisponible = maxMemoria - memoriaInstalada;
        if ((cantidad <= memoriaDisponible) && (cantidad >= 0)){
            memoriaInstalada = memoriaInstalada + cantidad;
            return true;
        }
        return false;
    }

    /**
     *  Accesor
     *  
     */
    public void printInfornacion() {
        int megasDisponibles = maxMemoria - memoriaInstalada;
        System.out.println("Este ordenador puede tener hasta " + maxMemoria + " Mb de memoria");
        System.out.println("Todavía es posible instalar " + megasDisponibles +  " Mb");
    }

}
