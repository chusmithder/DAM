
/**
 *  
 * 
 * @author  
 * @version  
 */
public class demoCuadrado
{
     private Cuadrado cuadrado1;
     private Cuadrado cuadrado2;
     private Cuadrado cuadrado3;
     

    /**
     * Constructor  
     */
    public demoCuadrado()    {
         
    }

    /**
     *  Crear el cuadrado uno con el segundo constructor
     *   devolver la hora
     *   
     *   
     */
    public void demoConstructor1()    {
        
        cuadrado1 = new Cuadrado();
         System.out.println("Area = " + cuadrado1.calcularArea());
    }
    
    /**
     *  Crear el cuadrado dos con el segundo constructor
     *       
     */
    public void demoConstructor2()    {
         cuadrado2 = new Cuadrado(6, 7, 58);
         System.out.println("Area = " + cuadrado1.calcularArea());
    }
    
    /**
     *   Crear el cuadrado dos con el tercer constructor
     * Creal el cuadrado 3 no el 2  
     * null * cualquier metodo = error
     */
    public void demoConstructor3()    {
        Punto punto = new Punto(7,99);  
        cuadrado3 = new Cuadrado(punto, 58);
         System.out.println("Area = " + cuadrado3.calcularArea());
    }
    //
}
