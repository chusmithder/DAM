
/**
 * Representa a un cuadrado con un centro y un lado
 * Escribe tres constructores sobrecargados en la clase Cuadrado
 * a- sin paramentros. crea un cuadrado de centro (0,0) y lado =0
 * b- con tres parametros, queX quey queLado
 * c- con dos parametros, un punto ya creado, quePunto(es el centro)  y
 */
public class Cuadrado
{
    private Punto centro;
    private double lado;

    /**
     * Constructor  
     */
    public Cuadrado()
    {
        centro = new Punto(0, 0); 
        lado = 0;

    }

    /**
     * Constructor  
     */
    public Cuadrado(int queX, int queY, double queLado)
    {
        centro = new Punto(queX, queY);
        lado = queLado;

    }

    /**
     * Constructor  
     */
    public Cuadrado(Punto queCentro, double queLado)
    {   // pasar un objeto ya creado
        centro = queCentro; 
        // centro = new Punto(queCentro.getX(), queCentro.getY());
        // la dif es que en la ssegunda version hago centro = new Punto()
        //
        lado = queLado;

    }
    /**
     *  
     *
     * @param  
     * @return      
     */
    public double calcularArea() {
        return lado * lado;
        
    }

}
