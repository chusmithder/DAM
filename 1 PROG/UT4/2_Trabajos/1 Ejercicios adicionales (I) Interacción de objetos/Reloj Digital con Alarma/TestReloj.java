
/**
 *  
 * 
 * @author  
 * @version  
 */
public class TestReloj
{
    private RelojAlarma miReloj;
    private RelojAlarma tuReloj;

    /**
     * Constructor  
     */
    public TestReloj()    {
        miReloj = new RelojAlarma(18, 32);
        tuReloj = new RelojAlarma(23, 58);
    }

    /**
     * 
     */
    public void test1() {
        miReloj.setAlarma(18, 35);
        System.out.println("Hora actual: " + miReloj.getHora());
        System.out.println("Hora alarma: " + miReloj.getAlarma());
        miReloj.emitirTic();
        miReloj.emitirTic();
        miReloj.emitirTic();
    }

    /**
     * 
     */
    public void test2() {
        tuReloj.setAlarma(7, 0);
        System.out.println("Hora actual: " + tuReloj.getHora());
        System.out.println("Hora alarma: " + tuReloj.getAlarma());
        tuReloj.emitirTic();
        tuReloj.emitirTic();
        tuReloj.emitirTic();
        tuReloj.emitirTic();
        tuReloj.emitirTic();
        System.out.println("Hora actual: " + tuReloj.getHora());

    }

    /**
     * 
     */
    public void test3() {
        miReloj.setHoraActual(12, 0);
        miReloj.setAlarma(13, 0);
        System.out.println("Hora actual: " + tuReloj.getHora());
        System.out.println("Alarma actual: " + tuReloj.getAlarma());
    }

}
