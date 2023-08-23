
/**
 * REPRESNTA LA ALARMA
 * 
 * @author  
 * @version  
 */
public class Alarma
{
    private int hora;
    private int minutos;

    /**
     * Constructor  
     */
    public Alarma()    {
        this.hora = 7; //no es obligatorio poner if
        this.minutos = 0;
    }

    /**
     *  Mutador para cambiar la hora de alarma
     *        
     */
    public void setHoraAlarma(int hora, int minutos)    {
        this.hora = hora;
        this.minutos = minutos;
    }

    /**
     *  ACCESOR para la hora de alarma
     *     cadena formateada, formatend
     */
    public String getHoraAlarma() {
       return  String.format("%02d:%02d", this.hora, this.minutos);
    }

}
