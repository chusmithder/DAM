import java.util.Random;
/**
 *    Christhoper Pinday Delgado
 */
public class PracticaBucles {
    private final char ESPACIO = ' ';
    private final char CARACTER = '\u0040';
    private Random generador;

    /**
     * Constructor  
     */
    public PracticaBucles()    {
        generador = new Random();
    }

    /**
     *  El método  genera  números aleatorios  entre -1000 y 5000 (inclusive)
     *  y calcula y escribe:
     *      - la media de todos los números
     *      - la suma de los impares
     *      - el máximo de los pares
     *        
     *  El proceso termina cuando sale un 0 o bien se han escrito n nºs
     *  
     *  Los números se escriben  en filas de 5 columnas 
     *  Cada nº aleatorio se muestra en un espacio de 12 posiciones en la pantalla  
     *  y al lado de cada nº se muestra otro nº con las mismas cifras y 
     *  en el mismo orden pero sin ceros (en 5 posiciones)
     *  
     *   Utiliza solo bucles while
     */
    public void generarNumeros(int n)   {
        int aleatorio = generador.nextInt(6001) - 1000;
        int sumaImpar = 0; //acumulador
        
        int sumaPar = 0; // acumulador--------------------> mine
        
        int maxPar = Integer.MIN_VALUE; //acumulador
        int i = 1; //contador
        int j = 1;
        
        System.out.println("Nº maximo de aleatorios a generar " + n + "\n" +
                            " o hasta que salga el 0");
        System.out.println();
        while (aleatorio != 0 && i <= n){
            if (aleatorio % 2 == 0){
                sumaPar += aleatorio;
                if (aleatorio > maxPar){
                    maxPar = aleatorio;
                }
            }
            else{ //impar
                sumaImpar += aleatorio; 
            }
            //terminal--------------------------------------------------
            System.out.printf("%12d: %5d", aleatorio, obtenerNumeroSinCeros(aleatorio));
            j++;
            if(j % 5 == 0){
                System.out.println();
            }
            aleatorio = generador.nextInt(6001) - 1000;
            i++;
        }
        System.out.println();
        double media = (sumaPar * 1.0 + sumaImpar) / (i * 1.0 - 1); //acumulador
        System.out.printf("%25s: %10.2f\n", "Media", media);
        System.out.printf("%25s: %10d\n", "Suma impares", sumaImpar);   
        System.out.printf("%25s: %10d\n", "Maximo pares", maxPar);
    }

    /**
     *  Devuelve true si numero es impar, false en otro caso
     *  Hazlo sin utilizar if
     */
    public boolean esImpar(int numero)   {
        return (numero % 2 != 0);
    }

    /**
     *  Dado un nº genera y devuelve otro nuevo 
     *  con las mismas cifras y en el mismo orden pero sin 
     *  los 0
     *  Ej - si numero = 2040 devuelve  24, si numero = 1009 devuelve  19
     *  si numero = 3000 devuelve 3
     *   
     *   
     */
    public int obtenerNumeroSinCeros(int numero) {
        int resul = 0;
        int exponente = 0;
        while (numero != 0){
            int resto = numero % 10;
            if(resto != 0){
                resul = resul + resto * (int)Math.pow(10, exponente);
                exponente++;
            }
            numero = numero / 10;
        }
        return resul;
    }

    /**
     *  Borrar la pantalla
     *
     */
    public void borrarPantalla()    {
        System.out.println('\u000C');
    }

    /**
     *  
     *  Dibuja la letra N (ver figura en el enunciado)
     *  Con bucles for
     *  
     *  Hay que usar el método escribirCaracter()
     *  
     *  
     *   
     */
    public void escribirLetraN(int altura)    {
        int i = 1;
        System.out.println("Letra N - Altura: " +  altura);
        while (i <= altura){
            escribirCaracter(CARACTER, 1);
            escribirCaracter(ESPACIO, i - 1);
            escribirCaracter(CARACTER, 1);
            escribirCaracter(ESPACIO,altura - i );
            escribirCaracter(CARACTER, 1);
            System.out.println();
            i++;
        }
        System.out.println();
    }
    
    /**
     *  escribe n veces el caracter  indicado en la misma línea
     *  con bucles for
     */
    public void escribirCaracter(char caracter, int n)    {
        for (int i = 1; i <= n; i++){
            System.out.print(caracter);
        }
    }

}
