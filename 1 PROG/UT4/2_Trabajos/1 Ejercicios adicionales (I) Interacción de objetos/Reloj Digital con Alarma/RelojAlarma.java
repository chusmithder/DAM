
/**
 *  Modela un reloj como el que hemos estudiado pero que incorpora una alarma
 *  cada vez que el reloj avanza si la nueva hora es la misma que la establecida 
 *  en la alarma, se hará sonar un RINGGGGGGG 
 */
public class RelojAlarma
{
    private VisorReloj reloj;
    private Alarma alarma;

    /**
     * Constructor  1
     */
    public RelojAlarma()    {
        reloj = new VisorReloj();
        alarma = new Alarma();
    }

    /**
     * Constructor 2
     */
    public RelojAlarma(int horas, int minutos) {
        reloj = new VisorReloj(horas, minutos);
        alarma = new Alarma();
    }

    /**
     * Avanza el reloj
     */
    public void emitirTic() {
        reloj.emitirTic();
        if(esHoraAlarma()){
            System.out.println("RRRRRIIIINNNNGGGGGGGGGG");
        }
    }

    /**
     * Devuelve la hora actual
     */
    public String getHora() {
        return reloj.getHora();
    }

    /**
     * Cambia la hora de la alarma
     */
    public void setAlarma(int hora, int minutos) {
        alarma.setHoraAlarma(hora, minutos);
    }

    /**
     * Modifica la hora actual del reloj
     */
    public void setHoraActual(int hora, int minutos) {
        reloj.ponerEnHora(hora, minutos);
    }

    /**
     * Indica si ya es la hora de la alarma
     */
    private boolean esHoraAlarma() {
        return reloj.getHora().equals(alarma.getHoraAlarma());
    }

    /**
     * Devuelve la hora de alarma
     */
    public String getAlarma() {
        return alarma.getHoraAlarma();
    }

}
