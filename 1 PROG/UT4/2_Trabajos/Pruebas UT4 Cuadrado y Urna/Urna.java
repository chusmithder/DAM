/**
 * Representa a una urna que contiene dos bolas
 */
public class Urna
{
    private Bola bola1;
    private Bola bola2;

    /**
     * Constructor  
     */
    public Urna()
    {
        bola1 = new Bola();
        bola2 = new Bola();
    }

    /**
     * Constructor  permite crear las dos negras o las 
     * dos blancas
     */
    public Urna (int color)
    {
        bola1 = new Bola(color);
        bola2 = new Bola(color);
    }

    /**
     * 
     */
    public Urna (int c, int d) {
        bola1 = new Bola (c);
        bola2 = new Bola(d);

    }

    /**
     * Constructor  permite crear las dos negras o las 
     * dos blancas
     */
    public Urna(Bola queBola1, Bola queBola2)
    {
        bola1 = queBola1;
        bola2 = queBola2;
    }

    /**
     *  
     *    
     */
    public int cuantasNegras() {
        int negras = 0;
        if(bola1.esNegra()){
            negras++;
        }
        if(bola2.esNegra()){
            negras++;
        }
        return negras;
    }

    /**
     *  clase bola tiene un metodo ostring
     * bola de color negro 
     * bola de color blanco
     */
    public String toString() {
        return bola1.toString() + "\n" + bola2.toString();
    }

    /**
     *  
     *     
     */
    public void print() {
        // System.out.println(this); //pasamos una referencias, por lo tanto tiene una direccion
        System.out.println(this.toString());
    }

}
