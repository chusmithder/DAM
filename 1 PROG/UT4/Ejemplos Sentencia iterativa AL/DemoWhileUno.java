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
        int veces = 1;
        while(veces <= 10){
            System.out.println("Saludo: " + veces);
            veces++;
        }

    }

    /**
     *  
     * Tirar una moneda 10 veces
     * 
     */
    public void ejemplo02()
    {
        int tiradas = 1;
        while(tiradas <= 10){
            moneda.tirar();
            tiradas++;
        }
    }

    /**
     *  
     * Tirar una moneda 30 veces
     * contando las veces que ha salido cara y las que ha salido cruz
     * Uso de contadores
     */
    public void ejemplo03()
    {
        int tiradas = 1; //es una variable contador
        int vecesCara = 0; //es una variable contador
        int vecesCruz = 0; 

        while(tiradas <= 30){
            moneda.tirar();
            if(moneda.esCara()){
                vecesCara++;
            }
            else{
                vecesCruz++;
            }
            tiradas++;
        }
        System.out.println("Numero de tiradas" + (tiradas - 1));
        System.out.println("Ncaras:" + vecesCara);
        System.out.println("Ncruces:" + vecesCruz);        
    }

    /**
     *  
     * Suma y producto de los números naturales desde el 20 hasta el 1
     * Uso de acumuladores
     * Acumulador - variable cuyyo valor se incrementa en cantidades variables
     * contador - variables cuyo valor se incrementa UNA CANTIDAD FIJA, + o -
     */
    public void ejemplo04()
    {
        int suma = 0;
        int producto = 1;
        int contador = 1;

        while (contador <= 20){
            suma = suma + contador;
            producto = producto * contador;
            contador++;
        }
        System.out.println("");
    }

    /**
     *  Generar aleatorios entre 10 y 50 inclusive y escribirlos
     *  El bucle termina cuando sale el 25
     *  Mostrar los números en filas de 6 formateados a 4 espacios
     *  
     *  Bucle controlado por un valor centinela
     */
    public void ejemplo05( )
    {

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

    }

    /**
     *  Suma de pares entre 1 y 100
     *  y producto de impares entre 1 y 100 
     *   
     */
    public  void ejemplo08()
    {

    }

    /**
     *  Suma de pares entre 1 y 100
     *  y producto de impares entre 1 y 100 
     *  Con una variable booleana que actúe de switch o conmutador
     */
    public  void ejemplo09()
    {

    }

    /**
     * Generar n aleatorios entre 5 y 15 inclusive y contar los pares, los que acaban en 2
     * y sumar los impares
     */
    public  void ejemplo10(int n)
    {

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

    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    /**
     *  Genera n aleatorios entre 5 y 20
     *  cuenta los pares 
     *  sumar los impares
     *  multiplicar los que acaban en 2
     *  mostrar con println()
     * @param  
     * @return      
     */
    public void ejemploUNO(int n) {
        int contador = 1; //contador
        int pares = 0; //acumulador
        int impares = 0; //acumulador
        int acabanEnDos = 1; //acumulador
        while (contador <= n){
            int generador = (int)(Math.random() * 16) + 5;
            if(generador % 2 == 0){
                pares++;
            }
            
            if (generador % 2 != 0){
                impares += generador;
            }
            
            if (generador / 10 == 2){
                acabanEnDos *= generador;
            }
            contador++;
        }
        System.out.println("Numero de pares: " + pares);
        System.out.println("Suma de impares: " + impares);
        System.out.println("Producto de acaban en 2: " + acabanEnDos);
    }

}
