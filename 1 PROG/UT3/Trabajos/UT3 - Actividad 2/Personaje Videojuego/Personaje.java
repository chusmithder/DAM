
/**
 *  Esta clase representa personajes de un videojuego (objetos)
 * 
 */
public class Personaje
{
    //constantes:
    private final char NORTE = 'N';
    private final char SUR = 'S';
    private final char ESTE = 'E';
    private final char OESTE = 'O';
    // Variables de instancia (atributos):
    private String nombre;
    private int x;
    private int y;
    private char orientacion;

    /**
     * Constructor  
     */
    public Personaje(String queNombre)    {
        nombre = queNombre;
        x = 0;
        y = 0;
        orientacion = 'N';
    }

    /**
     * MUTADOR
     * Este método modifica las coordenadas del personaje
     */
    public void avanzar(int distancia) {
        if (orientacion == NORTE){
            y = y + distancia;
        }
        else if (orientacion == SUR){
            y -= distancia;
        }
        else if (orientacion == ESTE){
            x += distancia;
        }
        else{ //orientacion == OESTE
            x -= distancia;
        }
    }

    /**
     * MUTADOR
     * Cambia la orientacion del personaje que siempre gira
     * en sentido horario
     */
    public void girar() {
        switch(orientacion){
            case NORTE: orientacion = ESTE;
                break;
            case SUR: orientacion = OESTE;
                break;
            case ESTE: orientacion = SUR;
                break;
                // orientacion = OESTE
            default: orientacion = NORTE; 
                break;
        }
    }

    /**
     * ACCESOR
     * Método que representa visualmente la situación del personaje
     */
    public String toString() {
        String auxStr;
        auxStr = "Personaje = " + nombre + "\n" +
        "Orientación: " + orientacion + "\n" + 
        "Posicion: [" + x + "," + y + "]";
        return auxStr;
    }

}
