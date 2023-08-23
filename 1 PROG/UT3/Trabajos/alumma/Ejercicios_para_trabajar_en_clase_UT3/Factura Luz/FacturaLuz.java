
/**
 * Escriba la descripci�n de la clase FacturaLuz aqu�.
 * La clase guarada inforamci�n acerca del consumo de luz efectuado 
 * @author Chris Pinday
 * @version 28/09/2021
 */
public class FacturaLuz
{
    //constante en cents
    private final double VALOR_KW = 8.6;
    //constante
    private final double IVA = 0.16;
    // consumo en el inicio del per�odo a facturar
    private int lecturaAnterior;
    // consumo al final del per�odo a facturar
    private int lecturaActual;

    /**
     * Constructor de la clase FacturaLuz
     */
    public FacturaLuz(int queLecturaAnterior, int queLecturaActual)
    {
        lecturaAnterior = queLecturaAnterior;
        lecturaActual = queLecturaActual;

    }

    /**
     * M�todo para devolver el n� de Kw consumidos;
     */
    public int obtenerConsumo() {
        return lecturaActual;
    }
    
    
    
}
