/**
 *  Clase hora , los objetos de esta clase almacenaran la hora en tres
 *  campos(atributos).  Suponemos todos los valores correctos.
 *  Formato : 24h
 * 
 */
public class Hora
{
    // almacena la hora, 0 <= hora <= 23  
    private int horas;
    //almacena los minutos, 0 <= minutos <= 59
    private int minutos;
    //almacena los segundos, 0 <= segundos <= 59
    private int segundos;
    /**
     * Constructor  
     */
    public Hora(int queHora, int queMinutos, int queSegundos)    {
        horas = queHora;
        minutos = queMinutos;
        segundos = queSegundos;
    }

    /**
     * ACCESOR
     * Devuelve la hora
     */
    public int getHoras()    {
        return horas;
    }

    /**
     * ACCESOR
     * Devuelve los minutos
     */
    public int getMinutos()    {
        return minutos;
    }

    /**
     * ACCESOR
     * Devuelve los segundos
     */
    public int getSegundos()  {
        return horas;
    }

    /**
     * MUTADOR
     * Cambiar la hora
     */
    public void setHora(int nuevaHora) {
        horas = nuevaHora; // 0 <= nuevaHora <= 23
    }

    /**
     * MUTADOR
     * Cambiar los minutos
     */
    public void setMinutos(int nuevosMinutos) {
        minutos = nuevosMinutos; // 0 <= nuevosMinutos <= 59
    }

    /**
     * MUTADOR
     * Cambiar los segundos
     */
    public void setSegundos(int nuevosSegundos) {
        segundos = nuevosSegundos; // 0 <= nuevosSegundos <= 59
    }

    /**
     *  Devuelve la HORA que guarda el objeto en minutos   
     */
    public int aSegundos() {
        return horas * 3600 + minutos * 60 + segundos;
    }

    /**
     * MUTADOR
     * Incrementa un segundo a la hora
     */
    public void avanzarSegundo() {
        if (segundos != 59 ){ //horas y minutos toman cualquier valor
            //Varian los segundos,pero no los minutos ni horas
            segundos = segundos + 1;                           
        }

        if (segundos == 59 && minutos != 59 ){ //horas toman cualquier valor
            //Segundos igual a 0,los minutos suman 1 y las horas no se modifican
            minutos = minutos + 1;
            segundos = 0;
        }

        if (segundos == 59 && minutos == 59 && horas != 23){
            //segundos igual a o, minutos igual a 0 y hora suma uno
            horas = horas + 1;
            minutos = 0;
            segundos = 0;
        }

        if(segundos == 59 && minutos == 59 && horas == 23){
            //segundos, minutos y horas igual a 0
            horas = 0;
            minutos = 0;
            segundos = 0;
        }
    }
    
    /**
     * MUTADOR 2
     * Incrementa un segundo a la hora
     */
    public void avanzarSegundoV2() {
        if(segundos == 59 && minutos == 59 && horas == 23){
            //segundos, minutos y horas igual a 0
            horas = 0;
            minutos = 0;
            segundos = 0;
        }
        
        if (segundos == 59 && minutos == 59 && horas != 23){
            //segundos igual a o, minutos igual a 0 y hora suma uno
            horas = horas + 1;
            minutos = 0;
            segundos = 0;
        }
        
        if (segundos == 59 && minutos != 59 ){ //horas toman cualquier valor
            //Segundos igual a 0,los minutos suman 1 y las horas no se modifican
            minutos = minutos + 1;
            segundos = 0;
        }
        
        if (segundos != 59 ){ //horas y minutos toman cualquier valor
                //Varian los segundos,pero no los minutos ni horas
            segundos = segundos + 1;                           
        }

    }

    /**
     * MUTADOR
     * Decrementa un segundo a la hora
     */
    public void atrasarSegundo() {
        if (segundos != 0){ //minutos y horas toman cualquier valor
             //Varian los segundos,pero no los minutos ni horas
            segundos--;                           
        }

        else if (segundos == 0 && minutos != 0){ // horas toman cualquier valor
             //Segundos igual a 59,los minutos disminuyen 1 y las horas no se modifican
            minutos--;
            segundos = 59;
        }

        else if(segundos == 0 && minutos == 0 && horas != 0){
            //segundos igual a 59, minutos igual a 59 y hora resta 1
            horas--;
            minutos = 59;
            segundos = 59;
        }

        else{ //(segundos == 0 && minutos == 0 && horas == 0){
            horas = 23;
            minutos = 59;
            segundos = 59;
        }
    }

    /** 
     *  Devuelve la cadena de hora "hh:mm:ss"   
     *   ejemplo: 19:07:30 o 04:05:03
     */
    public String toStringVX() {
        String resul = "";//primero con horas
        if(horas < 10){
            resul += "0";
        }
        resul += horas + ":";
        
        if (minutos < 10){
            resul += "0"; //en cualquier otro caso no se añadira el cero
        }
        resul += minutos + ":";
        
        if(segundos < 10){
            resul += "0";
        }
        resul += segundos;
        
        return  resul;
    }
   
}
