/**
 * La clase modela un sencillo podómetro que registra información
 * acerca de los pasos, distancia, ..... que una persona
 * ha dado en una semana. 
 * 
 * @author    - Christhoper Pinday Delgado - 
 */
public class Podometro
{
     //constantes que indican el sexo de una persona
    private final char HOMBRE = 'H';
    private final char MUJER = 'M';
    //Constantes, representan un porcentaje (45% y 41%) sobre la altura de 
    //de la persona que se usaran para calcular la long. de su zancada
    private final double ZANCADA_HOMBRE = 0.45;
    private final double ZANCADA_MUJER = 0.41;
    //Dos constantes que indican el nº de dia de la semana
    private final int SABADO = 6;
    private final int DOMINGO = 7; 
    
    //ATRIBUTOS
    private String marca; //Marca del podómetro
    //A. de Configuración
    private double altura; //altura de la persona (cm)
    private char sexo; //sexo de la persona 'M' o 'H'
    private double longitudZancada; //Almacena la long. de la zancada de la persona en cm
    // A. de Estadísticas
    private int totalPasosLaborables; //nº de pasos dados de lun a vie
    private int totalPasosSabado; //guarda el nº de pasos dados el sabado
    private int totalPasosDomingo; //nº pasos del domingo
    private double totalDistanciaSemana; //distancia recorrida en toda la semana (km)
    private double totalDistanciaFinSemana; //distancia recorrida el fin de semana (km)
    private int tiempo; //tiempo total caminado en la semana (en min)
    private int caminatasNoche; //Nro. de caminatas (paseos) dados a partir de las 21h en toda la semana
    
    /**
     * 
     * Inicializa el podómetro con la marca indicada por el parámetro.
     * El resto de atributos se ponen a 0 y el sexo, por defecto, es mujer
     */
    public Podometro(String queMarca)    {
      marca = queMarca;
      sexo = MUJER; //El resto de atributos empezaran con un valor 0 por defecto
    }

    /**
     * ACCESOR para la marca
     */
    public String getMarca() {
        return marca;    
    }
    
    /**
     * Simula la configuración del podómetro.
     * Recibe como parámetros la altura y el sexo de una persona
     * y asigna estos valores a los atributos correspondiente.
     * Asigna además el valor adecuado al atributo longitudZancada
     * 
     * (leer enunciado)
     *  
     */
    public void configurar(double queAltura, char queSexo) {
        altura = queAltura; // en cm
        sexo = queSexo;
        if (sexo == HOMBRE){
            double auxZH = ZANCADA_HOMBRE * altura;
            longitudZancada = Math.ceil(auxZH); //en cm
        }
        else { //sexo == Mujer
            double auxZM = ZANCADA_MUJER * altura;
            longitudZancada = Math.floor(auxZM); //en cm
        }
    }
    
    /**
     *  Recibe cuatro parámetros que supondremos correctos:
     *    pasos - el nº de pasos caminados
     *    dia - nº de día de la semana en que se ha hecho la caminata 
     *    (1 - Lunes, 2 - Martes - .... - 6 - Sábado, 7 - Domingo)
     *    horaInicio – hora de inicio de la caminata
     *    horaFin – hora de fin de la caminata
     *    
     *    A partir de estos parámetros el método debe realizar ciertos cálculos
     *    y  actualizará el estado del podómetro adecuadamente  
     */
    public void registrarCaminata(int pasos, int dia, int horaInicio,
                            int horaFin) {
        double distanciaHoy = pasos * (longitudZancada/100000); //km
        int aux = horaFin - horaInicio;
        int auxHoras = aux / 100;
        int aux2 = aux % 100;
        int auxMinutos;
         if(aux2 >= 60){
            auxMinutos = aux2 - 40;
        }
        else{ // aux2 < 60
            auxMinutos = aux2;
        }
        
        tiempo = (auxHoras * 60) + auxMinutos;
        
        switch(dia){
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:     totalPasosLaborables += pasos;
                    break;
            case SABADO:     totalPasosSabado += pasos;
                        totalDistanciaFinSemana += distanciaHoy;
                    break;
            case DOMINGO:     totalPasosDomingo += pasos;
                        totalDistanciaFinSemana += distanciaHoy;
                    break;
            //No hace falta el default ya que se asume que los parametros
            //actuales son correctos
        }
        totalDistanciaSemana += distanciaHoy;
 
        if(horaInicio >= 2100){
            caminatasNoche++;
        }
    }
    
    /**
     * Muestra en pantalla la configuración del podómetro
     * (altura, sexo y longitud de la zancada) 
     */
    public void printConfiguracion() {
        double alturaMetros = altura / 100; //variable local
        String nombreSexo;
        double zancadaMetros = longitudZancada / 100; 
        if (sexo == HOMBRE){
            nombreSexo = "HOMBRE";
        }
        else { //(sexo == MUJER)
            nombreSexo = "MUJER";
        }
        System.out.println("Configuración del podómetro");
        System.out.println("***************************");
        System.out.println("Altura: " + alturaMetros + " mtos");
        System.out.println("Sexo: " + nombreSexo);
        System.out.println("Longitud zancada: " + zancadaMetros + " mtos");
        System.out.println();
    }
    
    /**
     * Muestra en pantalla información acerca de la distancia recorrida,
     * pasos, tiempo total caminado, ....
     * 
     * (leer enunciado)
     *  
     */
    public void printEstadísticas() {
        int auxHora = tiempo / 60; 
        int auxMinutos = tiempo % 60; 
        String auxDiaMayorPasos = "";
        if (totalPasosLaborables > totalPasosSabado && totalPasosLaborables > totalPasosDomingo){
            auxDiaMayorPasos = "LABORABLES";
        }
        else if (totalPasosSabado > totalPasosLaborables && totalPasosSabado > totalPasosDomingo){
            auxDiaMayorPasos = "SÁBADO";
        }
        else if (totalPasosDomingo > totalPasosLaborables && totalPasosDomingo > totalPasosSabado){
            auxDiaMayorPasos = "DOMINGO";
        }
        System.out.println("Estadísticas");
        System.out.println("**********************");
        System.out.println("Distancia recorrida toda la semana: " + totalDistanciaSemana + " Km" );
        System.out.println("Distancia recorrida fin de semana: " + totalDistanciaFinSemana + " Km");
        System.out.println();
        System.out.println("Nº pasos días laborables: " + totalPasosLaborables);
        System.out.println("Nº pasos SÁBADO: " + totalPasosSabado);
        System.out.println("Nº pasos DOMINGO: " + totalPasosDomingo);
        System.out.println();
        System.out.println("Nº caminatas realizadas a partir de las 21h.: " + caminatasNoche);
        System.out.println();
        System.out.println("Tiempo total caminado en la semana: " + auxHora + "h. y " + auxMinutos + "m.");
        System.out.println("Día/s con más pasos caminados: " + auxDiaMayorPasos);
        System.out.println();
    }
    
    /**
     *  Calcula y devuelve un String que representa el nombre del día
     *  en el que se ha caminado más pasos - "SÁBADO"   "DOMINGO" o  "LABORABLES"
     */
    public String diaMayorNumeroPasos() {
        String resul ="";
        int aux1 = totalPasosLaborables;
        int aux2 = totalPasosSabado;
        int aux3 = totalPasosDomingo;
        if (aux1 > aux2 && aux1 > aux3){
            resul = "LABORABLES";
        }
        else if (aux2 > aux1 && aux2 > aux3){
            resul = "SÁBADO";
        }
        else if (aux3 > aux1 && aux3 > aux2){
            resul = "DOMINGO";
        }
        else if (aux1 == aux2 && aux1 > aux3){
            resul = "LABORABLES Y SABADO";
        }
        else if (aux1 == aux3 && aux1 > aux2){
            resul = "LABORABLES Y DOMINGO";
        }
        else if (aux2 == aux3 && aux2 > aux1){
            resul = "SABADO Y DOMINGO";
        }
        else if (aux1 == aux2 && aux1 ==aux3){
            resul = "LABORABLES, SÁBADO Y DOMINGO";
        }
        return resul;
    }
    
    
    /**
     * Restablecer los valores iniciales del podómetro
     * Todos los atributos se ponen a cero salvo el sexo
     * que se establece a MUJER. La marca no varía
     *  
     */    
    public void reset() {
        sexo = MUJER;
        altura = 0;
        longitudZancada = 0;
        totalPasosLaborables = 0;
        totalPasosSabado = 0;
        totalPasosDomingo = 0;
        totalDistanciaSemana = 0;
        totalDistanciaFinSemana = 0;
        tiempo = 0;
        caminatasNoche = 0;
    }
}
