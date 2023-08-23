
/**
 *  Este proyecto simula a un calentador
 *   
 */
public class Calentador
{

    private int temperatura;
    private int minimo;
    private int maximo;
    private int incremento;

    /**
     * Constructor  
     */
    public Calentador(int queMinimo, int queMaximo)    {
        temperatura = 15;
        incremento = 5;
        minimo = queMinimo;
        maximo = queMaximo; //debe ser mayor que 15
        
    }

    /**
     *  MUTADOR
     *  Incrementa la temperatura en 5 grados
     *  No permite que la temperatura tenga un valor mayor el maximo
     */
    public void calentar(){
        if (temperatura + incremento <= maximo) {
            temperatura = temperatura + incremento;
        }
        else {
            temperatura = temperatura + 0;
        }
    }

    /**
     *  MUTADOR
     *  Decrementa la temperatura en 5 grados
     *  No permite que la temperatura tenga un valor menor que el minimo
     */
    public void enfriar()    {
        if (temperatura - incremento >= minimo) {
            temperatura = temperatura - incremento;
        }
    }

    /**
     *  ACCESOR
     *  Devolver el valor de la temperatura
     */
    public int getTemperatura() {
        return temperatura;
    }

    /**
     *  MUTADOR
     *  Establece un nuevo valor al incremento
     */
    public void setIncrementoV0(int nuevoIncremento){
        incremento = nuevoIncremento;
    }
    
    /**
     *  MUTADOR
     *  Establece un nuevo valor al incremento
     *  No permite que el nuevo incremento sea negativo
     */
    public void setIncremento(int nuevoIncremento){
        if (nuevoIncremento >= 0){
        incremento = nuevoIncremento;
        }
        else{
            System.out.println("debe introducir un valor positivo: " + nuevoIncremento);
        }
    }
}
