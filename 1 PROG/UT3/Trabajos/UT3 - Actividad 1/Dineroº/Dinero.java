
/**
 * Este proyecto simula un sistema de descomposicion de una cantidad
 * , positiva y menor que 100, en billetes y monedas.
 *  
 */
public class Dinero
{
    //Constantes
    private final int UNO = 1; 
    private final int DOS = 2; 
    private final int CINCO = 5; 
    private final int DIEZ = 10; 
    //asumimos que euros es positivo y menor que 100
    private int euros;

    /**
     * Constructor de la clase
     */
    public Dinero(int queEuros)    {
        euros = queEuros;
    }

    /**
     * Accesor
     * Devuelve la cantidad total de euros
     * @return euros
     */
    public int getEuros() {
        return euros;
    }

    /**
     * Mutador
     * Cambiar la cantidad de euros
     */
    public void setEuros(int nuevaCantidad) {
        euros = nuevaCantidad;
    }

    /**
     * Mostrar en pantalla el dinero expresado en billetes de 10 y 5,
     * y monedas de 2 y 1. Priorizando billetes y monedas de más valor.
     */
    public void printDescomposicionMonedas() {
        int auxDinero = euros;

        int billetes10 = auxDinero / DIEZ;
        auxDinero = auxDinero % DIEZ;

        int billetes5 = auxDinero / CINCO;
        auxDinero = auxDinero % CINCO;

        int monedas2 = auxDinero / DOS;
        auxDinero = auxDinero % DOS;

        int monedas1 = auxDinero;

        System.out.println(euros + " € son");
        System.out.println("Billetes de 10 = " + billetes10);
        System.out.println("Billetes de 5 = " + billetes5);
        System.out.println("Monedas de 2 = " + monedas2);
        System.out.println("Monedas de 1 = " + monedas1);
        System.out.println();
    }

    /**
     * Limpiar el terminal
     */
    public void borrarPantalla() {
        System.out.println('\u000C');
    }

}
