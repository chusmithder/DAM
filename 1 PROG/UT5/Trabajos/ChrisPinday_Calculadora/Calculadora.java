import java.util.Arrays;

/**
 * clase Calculadora
 * Christhoper Pinday Delgado
 */
public class Calculadora
{
    public static final int MAX = 15;
    private int[] numeros;
    private int total;

    /**
     * Constructor de la clase Calculadora
     */
    public Calculadora()    {
       this.numeros = new int[MAX];
       total = 0;
    }

    /**
     * Constructor de la clase Calculadora
     */
    public Calculadora(int[] numeros)    {
        int min = Math.min(MAX, numeros.length);
        
        this.numeros = Arrays.copyOf(numeros, min);
        total = Math.min(MAX, numeros.length);
    }

    
    /**
     * Añadir un nº al final (si es posible, es decir, 
     * la calculadora no está completa)
     *     
     */
    public void introducirNumero(int numero)    {
         //
        if(!estaLlena()){
            
         numeros[total] = numero;         
         total++;
         }
         else{
             System.out.println("LA CALCULADORA ESTÁ LLENA");
         }
    }

    /**
     *  devuelve true si la calculadora está completa
     *
     */
    public boolean estaLlena()    {
        return (total == MAX);
    }

    /**
     * Acessor para la cantidad de números en la calculadora
     */
    public int getTotal()    {
         return total;
    }

    /**
     * Contar los núemros mayores que uno dado
     */
    public int contarMayoresQue(int numero)    {
        int numMay = 0; //contador        
        for(int i = 0; i < total; i++){
            if(numeros[i]> numero){
                numMay++;
            }
        }
        
        return numMay;
    }

    /**
     * Intercambiar el valor de dos elementos del array
     * @param i posición de un nº a intercambiar
     *        j posición del segundo nº a intercambiar
     */
    public void intercambiar(int i, int j)    {
            int aux = numeros[i];
            numeros[i] = numeros[j];
            numeros[j] = aux;
    }

    /**
     * @param pos la posición a comprobar
     * @return true si es correcta
     */
    private boolean posicionCorrecta(int pos)    {
        return (pos >= 0 && pos <=total);
    }

    /**
     * 
     * @return true si la calculadora tiene algún número
     */
    private boolean hayNumeros()    {
        return total > 0;
    }

       /**
     *  devuelve un array con los números de la calculadora 
     *  con todos sus dígitos en orden decreciente
     *  Usa el método privado   enOrdenDecreciente() 
     *  Si numeros = {45, 6, 965, 123, 93, 489, 321}  devuelve {6, 965, 93, 321 }
     */
    public int[] todoDigitosDecreciente()     {
        int pos = 0; //contador
        int [] digs = new int[total];
        
        for(int i = 0; i< total; i++){
            if(enOrdenDecreciente(numeros[i])){
                digs[pos] = numeros[i];
                pos++;
            }
        }
        
        return digs;  
    }
    
    /**
     *  Dado un nº n indica si todos sus dígitos están en roden decreciente
     *  
     */
    public  boolean enOrdenDecreciente(int n)    {
        int aux1 = (n % 10);
        
        while  (true && n!=0 ){
            int aux2 = n % 10;
            n /= 10;
            if (aux1 < aux2){
                aux1 = aux2;
                return true;
            }
        }
        
        return false;
    }
    
    /**
     * 
     * Borra el último elemento del atributo numeros
     */
    public void borrarUltimoElemento()    {
         total--;
         
    }  
    
    /**
     *  Vacía la calculadora
     *
     */
    public void vaciar()    {
        total = 0;
    }


    /**
     * 
     * Muestra los números guardados en la calculadora
     */
    public void escribirNumeros()    { 
        String resul = "";
        for (int i = 0; i < total; i++) {
            resul += String.format("%4d", numeros[i]);
        }
        
        System.out.println(resul);
    }

    /**
     * @param n el nº a comprobar
     * @return true si n es par
     */
    private boolean esPar(int n)    {
        return (n % 2 == 0);
    }

    /**
     * Borra los números de valor par
     */
    public void borrarPares()    {
        for (int i = total; i > 0; i--){
            if(esPar(numeros[i])){
                
                borrarUnPar(i); //llamada interna
            }
        }
    }

    /**
     * Borra el valor de una determinada posición
     * @param pos la posición del valor a borrar
     * 
     */
    private void borrarUnPar(int pos)   {
        for (int j = total - 1; j >= 0; j--) {
            if (esPar(pos)) {
                System.arraycopy(numeros, j + 1,numeros, j, pos - j - 1);
                pos--;
            }
            
        }
    }

    /**
     * Inserta un nº en la posición indicada
     * @param numero el nº a insertar
     * @param pos la posción en la que se insertará
     */
    public  void insertarEnPosicion(int numero, int pos)    {
        if (!estaLlena()) {
            if (pos < total && pos >= 0 ){
                
                for(int i = pos - 1; i >= total; i--){
                    numeros[i + 1] = numeros[i];
                }
                
                numeros[pos] = numero;
                total++;
            }          
        }//
    }

}
