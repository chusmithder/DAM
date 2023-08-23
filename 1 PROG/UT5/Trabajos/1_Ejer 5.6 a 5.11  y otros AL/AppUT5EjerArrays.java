import java.util.Arrays;
/**
 *  
 */
public class AppUT5EjerArrays
{

    /**
     *  
     *  
     */
    public static void main(String[] args)    {
        //CALCULAR LA MEDIA DE LAS NOTAS
        double[] notas = {7.0, 2.3, 6.5, 4, 6, 7.5};
        //java con su api nos permite mostrar los valores
        double media = UT5EjerArrays.calcularMedia(notas);
        System.out.println("Notas:" + Arrays.toString(notas));//verlas con un form estandar
        //arrays es una api de la clase java
        System.out.println("Media: " + String.format("%5.2f", media));

        //CALCULAR EL MAXIMO DE LOS NUMEROS DE UNA ARRAY
        
        separador();
        int[] numeros = {3, 4 ,5 , 23 ,65 , 56};
        int maximo = UT5EjerArrays.maximo(numeros);
        System.out.println("Maximo: " + maximo);

        separador();
        int[] frecuencias = UT5EjerArrays.calcularFrecuencias();
        System.out.println("Frecuencias: " + Arrays.toString(frecuencias));
        
        separador();
        int[] pares = UT5EjerArrays.paresV1(numeros);
        System.out.println("Pares: " + Arrays.toString(pares));
        
        separador();
        pares = UT5EjerArrays.paresV2(numeros);
        System.out.println("Pares: " + Arrays.toString(pares));
        
        separador();
        int[] expandido = UT5EjerArrays.expandir(numeros);
        System.out.println("Extendido: " + Arrays.toString(expandido));
        
        separador();
        int[] rotado = UT5EjerArrays.rotarDerechaV1(numeros);
        System.out.println("Rotado v1: " + Arrays.toString(rotado));
        
        separador();
        UT5EjerArrays.rotarDerechaV2(numeros);
        System.out.println("Rotado v2: " + Arrays.toString(numeros));
    }

    /**
     * An example of a method - replace this comment with your own
     *
     * @param  y   a sample parameter for a method
     * @return     the sum of x and y
     */
    public static void separador()
    {
        System.out.println("*************************************************");
    }

}
