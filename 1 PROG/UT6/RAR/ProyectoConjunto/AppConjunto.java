 
/**
 * Clase AppConjunto -  incluye el método main()
 * Arranca la aplicación
 */
public   class AppConjunto
{
     
    /**
     * 
     */
    public static void main(String[] args)
    {
         ConjuntoEnteros conjunto = new ConjuntoEnteros(10);
         System.out.println("Valores  en el conjunto");
         conjunto.printConjunto();
    }
}
