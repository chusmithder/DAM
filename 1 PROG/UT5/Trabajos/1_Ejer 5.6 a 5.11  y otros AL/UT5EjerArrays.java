import java.util.Arrays;
import java.util.Random;
/**
 *  
 */
public class UT5EjerArrays
{
        private static Random generador = new Random();
    /**
     * Constructor  
     */
    public UT5EjerArrays()
    {

    }

    /**
     * Ejer 5.4 
     */
    public  void escribirArray()    {
        int[] valores = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        //impreimir cada valor en 3 posiciones
        for(int i = 0; i <= valores.length; i++){
            System.out.printf("%3d", valores[i]);
        }
    }

    /**
     * Ejer 5.5 
     * diaSemana ha de ser un valor entre 1 y 7
     * devolver el nombre del día de la 
     * semana  correspondiente   al   parámetro   que  se  pasa  al   método
     * Si  el  valor  del parámetro es incorrecto se devolverá la cadena “Día incorrecto”;
     * Definir y crear array como variable local
     */ 
    public static String  encontrarNombreDia(int diaSemana)    {
        // declarar e inicializar un array con los nombres de los días de la semana
        String[] semana = {"Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"};
        if (diaSemana < 1 || diaSemana > 7){
            return "Dia incorrecto";
        }
        return semana[diaSemana - 1];
    }

    /**
     *  
     * Ejer 5.6 - Calcular la media de los valores del
     * array recibido como argumento
     *  
     */
    public static double calcularMedia(double[] notas)    { //no hay ateributos por eso static
        double suma = 0; //acumulador
        for(int i = 0; i < notas.length; i++){
            suma += notas[i];
        }
        return suma / notas.length;  //el atributo length nos indica la cantidadd
    }

    /**
     *  
     * Ejer 5.7 - Calcular y devolver el máximo
     *  
     */
    public static int maximo(int[] enteros)    { 
        // int maximo = Integer.MIN_VALUE;
        // //empezaremos desde la posicion mas baja
        // for (int i = enteros.length - 1; i >= 0; i--){
        // if(enteros[i] > maximo){
        // maximo = enteros[i];
        // }
        // }
        // return maximo;
        int maximo = Integer.MIN_VALUE;
        //empezaremos desde la posicion mas baja
        for (int i = enteros.length - 1; i >= 0; i--){
            maximo = Math.max(maximo, enteros[i]);
        }
        return maximo;
    }

    /**
     *  
     * Ejer 5.8 -  devolver otro 
     * array con los valores pares encontrados en el original
     *  V1 - Contamos primeros los pares, creamos un array con
     *  longitud la cantidad de pares, dejamos los pares y lo devolvemos
     */
    public static int[] paresV1(int[] enteros)    {
        int pares = 0; //acumulador
        for(int i = 0; i < enteros.length; i++){
            if(enteros[i] % 2 == 0){
                pares++;
            }
        }
        int p = 0;
        int[] arrayPares = new int[pares];
        for(int i = 0;i < enteros.length; i++){
            if(enteros[i] % 2 == 0){
                arrayPares[p] = enteros[i];
                p++;
            }
        }
        return arrayPares;
    }

    /**
     *  
     * Ejer 5.8 -  devolver otro 
     * array con los valores pares encontrados en el original
     *  V2 -  Creamos un nuevo array de tamaño el original y dejamos los pares
     *  Devolvemos una copia de ese array con exactamente los pares guardados
     *  (para hacer la copia System.arraycopy() o Arrays.copyOf() )
     */
    public static int[] paresV2(int[] enteros)    {
        int[] arrayPares = new int[enteros.length];
        int p = 0;
        for(int i = 0; i < enteros.length; i++){
            if(enteros[i] % 2 == 0){
                arrayPares[p] = enteros[i];
                p++;
            }
        }
        return  Arrays.copyOf(arrayPares, p);
    }

    /**
     *  
     * Ejer 5.9 -  rotar una posición a la derecha el array numeros
     *  Rotar sobre un nuevo array
     */
    public static int[] rotarDerechaV1(int[] enteros)    {
        int[] rotado = new int [enteros.length];
        for(int i = 0; i < enteros.length - 1; i++){
            rotado[i + 1] = enteros[i];
            
        }
        rotado[0] = enteros[enteros.length - 1];
        return rotado;
    }

    /**
     *  
     * Ejer 5.9 -  rotar una posición a la derecha el array numeros
     *  Rotar sobre el mismo array array
     */
    public static void rotarDerechaV2(int[] enteros)    {
        int aux = enteros[enteros.length - 1];        
        for(int i = enteros.length - 2; i >= 0; i--){
            enteros[i + 1] = enteros[i];
        }
        enteros[0] = aux;
    }

    /**
     *  Ejer 5.10 
     *  crea un nuevo array con el doble de tamaño que el original
     *  guarda en el nuevo array cada elemento del original copiado dos veces
     *  Si numeros = {2, 3, 4, 5, 6} el array expandido será {2, 2, 3, 3, 4, 4, 5, 5, 6, 6} 
     *   
     */
    public static int[]  expandir(int[] numeros)    {
        int[] resul = new int[2 * numeros.length];
        int p = 0;
        for(int i = 0; i < numeros.length; i ++){
            resul[p] = numeros[i];
            resul[p + 1] = numeros[i];
            p += 2;
        }
        return resul;
    }

    /**
     *  
     * Ejer 5.11 -  generar 100  aleatorios entre 1 y 9 y devolver la frecuencia de aparición del valor 1, del 
     * valor 2, del valor 3, …
     *  
     */
    public static int[] calcularFrecuencias( )    {
        int[] frecuencias = new int[9];
        // necesitamos un acumulador
        
        
        for (int i = 1; i < 100; i++){
            int aleatorio = generador.nextInt(9) + 1;
            frecuencias[aleatorio - 1]++;  
        }
        return frecuencias;
    }

    /**
     *  Copiua de una array manualmente
     *
     * @param  
     * @return      
     */
    public static int[] copiarV1(int[] lista) {
        int[] copia = new int[lista.length];
        for(int i = 0; i < lista.length; i++) {
            copia[i] = lista[i];
        }
        return copia;
        //la api nos da metodos para hacer la copia mas rapido
    }

    /**
     *  Copiar de una array con System.arraycopy()
     *  De la clase System
     * @param  
     * @return      
     */
    public static int[] copiarV2(int[] lista) {
        //para usar debemos crear el aray vacio
        int[] copia = new int[lista.length];
        System.arraycopy(lista, 0, copia, 0, lista.length); 
        return copia;
    
    }

    /**
     *  Copiar de una array con Arrays.copyOf()
     *  De la clase System
     * @param  
     * @return      
     */
    public static int[] copiarV3(int[] lista) {
        //para usar debemos crear el aray vacio
        int[] copia = Arrays.copyOf(lista, lista.length); 
        // si tenemos un array de 5 espacios y en lista.length ponemos 10, los 5 ultim os se completarian con '
        
        return copia;
    }
}
