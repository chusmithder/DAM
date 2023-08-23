
/**
 *  
 * 
 * @author  
 * @version  
 */
public class DemoReloj
{
     private VisorReloj reloj;

    /**
     * Constructor  
     */
    public DemoReloj()    {
      reloj = new   VisorReloj(); 
    }

    /**
     * Escribir en pantalla el valor de la hora 00:00:00 
     * Avanzar 3 segundos
     * Escribir en pantalla el valor de la hora 00:00:03 
     * poner el reloj a las 13:59:59
     * escribir en pantalla el valor de la hora
     * avanzar un segundo
     * Escribir en pantalla el valor de la hora
     */
    public void demo1()    {
        System.out.println(reloj.getHora());
        reloj.emitirTic();
        reloj.emitirTic();
        reloj.emitirTic();
        System.out.println(reloj.getHora());
        reloj.ponerEnHora(13, 59, 59);
        System.out.println(reloj.getHora());
        reloj.emitirTic();
        System.out.println(reloj.getHora());
    }
}
