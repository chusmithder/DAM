
/**
 * Escriba la descripción de la clase FacturaLuz aquí.
 * La clase guarada inforamción acerca del consumo de luz efectuado 
 * @author Chris Pinday
 * @version 28/09/2021
 */
public class FacturaLuz
{
    //constante en cents
    private final double VALOR_KW = 8.6;
    //constante
    private final double IVA = 0.16;
    // consumo en el inicio del período a facturar
    private int lecturaAnterior;
    // consumo al final del período a facturar
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
     * Mètodo para devolver el nº de Kw consumidos;
     */
    public int obtenerConsumo() {
        return lecturaActual;
    }
    
    
    
}
