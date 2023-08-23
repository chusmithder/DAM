import java.util.Random;
import java.util.Scanner;
/**
 * 
 */
public class DemoFor
{
    private Moneda moneda;
    private Random generador;
    private Scanner teclado;
    
    /**
     * Constructor  
     */
    public DemoFor()
    {
        moneda = new Moneda();
        teclado= new Scanner(System.in);
        generador = new Random();
    }

    /**
     * Saludar 10 veces con for
     */
    public  void ejemploFor01()
    {
        // //para ieraciones en las que se sabe ekl numero exacto de repeticiones
        // int i = 1;
        // while(i<= 10){
            // System.out.println("Hola");
            // i++;
        // }
        // //cuando la ejeucion es falsa se ejecuta desde la siguiente sentecia
        for(int i =  1;i <= 10;i++){
            System.out.println("Hola");
            //nunca modificar la i en este bloque, el for se encarga. i es local al for
        }
    } //2
    
    
    /**
     * Tirar una moneda 10 veces con for
     */
    public  void ejemploFor02()
    {
        
    }

    /**
     * Tirar una moneda 30 veces
     * contando las veces que ha salido cara y las que ha salido cruz
     */
    public  void ejemploFor03()
    {
        
    }
    
     /**
     *  Impares entre 1 y 19
     *  1, 3, 5, 7, 9, 11, 13, 15, 17, 19
     *  
     */
    public void imparesEntre1y20()
    {
         for(int i = 1;i <= 20;i += 2){
            System.out.printf("%4d", i);
         }

    }
    
    /**
     *  Generar n aleatorios entre -10 y 50 y calcular y escribir el máximo y cuántas veces aparece
     *
     *  
     */
    public void maximo(int n)
    {
         
    }
    
     /**
     * Cuenta la cantidad de divisores del parámetro recibido
     * Con for
     */
    public int contarDivisores(int numero)
    {
         // int divisores = 0;
         // for(int i = 1; i <= numero; i++){ 
             // if(numero % i == 0){
                 // divisores++;
             // }
         // }
         // return divisores;
         if(numero ==  1){
             return 1;
         }
         int divisores = 2;
         for(int i = 2; i < numero / 2; i++){ 
             if(numero % i == 0){
                 divisores++;
             }
         }
         return divisores;
    }//3
    
    
    /**
     * Ejer 4.14 f)
     *  Calcula y devuelve la suma de los divisores de 
     *  numero - Con for
     */
    public int sumarDivisores(int numero)
    {
        //+=
         return 0;
    }
    
    /**
     * Ejer 4.14 h)
     * Sin método adicional de ayuda
     * Buscamos divisores desde el 2 hasta la mitad del número
     * Si se encuentra alguno sabremos que no es primo, en caso contrario lo será
     * Con for saliendo del bucle con return en cuanto sepamos que no es primo
     */
    public  boolean esPrimoV1(int numero)
    { 
        return contarDivisores(numero) == 2;
    }//4
 
    /**
     * Ejer 4.14 h)
     * Sin método adicional de ayuda
     * Buscamos divisores desde el 2 hasta la mitad del número
     * Si se encuentra alguno sabremos que no es primo, en caso contrario lo será
     * Con for saliendo del bucle con return en cuanto sepamos que no es primo
     */
    public  boolean esPrimoV2(int numero)
    {
        for(int i = 2; i <= (numero /2); i++){
            if(numero % i == 0){//desde 2 hasta la mitad
                return false; 
            }
        }
        return true;
    }//5

    
     /**
     *  Calcula y escribe la siguiente serie
     *  1 + 2 elevado a 2 + 3 elevado a 2 + 4 elevado a 2 +   .... + n elevado a 2
     *
     */
    public void serieCuadrados(int n)
    {
        // int suma = 0; 
        // for(int i = 1; i <= n; i++){
             // suma += Math.pow(i,2);
        // }
        // System.out.println("Suma: " + suma);
        int suma = 1; 
        for(int i = 2; i <= n; i++){
             suma += Math.pow(i,2);
        }
        System.out.println("Suma: " + suma);
    }//6
    
     /**
     *  Genera n pares de números entre 5 y 20 y
     *  calcula su producto mediante sumas
     *
     */
    public void productoMedianteSumas(int n)
    {
         for(int par = 1; par <= n; par++){
             int aleatorio1 = generador.nextInt(16) + 5;
             int aleatorio2 = generador.nextInt(16) + 5;
             int producto = 0;
             for(int i = 1; i <= aleatorio2; i++){
                 producto += aleatorio1;
             }
             System.out.printf("%4d%4d% Poducto = %4d ", aleatorio1, aleatorio2, producto);
         }
    }//7
    

    /**
     * Ejer 4.15 a) de la UT4
     * Escribe la siguiente figura 
     * Si n = 6 entonces
     * 1   1   1   1   1   1 
     * 2   2   2   2   2  2
     * 3   3   3   3   3  3
     * 4   4   4   4   4  4
     * 5   5   5   5   5   5 
     * 6   6   6   6   6  6 
     */
    public  void escribirFiguraA(int n)
    {
        
    }

    /**
     * Ejer 4.15 b) de la UT4
     * Escribe la siguiente figura 
     *  Si n = 6 entonces
     *  
     * 1   
     * 2   2   
     * 3   3   3   
     * 4   4   4   4   
     * 5   5  5   5   5   
     * 6   6   6   6   6  6 
     */
    public  void escribirFiguraB(int n)
    {
        
    }

    /**
     * Ejer 4.15 c) de la UT4
     * Escribe la siguiente figura
     *  Si n = 6 entonces
     *  
     * 1   
     * 1  2
     * 1  2   3
     * 1  2   3    4
     * 1  2    3    4   5 
     * 1  2   3   4   5   6 
     */
    public  void escribirFiguraC(int n)
    {
        
    }

    /**
     *  Ejer 4.15 d) de la UT4
     *   escribe la tabla de multiplicar del 1, del 2, 
     *   del 3, .... hasta la tabla de numero
     */
    public  void   escribirTablasMultiplicar(int  numero) 
    {
         
    }
    
        
    /**
     *  ....1
     *  ...2.
     *  ..3..
     *  .4...
     *  5....
     *
     *  
     */
    public void cuadroConPuntos(int n)
    { 
        
    }
    
     /**
     *  Escribe n puntos en la misma línea
     *  
     */
    public void escribirPuntos(int n)
    {
         
    }
    
     /**
     *  Mostrar figura para N filas
     *  A
     *  BB
     *  CCC
     *  DDDD
     *  EEEEE
     *  FFFFFF
     *  GGGGGGG
     *  .........
     *  MMMMMMMMMMMM
     *
     *  
     */
    public void trianguloLetras(int n)
    {
        

    }

    /**
     *  Mostrar la siguiente figura 
     *  ABCD...................Z
     *  BCD...................Z
     *  CDEF.................Z
     *   ..........
     *
     *  Z
     */
    public void trianguloLetrasOtro()
    {
        

    }

    /**
     * El programa hace una pausa de los milisegundos especificados
     */
    public void esperar(int milisegundos)
    {
        try   {
            Thread.sleep(milisegundos);
        } 
        catch (Exception e)  {
            // ignorar la excepción
        }
    }
}
