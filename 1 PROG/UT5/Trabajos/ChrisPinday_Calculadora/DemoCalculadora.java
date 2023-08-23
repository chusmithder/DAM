import java.util.Arrays;

/**
 * clase DemoCalculadora...
 * 
 * @author Christhoper Pinday Delgado
 * @version 
 */
public class DemoCalculadora
{
    
    private Calculadora miCalculadora;
    private Calculadora tuCalculadora;
    /**
     * Constructor de la clase DemoCalculadora
     */
    public DemoCalculadora()    {
        this.miCalculadora = new Calculadora();
        this.tuCalculadora = new Calculadora();
    }

    public void testUno()    {
        int[] ArrayLocal = {16,134,156,189};
        
        for(int i = 0; i < ArrayLocal.length; i++){
            miCalculadora.introducirNumero(ArrayLocal[i]);
        }
        
        miCalculadora.escribirNumeros();
        System.out.print("\n");
        
        System.out.print(Arrays.toString(miCalculadora.todoDigitosDecreciente()));
        
        //////    
        System.out.print("\n");
        miCalculadora.borrarUltimoElemento();
        miCalculadora.escribirNumeros();
        System.out.print("\n");
        
        //////   
        miCalculadora.borrarPares();
        miCalculadora.escribirNumeros();
        System.out.print("\n");


    }

    public void testDos()    {
        
        for (int i = 0; i < 8; i++ ){
            tuCalculadora.introducirNumero(i *2);
        }
        
        tuCalculadora.escribirNumeros();
        System.out.println("\nHay " + 
            tuCalculadora.contarMayoresQue(6) + " mayores que 6.\n");

        for(int i = 0; i < 3; i++){
            tuCalculadora.borrarUltimoElemento();    
        }
        
        tuCalculadora.escribirNumeros();
        System.out.print("\nHay ");
        System.out.print(tuCalculadora.getTotal());
        System.out.println(" numeros en total ");
        tuCalculadora.vaciar();
        //
        System.out.print("\nTras vaciar hay ");
        System.out.print(tuCalculadora.getTotal());
        System.out.println(" numeros en total ");

        
    }

    public void testTres()    {
        miCalculadora.insertarEnPosicion(1, 0);
        miCalculadora.insertarEnPosicion(1, 1);
        miCalculadora.insertarEnPosicion(1, 2);
        
        miCalculadora.escribirNumeros();
    }
    
     /**
     *       
     */
    public static void main(String[] args) {
        DemoCalculadora calc = new DemoCalculadora();
        
        calc.testUno();
        calc.testDos();
        calc.testTres();
    }
}