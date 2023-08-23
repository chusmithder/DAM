
/**
 *  Este proyecto simula una calculadora que registra uno a uno una serie de
 *  numeros y va calculando al mismo tiempo el valor maximo y minimo entre los 
 * introducidos y la suma total de todos ellos.
 * 
 * @author CSPD
 */
public class Calculadora
{
    //se van contando cada uno de los numeros que se introducen
    private int cantidad;
    //aqui se van acumulando los numeros introducidos
    private int suma;
    //registra el valor maximo de entre todos los introducidos hasta el momento
    private int maximo;
    //el minimo de los valores introducidos hasta el momento
    private int minimo;
    

    /**
     * Constructor  
     */
    public Calculadora()    {
        cantidad = 0;
        suma = 0;
        maximo = 0;
        minimo = 0;
    }

    /**
     *  ACCESOR
     *  Devuelve la cantidad
     */
    public int getCantidad()    {
        return cantidad;
    }

    /**
     *  ACCESOR
     *  Devuelve el valor minimo introducido hasta el momento
     */
    public int getMinimo()    {
        return minimo;
    }

    /**
     *  ACCESOR
     *  Devuelve el valor máximo introducido hasta el momento
     */
    public int getMaximo()    {
        return maximo;
    }

    /**
     * Añade un nuevo numero al objeto calculadora.
     * El efecto sera que el ESTADO de la calculadora cambia puesto que habrá
     * que contar el numero (cantidad), añadirlo a la suma , actualizar el valor 
     * maximo y minimo
     */
    public void introducirNumero(int numero) {
        //Actualizar la cantidad de numeros introducidos
        cantidad++;
        //Añadir valor a la suma
        suma += numero;
        // Actualizar el valor minimo
        if (cantidad == 1){
            minimo = numero;
            maximo = numero;
        }
        
        else if (numero < minimo){
            minimo = numero; 
        }
        
        else if (numero > maximo){
            maximo = numero;
        }
        
    }
       

    /**
     *  Devuelve la media de todos los valores introducidos 
     *  hasta el momento
     *     
     */
    public double getMedia() {
        double media = 0;
        //TODO: calcular media        
        if (cantidad != 0){
            media = (1.0*suma / cantidad);
        }
        return media;
    }

}
