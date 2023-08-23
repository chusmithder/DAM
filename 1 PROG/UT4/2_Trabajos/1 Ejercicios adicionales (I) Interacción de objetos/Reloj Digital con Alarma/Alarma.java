
/**
 * Representa  a un  objeto que guarda la 
 * hora de alarma
 */
public class Alarma
{
    private int hora;
    private int minuto;

    /**
     * Constructor  
     */
    public Alarma()    {
        hora = 7;
        minuto = 0;
    }

    /**
     * Modifica la hora de la alarma
     * y obtiene la hora de la alarma mediante un String XX:XX
     */
    public void setHoraAlarma(int hora, int minuto) {
        this.hora = hora;
        this.minuto = minuto;
    }

    /**
     * Devuelve la hora de la alarma de la forma XX:XX
     */
    public String getHoraAlarma() {
        String resul = "";
        if(hora < 10){
            resul += "0";
        }
        resul += hora + ":";
        if(minuto < 10){
            resul += "0";
        }
        resul += minuto;
        return resul;
    }

}
