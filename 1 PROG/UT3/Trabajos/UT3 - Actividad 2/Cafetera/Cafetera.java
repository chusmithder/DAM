
/**
 *  Los objetos de esta clase simulan una cafetera
 *   
 */
public class Cafetera
{
    //cantidad maxima de cafe que puede contener la cafetera
    private int capacidadMaxima;
    //Cantidad actual de cafe en la cafetera
    private int cantidadActual;

    /**
     * Constructor  
     * Crea cafeteras, que las iniciaiza con determinados valores
     * sus caracteristicas
     */
    public Cafetera()    {
        capacidadMaxima = 1000; //centimetros cúbicos
        cantidadActual = 0; //cafetera vacia
    }

    /**
     * ACCESOR
     * Devuelve los centimetro cúbicos de la capacidad máxima
     */
    public int getCapacidadMaxima() {
        return capacidadMaxima;
    }

    /**
     * ACCESOR
     * Devuelve los centimetro cúbicos de la capacidad máxima
     */
    public int getCantidadActual() {
        return cantidadActual;
    }

    /**
     * MUTADOR
     * Cambiar la cantidad maxima de la cafetera
     */
    public void setCapacidadMaxima(int nuevoMax) {
        capacidadMaxima = nuevoMax;
    }

    /**
     * MUTADOR
     * Cambiar la cantidad maxima de la cafetera
     */
    public void setCantidadActual(int nuevoActual) {
        cantidadActual = nuevoActual;
    }

    /**
     * MUTADOR
     * Llena la cafetera hasta la capacidad maxima
     */
    public void llenarCafetera() {
        int aux;
        aux = capacidadMaxima;
        cantidadActual = aux;
    }

    /**
     * Sirve una taza con la capacidad indicada en el parametro
     */
    public void servirTaza(int cantidad) {
        //cantidad es la capacidad del vaso
        if (cantidadActual < cantidad){
            //Se sirve la cantidad actual
            cantidadActual = 0;
        }
        else{
            cantidadActual = cantidadActual - cantidad;
        }
    }

    /**
     * Vaciar Cafetera
     */
    public void vaciarCafetera() {
        cantidadActual = 0;
    }

    /**
     * Agrega cafe a la cafetera
     */
    public void agregarCafe(int cantidad) {
        //cantidad sera lo que se agrega
        int aux = cantidadActual + cantidad;
        int sobra;
        if (aux <= capacidadMaxima){
            cantidadActual = cantidadActual + cantidad;
        }
        else { // aux es mayor que la capacidad maxima
             cantidadActual = capacidadMaxima;
            sobra = aux - capacidadMaxima;
        }
    }

}