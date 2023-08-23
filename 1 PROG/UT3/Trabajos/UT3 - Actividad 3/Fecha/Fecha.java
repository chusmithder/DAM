/**
 *  Proyecto fecha
 * 
 */
public class Fecha
{
    private int dia; // dia [1-31]
    private int mes;  // mes [1-12]
    private int año;  // año []

    /**
     * Constructor inicializa los objetos con los parametros actuales asignados
     */
    public Fecha(int queDia, int queMes, int queAño)    {
        dia = queDia;
        mes = queMes;
        año = queAño;
    }

    /**
     *  un método esBisiesto() que devuelve true si el año es bisiesto, false en otro caso.
     *  Un año es bisiesto si es múltiplo de 4 pero no de 100 aunque si de 400      
     */
    public boolean esBisiesto()    {
        boolean resul = false;
        if((año % 4 == 0 && año % 100 != 0) || año % 400 == 0){
            resul = true;
        }
        return resul;
    }

    /**
     *  devuelve la cantidad de días que tiene el mes (influirá si año es bisiesto
     *  en el caso de febrero)   
     */
    public int diasMes() {
        int numDias;
        switch (mes){
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:   
            case 12:  numDias = 31;
                break;
            case 4:
            case 6:
            case 9:
            case 11: numDias = 30;
                break;
            default: // mes = 2
                if (año % 4 == 0){
                    numDias = 29;
                }
                else{ 
                    numDias = 28;
                }
                break;
        }
        return numDias;
    }

    /**
     *  Añade un método esCorrecta() que devuelva
     *  true si la fecha que contiene el objeto es correcta   
     *   el día está comprendido entre 1 y 31
     *   el mes está entre 1 y 12
     *   si el mes no es febrero el día estará bien en relación al nº de mes, es decir, entre 1 y 31 o 
     *   entre 1 y 30
     *   si el mes es febrero el día estará entre 1 y 28 o entre 1 y 29 si el año es bisiesto
     */
    public boolean esCorrecta() {
        return ! (dia < 1 || dia > diasMes() || mes < 1 || mes > 12 );
        //if (dia < 1 || dia > diasMes() || mes < 1 || mes > 12 ) return false;
        //else return true;
        
        /*
        boolean resul = true;
        if (dia < 1 || dia > 31){
            resul = false;
        }
      
        if (mes < 1 || mes > 12){
            resul = false;
        }
                
        if (mes == 2){
            if(esBisiesto() && dia > 29) {
                resul = false;
            }

            if(!esBisiesto() && dia > 28) {
                resul = false;
            }
        }
        
        return resul; 
        */
    }
    
}