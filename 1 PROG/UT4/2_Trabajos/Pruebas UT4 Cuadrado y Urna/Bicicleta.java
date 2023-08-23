/**
 * Modela a una bicicleta
 */
public class Bicicleta
{     
    private Rueda delantera;
    private Rueda trasera;
    
    /**
     *  el constructor cree las ruedas con una presión inicial de 0.0 
     */
    public Bicicleta()
    {
        // Rueda delantera = new Rueda(0.0);/ valor de instancia de los att de rueda es 
        // Rueda trasera = new Rueda(0.0); // null y no cero (error comun)
        //estamos solo declarando variables locales
        //delantera = new Rueda(0.0);
        //trasera = new Rueda(0.0);
    }

    /**
     *   verifica cada una de las ruedas de la bici.
     *   Si están desinfladas las infla quedando las ruedas con una presión de 1.5.
     */
    public void verificar()
    {
        if(delantera.estaDesinflada()){
            delantera.inflar();
            delantera.inflar();
            delantera.inflar();
        }
        
        //si pongo else, si no esta desinflada la primera infla solo la segunda
        if(trasera.estaDesinflada()){
            trasera.inflar();
            trasera.inflar();
            trasera.inflar();
        }
    }
}
