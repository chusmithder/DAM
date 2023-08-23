import java.util.Random; // asi puedo ulizar Random
/**
 *  
 * 
 */
public class DemoReloj
{
    private VisorReloj reloj;
    private java.util.Random generador;//java.util es el paquete donde esta la clase random
    // paquetes son carpetas de Java
    // java debe saber en que paquete esta para poder localizarla
    //paquete java.lang
    /**
     * Constructor  
     */
    public DemoReloj()    {
        reloj = new   VisorReloj(); 
        generador = new Random();
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

    /**
     *  
     *
     * @param  
     * @return      
     */
    public void demo2() {
            //generar un valor aleatorio para estas VL
        //int hora = (int)Math.random()*24;
        //int minutos = (int)Math.random()*60;
        //int segundos = (int)Math.random()*60;
        
        int hora = generador.nextInt(24); //valor mas bajo es 0; y el mas alto es el colocado aqui
        int minutos = generador.nextInt(60);
        int segundos = generador.nextInt(41) + 10; // un aleatorio entre [10 - 50]
        
        reloj.ponerEnHora(hora ,minutos ,segundos);
        System.out.println(reloj.getHora());
    }

}
