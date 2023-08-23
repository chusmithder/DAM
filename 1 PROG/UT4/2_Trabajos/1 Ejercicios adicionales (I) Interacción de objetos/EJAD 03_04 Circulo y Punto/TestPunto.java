
/**
 *Testea la clase punto
 */
public class TestPunto
{
     
    /**
     * Constructor  
     */
    public TestPunto()    {
         
    }

    /**
     * 
     */
    public void test() {
         Punto p1 = new Punto(3, 8);
         Punto p2 = new Punto(12, 9);
         System.out.println("Punto p1: " + "\n" + p1.toString() + "\n" 
                         + "Punto p2: " + "\n" + p2.toString() + "\n");
         System.out.println("Distancia de p1 al origen: " + p1.getDistanciaDesdeOrigen() + "\n");
         System.out.println("Distancia entre ambos puntos: " + p1.getDistanciaDesde(p2) + "\n");
    }
}
