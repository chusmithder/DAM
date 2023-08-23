import java.util.HashMap;
import java.util.Set;
import java.util.ArrayList;
import java.util.Arrays;
/**
 * Clase ConversorRomanos representa a un
 * objeto que puede convertir u nº romano
 * a un nº arábigo
 */


public class ConversorRomanos
{
    private HashMap<Character, Integer> tabla; 
    
    /**
     * Constructor 
     */
    public ConversorRomanos() {
        tabla = new HashMap<>();
        inicializar();
    }

    /**
     * Da valores iniciales al map
     */
    private void inicializar()
    {
        String letras = "MDCLXVI";
        int[] numeros = {1000, 500, 100, 50, 10, 5, 1};
        for (int i = 0; i < numeros.length; i++) {
            tabla.put(new Character(letras.charAt(i)), numeros[i]);
        }
    }

    /**
     * convierte el nº romano a arábigo
     * @param el nº romano a convertir
     * @return el nº arábigo
     */
    public int convertir(String romano) {   
        int arabigo = 0;
        char[] arrayRomano = romano.toUpperCase().toCharArray();
        //[v,i,i,i]
        ArrayList<Character> lista = new ArrayList<>();
        for (char c: arrayRomano) {
            lista.add(new Character(c));
        }
        //recorrido por la tabla...
        for (Character c: lista) {
            int num = tabla.get(c);//autoboxing
            arabigo += num;
        }
        return arabigo;
    }
}
