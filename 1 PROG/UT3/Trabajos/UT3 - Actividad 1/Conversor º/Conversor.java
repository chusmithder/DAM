
/**
 *  Este proyecto modela un conversor de temperatura,
 *  de centigrados a Farenheit y viceversa.
 *  F = (9 / 5 ) * C + 32
 * @author  Chris
 * @version  28/09/2021
 */
public class Conversor
{
    //numero de grados (centigrados o Farenheit)
    private double grados;

    /**
     * Constructor 
     * Crear conversor con una temperatura inicial
     * de 0 grados
     */
    public Conversor()    {
        grados = 0;   
    }

    /**
     * Accesor
     * @return grados
     */
    public double getGrados() {
        return grados;
    }

    /**
     * Mutador
     * Modificar el valor de la temperatura
     */
    public void setGrados(double queGrados) {
        grados = queGrados;
    }

    /**
     * Convertir de grados Farenheit a Centígrados
     */
    public double aCentigrados() {
        return (grados - 32) * (5.0 / 9); //ojo al 5.0
    }

    /**
     * Convertir de grados Farenheit a Centígrados
     * USANDO VARIABLE LOCAL
     */
    public double aCentigradosV1() {
        double gradosCentigrados;
        gradosCentigrados = 5 * (grados - 32) / 9; //mejor es asi
        return gradosCentigrados;
    }

    /**
     * Convertir de grados Centígrados a Farenheit
     */
    public double aFarenheit() {
        return (9.0 / 5) * grados + 32;
    }
    
    /**
     * Convertir de grados Centígrados a Farenheit
     * USANDO VARIABLE LOCAL
     */
    public double aFarenheitV1() {
        double farenheit;
        farenheit = (9.0 / 5) * grados + 32;
         // farenheit = ((double)9 / 5) * grados + 32; //también se puede hacer así
        return farenheit;
    }

}
