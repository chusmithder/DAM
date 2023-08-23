
/**
 *  Clase que guarda un array bidimensional
 *  y permite hacer ciertas operaciones sobre él
 */
public class Array2D
{
    public static final char LLAVE_APERTURA = '{';
    public static final char LLAVE_CIERRE = '}';
    private int[][] matriz;

    /**
     * Constructor  
     */
    public Array2D()    {
        matriz = new int[][]{  {1, 2, 3, 4},
            {14, 5, 26, 7},
            {17, 8, 19, 10},
            {10, 11, 12, 13} } ;
    }

    /**
     * Constructor  - crea  un array de 2 dimensiones con las filas y columnas
     * indicadas
     * @param filas  nº de filas del array 
     *  @param columnas nº de columnas del array
     */
    public Array2D(int filas, int columnas)    {
        matriz = new int[filas][columnas];

    }

    /**
     *  Inicializa la matriz con valores aleatorios entre 3 y 30 inclusive
     * Usa el mutador setValor
     */
    public void inicializar()    {
        //TODO

    }
    
    /**
     * @return el nº total de filas de la matriz 
     */
    public int getFilas()    {
         //TODO
        return 0;
    }

    /**
     * @return el nº total de columnas de la matriz 
     */
    public int getColumnas()    {
         //TODO
        return 0;
    }

    /**
     *  deja un valor en la fila y columna indicadas como parámetro
     *  asumimos f y c correctos
     *
     */
    public void setValor(int f, int c, int valor)   {
         //TODO

    }

    /**
     *  Representación textual de la matriz
     *
     */
    public String toString()    {
         //TODO
        return null;

    }

    /**
     *  
     * Escribir la matriz bidimensional en pantalla
     */
    public void escribir()    {
        System.out.println(this.toString());
    }

    /**
     * @param f la fila cuyos valores hay que sumar
     *          suponemos f correcto
     */
    public int sumarFila(int f)    {
         //TODO
        return 0;
    }

    /**
     * @param c la columna cuyos valores hay que sumar
     *          suponemos c correcto
     */
    public int sumarColumna(int c)   {
         //TODO
        return 0;
    }

    /**
     * Calcula y devuelve un array en el que cada elemento es la suma de las filas de matriz
     */
    public  int[] sumarFilas()   {
         //TODO
        return null;

    }

    /**
     * Calcula y devuelve un array en el que cada elemento es la suma de las columnas de matriz
     */
    public  int[] sumarColumnas()    {
         //TODO
        return null;

    }
    /**
     * @return calcula y devuelve la suma de la diagonal principal (suponiendo la
     * matriz cuadrada)
     */
    public   int sumarDiagonalPrincipal()   {
         //TODO
        return 0;
    }

    /**
     * @return calcula y devuelve la suma de la diagonal secundaria (suponiendo la
     * matriz cuadrada)
     */
    public   int sumarDiagonalSecundaria()  {
         //TODO
        return 0;

    }

    /**
     *   1  22  3   44
     *   3  7   5   11
     *   4  5   6   9
     *   La traspuesta es
     *   1   3   4
     *   22  7   5
     *   3   5   6
     *   44  11   9
     */
    public  int[][] traspuesta()   {
         //TODO

        return null;

    }

    /**
     * Calcula y devuelve la posición de la columna con suma máxima
     * Puedes ayudarte del método sumarColumna()
     */
    public  int columnaSumaMaxima()   {
         //TODO
         
        return 0;
    }
    /**
     * Intercambia la columna de suma máxima con la primera columna
     * Si son la misma no hace falta el intercambio
     */
    public  void intercambiar()   {
         //TODO
        
    }

    /**
     *  Devuelve un ragged array donde la 1ª fila
     *  contiene el primer elemento de la 1ª fila de matriz,
     *  la 2ª fila los 2 primeros elementos de la 2ª fila de matriz, 
     *  la 3ª fila los 3 primeros elementos de la 3ª fila de matriz, ...
     *  1   2   3   4   
     *  14  5   26  7   
     *  17  8   19  10  
     *  10  11  12  13  
     *  Resultado
     *  [1]
     *  [14, 5]
     *  [17, 8, 19]
     *  [10, 11, 12, 13]
     *  
     */
    public int[][] arrayRagged()   {
         //TODO
         
        return null;
    }

    /**
     *  Muestra el array pero de la forma indicada. Cada nº formateado a 5 posiciones.
     *  Usa las constantes definidas en la clase
     *  
     *  {   {    1,     2,     3,     4    }
     *      {   14,     5,    26,     7    }
     *      {   17,     8,    19,    10    }
     *      {   10,    11,    12,    13    }    }

     */
    public void escribirConLlaves()    {
         //TODO
        
    }

    /**
     *  Calcula y devuelve el total de impares en el array
     *  Hay que hacer uso del método contarImpares(int[], int n)
     *
     */
    public int contarImpares()   {
         //TODO
         
         
        return 0;

    }

    /**
     *  Cuenta los impares en el array unidimensional array de tamaño n
     *   
     *
     */
    private int contarImpares(int[] array, int n)   {
         //TODO
         
         

        return 0;
    }

    /**
     *  Devuelve el subarray obtenido a partir de matriz entre las filas fila1 y fila2
     *  y columnas col1 y col2 (ambas inclusive)
     *  Asumimos todos los valores correctos
     *  13  20  30  25  16  
     *  12  27  24  17  27  
     *  3   12  11  28  29  
     *  21  11  20  25  8   

     *  Subarray desde filas  1 a  3 y columnas 2 a 3
     *  [24, 17]
     *  [11, 28]
     *  [20, 25]
     *  
     *
     */
    public  int [][] obtenerSubArray(int fila1, int fila2, int col1, int col2)    {
         //TODO
         
         
        return null;

    } 

}
