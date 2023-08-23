
/**
 *  Clase Contador
 */
public class Contador
{
    private int valor;

    /**
     * Constructor  
     */
    public Contador()    {
        valor = 0;
    }

    /**
     *  Accesor para ver el atributo valor
     */
    public int getValor()    {
        return valor;
    }

    /**
     * Mutador para incrementar valor  
     */
    public void incrementar(int cantidad) {
        valor = valor + cantidad;
    }
    
    /**
     * Mutador para decrementar valor  
     */
    public void decrementar(int cantidad) {
        valor = valor - cantidad;
    }
    
    /**
     *  Reset
     */
    public void reset() {
        valor = 0;
    }
    
    /**
     * Imprimir valor del contador 
     */
    public void printContador() {
        System.out.println("$$$$$$$$$$$");
        System.out.println("Valor: " + valor + " $");
        System.out.println("$$$$$$$$$$$");
    }

}
