
/**
 * Proyecto
 */
public class Ejemplo
{

    private int a;
    private int b;

    /**
     * Constructor 
     */
    public Ejemplo(int queA, int queB)
    {
        a = queA;
        b = queB;
    }
    
    /**
     * 
     */
    public void promptAntes()
    {
        System.out.println("Antes del intercambio");
    }
    
    /**
     * Metodo
     */
    public void escribir()
    {
        System.out.println("Atributo a = " + a);
        System.out.println("Atributo b = " + b);
    }
        
    /**
     * 
     */
    public void promptDespues()
    {
        System.out.println("Después del intercambio");
    }
    
    /**
     * Método Intercambiar
     */
    public void intercambiar()
    {
        int aux = a;
        a = b;
        b = aux;
    }
    
}
