
/**
 * Clase para probar la clase Fraccion 
 * 
 * @author - Christhoper Pinday Delgado
 * @version 
 */
public class DemoFraccion
{
    private Fraccion fraccion1;
    private Fraccion fraccion2;

    /**
     * Constructor de la clase DemoFraccion
     */
    public DemoFraccion(){
         fraccion1 = new Fraccion(-4, 7);
         fraccion2 = new Fraccion(13, 2);
    }

    /**
     * calcula la suma, resta, producto y división de las dos fracciones
     *
     */
    
    public void demo1(){
        Fraccion suma = fraccion1.sumar(fraccion2);
        Fraccion resta = fraccion1.restar(fraccion2);
        Fraccion producto = fraccion1.multiplicar(fraccion2);
        Fraccion division = fraccion1.dividir(fraccion2);
       escribirFraccion("Fracción 1", fraccion1);
       escribirFraccion("Fracción 2", fraccion2);
       escribirFraccion("La suma es", suma);
       escribirFraccion("La resta es", resta);
       escribirFraccion("El producto es", producto);
       escribirFraccion("La división es", division);
       System.out.println();
    }
    
    /**
     *
     *   
     */
    private void escribirFraccion(String mensaje, Fraccion laFraccion){
        System.out.println(mensaje + "  " + laFraccion.toString());
        
    }
    
    /**
     *
     * Limpiar la pantalla    
     */
    private void borrarPantalla(){
       System.out.println('\u000C');
    }
    
    /**
     *
     *   
     */
     public void demo2(){
       fraccion1.setNumerador(17);
       fraccion1.setDenominador(25);
       fraccion2.setNumerador(16);
       fraccion2.setDenominador(11);
       escribirFraccion("Fracción 1", fraccion1);
       escribirFraccion("Fracción 2", fraccion2);
       if(fraccion1.menorQue(fraccion2)){
           System.out.println("La primera es menor que la segunda");
       }
       else if(fraccion1.igualQue(fraccion2)){
           System.out.println("La primera es igual a la segunda");
       }
       escribirFraccion("La copia es", fraccion1.clonar());
        System.out.println();       
    }
    
    
}
