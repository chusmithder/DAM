


/**
 * Clase AppTesauro -  incluye el método main()
 * Arranca la aplicación
 */
public   class AppTesauro
{
     
    /**
     * 
     */
    public static void main(String[] args)
    {
         Tesauro tesauro = new Tesauro();
         tesauro.añadirSinonimo("obeso gordo");
         tesauro.añadirSinonimo("delgado enjuto fino flaco");
         tesauro.añadirSinonimo("delegar encargar encomendar facultar");
         tesauro.escribirTesauro();
    }
}
