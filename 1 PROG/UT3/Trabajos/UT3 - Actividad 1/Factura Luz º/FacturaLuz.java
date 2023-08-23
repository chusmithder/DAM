
/**
 * Escriba la descripción de la clase FacturaLuz aquí.
 * La clase guarada inforamción acerca del consumo de luz efectuado 
 * en una factura de electricidad y obtienen el importe total facturado.
 * @author  Chris
 * @version 27/09/2021
 */
public class FacturaLuz
{
    //IVA aplicado a la factura
    private final double IVA = 0.16;
    //valor kw consumido (cents), todos los kw tienen el mismo precio
    private final double VALOR_KW = 8.6;
    // consumo en el inicio del período a facturar
    private int lecturaAnterior;
    // consumo al final del período a facturar
    private int lecturaActual;

    /**
     * Crear factura asinando los valores de los parametros
     */
    public FacturaLuz(int anterior, int actual)
    {
        lecturaAnterior = anterior;
        lecturaActual = actual;
    }

    /**
     * Accesor
     * @return devuelve el numero de Kw consumidos 
     */
    public double obtenerConsumo() {
        return  lecturaActual - lecturaAnterior;
    }

    /**
     * Accesor / USANDO VARIABLE LOCAL
     * @return devuelve el numero de Kw consumidos 
     */
    public double obtenerConsumoV1() {
        double consumo;
        consumo = lecturaActual - lecturaAnterior;
        return consumo;
    }

    /**
     * Accesor / USANDO VARIABLES LOCALES
     * devuelve el importe correspondiente a la factura,
     * lo que hay que pagar por consumo
     * @return el valor a pagar
     */
    public double obtenerImporteTotal() {
        double consumo = lecturaActual - lecturaAnterior;
        double importeSinIva = consumo * VALOR_KW;
        double totalIva = importeSinIva * 0.16;
        double importeConIva = importeSinIva + totalIva;
        return importeConIva;
    }

    /**
     * Accesor
     * @return devuelve el importe a pagar por lo que se
     * ha consumido incluyendo el IVA
     */
    public double obtenerImporteTotalV1() {
        return ((lecturaActual - lecturaAnterior) * VALOR_KW) +
        (0.16 * (lecturaActual - lecturaAnterior) * VALOR_KW);
    }

}
