import java.util.Scanner;
import java.util.Random;

/**
 *  Clase que inclute métodos para probar la
 *  sentencia iterativa while
 *   
 */
public class DemoWhileUno
{
    private final char ESPACIO = ' ';
    private final char ASTERISCO = '*';

    private Random generador;
    private Scanner teclado;
    private Dado dado;
    private Moneda moneda;

    /**
     * Constructor  
     */
    public DemoWhileUno()
    {
        generador = new Random();
        teclado = new Scanner(System.in);
        moneda = new Moneda();
        dado = new Dado();
    }

    /**
     *  
     * Escribir un saludo 10 veces
     *  
     * 
     */
    public void ejemplo01()
    {

    }

    /**
     *  
     * Tirar una moneda 10 veces
     * 
     */
    public void ejemplo02()
    {

    }

    /**
     *  
     * Tirar una moneda 30 veces
     * contando las veces que ha salido cara y las que ha salido cruz
     * Uso de contadores
     */
    public void ejemplo03()
    {
        int caras = 0;
        int cruces = 0;
        
        int tiradas = 1;
        while(tiradas <= 30){//mientras 
        moneda.tirar();    
        if(moneda.esCara()){
            caras++;     
        }
        else{
            cruces++;
        }
        
        tiradas++;
        }
        System.out.println("Caras: " + caras);
        System.out.println("Cruces: " + cruces);
        
    }

    /**
     *  
     * Suma y producto de los números naturales desde el 20 hasta el 1
     * Uso de acumuladores
     */
    public void ejemplo04()
    {        
        //dos variables que funcionaran como acumuladores
        int suma = 0;
        long producto = 1;
        int numero = 20;
        
        while(numero >= 1){
              suma += numero;
              producto *= numero;    
            numero--;
        }
        System.out.println("Suma: " + suma);
        System.out.println("Producto: " + producto);
    }

    /**
     *  Generar aleatorios entre 10 y 50 inclusive y escribirlos
     *  El bucle termina cuando sale el 25
     *  Mostrar los números en filas de 6 formateados a 4 espacios
     *  
     *  Bucle controlado por un valor centinela_
     */
    public void ejemplo05( )
    {
        int total = 0; //cada 6 numeros harre un salto de linea
        int aleatorio = generador.nextInt(41) + 10;
        //bucle con numero indeterminado de repeticiones
        while(aleatorio != 25){
            System.out.printf("%4d", aleatorio);
            total++;
            if(total % 6 == 0){
                System.out.println();
            }
            aleatorio = generador.nextInt(41) + 10;
            
        }
    }

    /**
     *  Generar aleatorios entre 0 y 50 inclusive y sumarlos.
     *  Parar cuando salga el 0. Escribir al final la suma
     *  Bucle controlado por un valor centinela
     */
    public void ejemplo06( )
    {

    }

    /**
     *  
     * Tirar una moneda reiteradamente 
     * hasta que salga cara o se hayan hecho 30 tiradas
     * Usar una variable booleana como conmutador (o switch - flag) para
     * salir del bucle
     */
    public void ejemplo07()
    {
        int tiradas = 1;
        boolean salioCara = false;
        while(tiradas <= 30 && !salioCara){
            moneda.tirar();
            
            if(moneda.esCara()){
                salioCara = true;
            }
            else{
                tiradas++;
            }
            
        }
        if(tiradas > 30) {
            System.out.println("No ha salido cara");
        }
        else{
            System.out.println("Salio cara en la tirada " + tiradas);

        }
    }

    /**
     *  Suma de pares entre 1 y 100
     *  y producto de impares entre 1 y 100 
     *   
     */
    public  void ejemplo08()
    {
        // int sumaPares = 0;
        // long productoImpares = 1; //ya que el valor es muy grande
        // int i = 2;; //puedo reutlizar la i
        // while(i <= 100){
            // sumaPares += i;           
            // i += 2;
        // }
        
        // i = 1;
        // while (i <= 99){
            // productoImpares += 1;
            // i += 2;
        // }
        int sumaPares = 0;
        long productoImpares = 1; //ya que el valor es muy grande
        int i =1;; //puedo reutlizar la i
        while(i <= 100){
            productoImpares *= i;
            sumaPares += (1 + i);           
            i += 2;
        }
        
    }

    /**
     *  Suma de pares entre 1 y 100
     *  y producto de impares entre 1 y 100 
     *  Con una variable booleana que actúe de switch o conmutador
     *  
     */
    public  void ejemplo09()
    {

    }

    /**
     * Generar n aleatorios entre 5 y 15 inclusive y contar los pares, los que acaban en 2
     * y sumar los impares
     * __ Calcular el maximo de todos ellos___
     */
    public  void ejemplo10(int n)
    {
        int maximo = Integer.MIN_VALUE; // el valor inicial sera el mas pequeño que puueda tomar
        int enDos = 0;
        int impares = 0;
        int pares = 0;
                
        int i = 1;
        while(i <= n){
            int aleatorio = generador.nextInt(11) + 5;
            if(aleatorio % 2 == 0){
                pares++;
                if(aleatorio % 10 == 0){
                    enDos++; // se hace la pregunta aqui
                }
            }
            else{
                impares += aleatorio;
            } 
            if(aleatorio > maximo){
                maximo = aleatorio;
            }
            i++; 
            
        }
        System.out.println("Maximo: " + maximo);
        System.out.println("Pares: " + pares);
        System.out.println("Suma impares: " + impares);

    }

    /**
     * Tirar un dado repetidas veces hasta que salga un 6.
     * Contar las tiradas y sumarlas (se excluye el 6 de los cálculos)
     */
    public  void ejemplo11(int n)
    {

    }

    /**
     *  Pregunta 9 del cuestionario I UT4
     *  
     *  Pide al usuario una letra y valida con un bucle while que sea una vocal 
     *  minúscula. Si no es así pide de nuevo  al usuario otra letra hasta que 
     *  introduzca una letra correcta (hazlo con un while)
     */
    public void ejemplo12()
    {

    }

    /**
     *  Calcular y devolver el nº de cifras de numero
     */
    public int contarCifras(int numero)
    {

        return 0;
    }

    /**
     *  Calcular el inverso de un nº (sin contar previamente sus cifras)
     */
    public int inversoV1(int numero)
    {

        return 0;
    }

    /**
     *  Calcular el inverso de un nº (contando previamente sus cifras)
     */
    public int inversoV2(int numero)
    {

        return 0;
    }

    /**
     * Hacer una traza en papel  de este método y deducir qué salida produce
     * para las llamadas  misterio(1);       misterio(6);    
     *              misterio(19);  misterio(39);     misterio(74);
     */
    public   void misterio1(int x)
    {
        int y = 1;
        int z = 0;
        while (2 * y <= x)   {
            y = y * 2;
            z++;
        }
        System.out.println(y + " " + z);
    }

    /**
     * Para hacer la traza en papel
     */
    public  int misterio2(int a, int b)
    {
        int p = 1;
        int contador = 1;
        while (contador <= b)   {
            p = p * a;
            contador ++;
        }
        return p;

    }

    /**
     * Para hacer la traza en papel
     */
    public  int misterio3(int a, int b)
    {
        int s = 0;
        int contador = 1;
        while (contador <= b)    {
            s = s + a;
            contador ++;
        }
        return s;

    }

    /**
     * Para hacer la traza en papel
     * Qué devuelve si llamamos misterio4(100) ?
     */
    public static void misterio4(int n) {
        int i = 2;
        while (n > 1) {
            if (n % i == 0) {
                System.out.print(i + "\t");
                n = n / i;
            }
            else {
                i++;
            }
        }
    }

    /**
     * Para hacer la traza en papel
     * Qué devuelve si llamamos misterio5(35207) ?
     */
    public int misterio5(int n)
    {
        int r = 0;
        while (n != 0) {
            int d = n % 10;
            n = n / 10;
            if (d % 2 != 0) {
                r += d;
            }
        }
        return r;
    }

    /**
     * Generar 20 nºs aleatorios entre 5 y 10 incluidos
     * y para cada número calcular y escribir su sumatorio
     */
    public  void bucleAnidado01()
    {

    }

    /**
     * Generar 10 nºs aleatorios entre 5 y 50 incluidos
     * y mostrar un  histograma
     * 
     *  7: * * * * * * *
    6: * * * * * *
    7: * * * * * * *
    9: * * * * * * * * *
    10: * * * * * * * * * *
    8: * * * * * * * *
    9: * * * * * * * * *
    10: * * * * * * * * * *
    5: * * * * *
    9: * * * * * * * * *
     */
    public  void bucleAnidado02()
    {

    }

    /**
     * Mostrar la siguiente figura  (6 filas y 10 columnas)
     *  1 1 1 1 1 1 1 1 1 1
     *  2 2 2 2 2 2 2 2 2 2
     *  3 3 3 3 3 3 3 3 3 3
     *  4 4 4 4 4 4 4 4 4 4
     *  5 5 5 5 5 5 5 5 5 5
     *  6 6 6 6 6 6 6 6 6 6
     * 
     */
    public  void bucleAnidado03()
    {

    }

    /**
     * Mostrar la siguiente figura  (6 filas y 10 columnas)
     *  1
     *  1 2
     *  1 2 3
     *  1 2 3 4
     *  1 2 3 4 5
     *  1 2 3 4 5 6
     *  ...................
     *  
     */
    public  void bucleAnidado04()
    {

    }

    /**
     *  Mostrar la serie usando escribirEspacios()
     *        1
     *       21
     *      321
     *     4321
     *    54321
     *   654321
     *  7654321
     *
     *  
     */
    public  void bucleAnidado05(int n)
    {

    }
    /**
     *  escribir n espacios
     *  
     */
    private void escribirEspacios(int n)
    {

    }

    /**
     * El programa hace una pausa de los milisegundos especificados
     */
    public void esperar(int milisegundos)
    {
        try {
            Thread.sleep(milisegundos);
        } 
        catch (Exception e)  {
            // ignorar la excepción
        }
    }

}
