
/**
 *  Los objetos de esta clase permiten almacenar un numero
 *  y nos indican si ese numero es menos, mayor o igual
 *  que otro que reciben.
 */
public class Numero
{
    private int numero;

    /**
     * Constructor  
     */
    public Numero(int queNumero)    {
        numero = queNumero;
    }

    /**
     * Mètodo
     */
    public boolean esMayorQue(int otroNumero) {
        if (numero > otroNumero){
            return true;
        }
        return false;
    }
    
    /**
     * Mètodo
     */
    public boolean esMayorQueV1(int otroNumero) {
        
        return (numero > otroNumero);
    }

    /**
     * Método
     */
    public boolean esMenorQue(int otroNumero) {
        boolean aux;
        if (numero < otroNumero){
            aux = true;
        }
        else {
            aux = false;
        }
        return aux;
    }

    /**
     * es igual que
     */
    public boolean esIgualQue(int otroNumero) {
        boolean aux = false;
        if (numero == otroNumero){
            aux = true;
        }

        return aux;
    }

    /**
     * 
     */
    public String comprobarV1(int otroNumero) {
        
        if (numero > otroNumero){
            return "Más grande";
        }
        else {
            if(numero < otroNumero){
              return "Más pequeño";  
            }
            else{
              return "Iguales";
            }
        }
    }

}
