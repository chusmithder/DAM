
/**
 * 
 */
public class AppCalculadora
{

    /**
     *  
    /**
     *  si no se pasan argumentos al main mostrar error,
     *  en caso contrario aceptar los argumentos, crear un array de enteros con ellos
     *  crear la calculadora a partir de los valores de ese array y mostrar la calculadora
     *  
     */
    public static void main(String[] args)    {
        if(args.length == 0){
            System.out.println("error en el n de argumentos" + 
            "Sintaxis: java AppCalculadora <n1> <n12> ..." );
            return; //finalizacion de la aplicacion, Si no devulve puede terminar su ej de 
            //forma
        }
        else{
            int[] numeros = new int[args.length];
            for(int i = 0; i < args.length; i++){
                numeros[i] = Integer.parseInt(args[i]);
            }
            Calculadora calcu = new Calculadora(numeros);
            System.out.println(calcu.toString());
        }
    }
}
