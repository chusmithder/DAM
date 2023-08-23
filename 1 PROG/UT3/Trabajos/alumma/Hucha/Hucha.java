
/**
 *  La clase modela el comportamiento de una hucha que guarda una determinada cantidad
de dinero
 */
public class Hucha
{
    //dinero en euros 
    private double dinero;

    /**
     * Constructor  
     */
    public Hucha()    {
        dinero=0;
    }

    /**
     * Accesor para ver la cantidad de dinero 
     */
    public double getDinero()    {
        return dinero;
    }

    /**
     *  Mutador para añadir dinero 
     */
    public void meterDinero(double cantidad) {
        dinero = dinero + cantidad;
    }

    /**
     *  Mutador para sacar dinero
     */
    public void sacarDinero(double cantidad) {
        dinero -= cantidad;
    }

    /**
     *   Mètodo para visualizar la cantidad en la hucha.   
     */
    public void printDetalles() {
        System.out.println("....................");
        System.out.println("Cantidad de dinero en la hucha");
        System.out.println(dinero + " euros ");
        System.out.println("....................");
    }


}
