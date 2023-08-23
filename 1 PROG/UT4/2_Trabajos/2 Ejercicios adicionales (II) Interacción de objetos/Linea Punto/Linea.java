
/**
 *  
 * 
 * @author  Christhoper Pinday Delgado
 * @version  
 */
public class Linea
{
    private Punto punto1;
    private Punto punto2;

    /**
     * Constructor  
     */
    public Linea()    {
        punto1 = new Punto(0, 0);
        punto2 = new Punto(0, 0);
    }

    /**
     * 
     */
    public Linea(Punto puntoA, Punto puntoB) {
        punto1 = puntoA;
        punto2 = puntoB;
    }

    /**
     * 
     */
    public void moverDerecha(int distancia) {
        punto1.desplaza(distancia, 0);
        punto2.desplaza(distancia, 0);
    }

    /**
     * 
     */
    public void moverIzquierda(int distancia) {
        punto1.desplaza(-1 * distancia, 0);
        punto2.desplaza(-1 * distancia, 0);
    }

    /**
     * 
     */
    public void moverArriba(int distancia) {
        punto1.desplaza(0, distancia);
        punto2.desplaza(0, distancia);
    }

    /**
     * 
     */
    public void moverAbajo(int distancia) {
        punto1.desplaza(0, -1 * distancia);
        punto2.desplaza(0, -1 * distancia);
    }

    /**
     * ACCESOR punto1
     */
    public String getPunto1() {
        String resul = "[" + punto1.getX() + "," + punto1.getY() + "]";
        return resul;
    }

    /**
     * ACCESOR punto2
     */
    public String getPunto2() {
        String resul = "[" + punto2.getX() + "," + punto2.getY() + "]";
        return resul;
    }

    /**
     * MUTADOR punto1
     */
    public void setPunto1(int x, int y) {
        punto1.setX(x);
        punto1.setY(y);
    }
    
    /**
     * MUTADOR punto1
     */
    public void setPunto2(int x, int y) {
        punto2.setX(x);
        punto2.setY(y);
    }

    /**
     * 
     */
    public void printLinea() {
        System.out.println("Punto 1 -  Valor de x= " + punto1.getX() + "\n" +
            "           Valor de y= " + punto1.getY() + "\n" +
            "Punto 2 -  Valor de x= " + punto2.getX() + "\n" +
            "           Valor de y= " + punto2.getY() + "\n");
    }

}
