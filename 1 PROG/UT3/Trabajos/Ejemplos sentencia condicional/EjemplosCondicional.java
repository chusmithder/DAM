
/**
 *  Esta clase muestra algunos métodos con ejemplos de la sentencia condicional if y switch
 *  
 */
public class EjemplosCondicional
{
    // no incluimos atributos, es solo una clase de demostración

    /**
     * Constructor  
     */
    public EjemplosCondicional()
    {

    }

    /**
     *  
     * if con else completo (if anidado)
     *  
     * 
     */
    public void printDescripcion(int edad, String nombre)
    {

        if   (edad  <  13)     {
            System.out.println(nombre  +  " es un niño");   
        }
        else    {
            if  (edad  <  18)  {
                System.out.println(nombre  + " es un adolescente ");  
            }
            else  {
                System.out.println(nombre  +  "es un adulto");
            } 
        }

    }

    /**
     * 
     */
    public void printDescripcionV1(int edad, String nombre) {
        if(edad < 13){
            System.out.println(nombre + "es un niño");
        }
        else{//edad >= 13
            if(edad < 18){//edad >= 13 && edad < 18
                System.out.println(nombre + " es un adolescente");
            }
            else{//edad >= 18
                System.out.println(nombre + " es un adulto");
            }
        }
    }

    /**
     * 
     */
    public void printDescripcionV2(int edad, String nombre) {
        System.out.println(nombre + " es un adulto");
        if (edad < 13){
            System.out.println(nombre + "es un niño");
        }
        if (edad >= 13 && edad < 18){
            System.out.println(nombre + "es un adolescente");
        }

    }

    /**
     * if anidado, if ... else if
     */
    public void printDescripcionOtraVersion(int edad, String nombre)
    {

        if   (edad  <  13)     {
            System.out.println(nombre  +  " es un niño");   
        }
        else if  (edad  <  18)     {
            System.out.println(nombre  + " es un adolescente "); 
        }
        else   {
            System.out.println(nombre  +  " es un adulto");
        }
    }

    /**
     * 
     */
    public boolean  esPositivoPar(int numero)
    {    

        if   ( (numero  > 0)  && (numero % 2 ==  0))    {
            return true;
        }
        return false;   
    }

    /**
     * 
     */
    public boolean  esPositivoParV2(int numero)
    {    
        boolean resul = false;
        if((numero > 0) && (numero % 2 == 0)){
            resul = true;
        }
        return resul;
    }

    /**
     *      
     */
    public boolean esPositivoParV1(int numero) {
        boolean aux;
        if ((numero > 0) && (numero % 2 == 0)){
            aux = true;
        }
        aux = false;
        return aux;

    }

    /**
     * 
     */
    public boolean  metodoMisterioV1(int valor)
    {        
        if   (valor  >= 0)   {
            return true;
        }
        return false;   
    }

    /**
     * Uso de una variable local para devolver el valor después con return
     */
    public boolean  metodoMisterioV2(int valor)
    {
        boolean resul = false;
        if   (valor  >= 0)     {
            resul = true;
        }
        return resul;   
    }

    /**
     * El método anterior con expresión booleana
     */
    public boolean  metodoMisterioV3(int valor)
    {

        return (valor >= 0);
    }

    /**
     * Demo de la sentencia switch
     */
    public  String demoSwitch(int dia)
    {
        String nombreDia;
        switch    (dia)    {
            case 1:    nombreDia = "Lunes";
                break;
            case 2:    nombreDia = "Martes";
                break;
            case 3:    nombreDia = "Miércoles";
                break;
            case 4:    nombreDia = "Jueves";
                break;
            case 5:    nombreDia = "Viernes";
                break;
            case 6:    nombreDia = "Sábado";
                break;
            case 7:    nombreDia = "Domingo";
                break;
            default:  nombreDia = "Incorrecto";
                break;
        }
        return nombreDia;
    }

    /**
     * Metodo que devuelve el nombre del dia, indicando el numero 
     * correspondiente
     */
    public String demoSwitch2(int dia) {
        String nombreDia; //Declaramos una variable local
        switch (dia) {
            case 1:  nombreDia = "Lunes";
                break;
            case 2: nombreDia = "Martes";
                break;
            case 3: nombreDia = "Miercoles";
                break;
            case 4:  nombreDia = "Jueves";
                break;
            case 5: nombreDia = "Viernes";
                break;
            case 6: nombreDia = "Sabado";
                break;
            case 7: nombreDia = "Domingo";
                break;
            default: nombreDia = "Incorrecto";
                break;
        }
        return nombreDia;
    }

    /**
     *  Otra version Demo   
     *  Devuelver el nombre del dia, indicando un número
     */
    public String demoSwitchV1(int dia) {
        String nombreDia; //variable local
        switch(dia){
            case 1: nombreDia = "Lunes";
                break;
            case 2: nombreDia = "Martes";
                break;
            case 3: nombreDia = "Miercoles";
                break;
            case 4: nombreDia = "Jueves";
                break;
            case 5: nombreDia = "Viernes";
                break;
            case 6: nombreDia = "Sabado";
                break;
            case 7: nombreDia = "Domingo";
                break;  
            default: nombreDia = "Incorrecto";
                break;
        }
        return nombreDia;
    }

    /**
     *  Mostrar uno de estos tres mensajes:
     *  " xxxx personas sin caramelos"
     *  " cada persona con un caramelo"
     *  " xxxx personas con xx caramelos y sobran xx caramelos"
     */
    public void repartirCaramelos(int personas, int caramelos)
    {
        if (personas > caramelos){
            System.out.println(personas - caramelos + " personas sin caramelos");
        }
        else if (personas == caramelos){
            System.out.println("cada persona con un caramelo");
        }

        else{ 
            int caramelosPorPersona = caramelos / personas;
            int sobranCaramelos = caramelos % personas;
            System.out.println("caramelos por persona " + caramelosPorPersona + "y sobran " + sobranCaramelos + "caramelo");
        }
    }

    /**
     *  Mostrar uno de estos tres mensajes:
     *  " xxxx personas sin caramelos"
     *  " cada persona con un caramelo"
     *  " xxxx personas con xx caramelos y sobran xx caramelos"
     */
    public void repartirCaramelosVC(int personas, int caramelos) {
        if(personas > caramelos){
            int personasSinCaramelos;
            personasSinCaramelos = personas - caramelos;
            System.out.println(personasSinCaramelos + " personas sin caramelos");
        }
        else if(personas == caramelos){
            System.out.println("cada persona con un caramelo");
        }
        else{ //personas < caramelos
            int aux1 = caramelos / personas;
            int aux2 = caramelos / personas;
            System.out.println(personas + " personas con " + aux1 + " caramelos y sobran " + aux2 +" caramelos");
        }
    }

    /**
     *  Calcula y devuelve el valor absoluto de numero
     *
     */
    public int obtenerValorAbsoluto(int numero)
    {

        return 0;
    }

    /**
     *  Muestra como letra el valor de numero
     * Para practicar if ... elseif ....
     */
    public void mostrarNumeroEnLetra(int numero)
    {
        int aleatorio = (int)(Math.random() * 5) +1;
        if (aleatorio == 1){
            System.out.println("UNO");
        }

        else if (aleatorio == 2){
            System.out.println("DOS");
        }

        else  if (aleatorio == 3){
            System.out.println("TRES");
        }

        else  if (aleatorio == 4){
            System.out.println("CUATRO");
        }
        else   {
            System.out.println("CINCO");
        }

    }

    /**
     *  Devuelve true si la última cifra de numero es 7
     */
    public boolean esSieteUltimaCifraV0(int numero) {
        boolean resul;
        int ultimaCifra = numero % 10;
        if (ultimaCifra == 7){
            resul = true;
        }
        resul = false;
        return resul;
    }

    /**
     *  Devuelve true si la última cifra de numero es 7
     *
     */
    public boolean esSieteUltimaCifra(int numero)
    {
        boolean resul;
        int cifra = numero % 10;
        if (cifra == 7){
            return true;
        }
        return false;
    }

    /**
     *  Escribir "El alumno hará la FCT" si es del curso segundo 'S' / 's' y ha 
     *  aprobado todo
     *  En cualquier caso mostrar el mensaje "Final de este método"
     */
    public void hacerFct(char curso, boolean haAprobado)
    {
        if (curso == 'S' || curso == 's' && haAprobado){
            System.out.println("El alumno hará la FCT");
        }
        System.out.println("Final de este método)");

    }

    /**
     *  Escribir "El alumno hará la FCT" si es del curso segundo 'S' / 's' y ha 
     *  aprobado todo
     *  En cualquier caso mostrar el mensaje "Final de este método"
     */
    public void hacerFctVX(char curso, boolean haAprobado)
    {
        if ((curso == 'S' || curso =='s') && haAprobado == true){
            System.out.println("El alumno hará la FCT");
        }
        System.out.println("Final de este método");
    }

    /**
     *  Si numero es positivo se decrementa su valor, se multiplica por 2  y se escribe
     *  Si es negativo se incrementa, se divide entre 2 y se escribe también
     *
     */
    public void mostrarNumero(int numero){
        if(numero > 0){
            numero--;
            numero = numero * 2; // seria igual a numero = (numero - 1) * 2
            System.out.println("Número Nuevo: " + numero);
        }
        else if (numero < 0){
            numero++;
            numero /= 2;
            System.out.println("Número Nuevo: " + numero);
        }

    }

    /**
     * Demo de la sentencia switch
     * Escribe día laborable/ No laborable
     */
    public  void demoSwitch2(String dia)
    {
        switch(dia){
            case "Lunes":
            case "Martes":
            case "Miércoles":
            case "Jueves":
            case "Viernes": System.out.print("Día laborable");
                break;
            case "Sábado":
            case "Domingo": System.out.println("Dia no laborable");
                break;
                //si se puesiera como parametro actual "asdlkjd" no pasaria nada.
        }
    }

    /**
     * Demo de la sentencia switch
     * devuelve true si es vocal / false en otro caso
     */
    public  boolean esVocalV1(char letra)
    { 
        boolean resul;
        switch (letra) {
            case 'A':
            case 'a':
            case 'E':
            case 'e':
            case 'I':
            case 'i':
            case 'O':
            case 'o':
            case 'U':
            case 'u': resul = true;
                break;
            default: resul = false;
                break;
        }
        return resul;
    }

    /**
     * Demo de la sentencia switch
     * devuelve true si es vocal / false en otro caso
     */
    public  boolean esVocalV2(char letra)
    { 
        switch (letra) {
            case 'A':
            case 'a':
            case 'E':
            case 'e':
            case 'I':
            case 'i':
            case 'O':
            case 'o':
            case 'U':
            case 'u': 
                return true;

            default: 
                return false;
        }
    }

    /**
     *  Calcula y devuelve los dias del mes indicado
     *  Para el mes febrero habrá que tener en cuenta si año es o no bisiesto
     *  (múltiplo de 4)
     *  Si el mes es incorrecto devolver -1
     * 
     *
     */
    public int calcularDiasMes(int mes, int año)
    {
        int diasMes = 31; //variable local
        if (mes<1 || mes > 12) { //No se hacen restricciones para el año, ya que para cualquier año se cumple
            diasMes = -1;
        }

        else if (mes == 4 || mes == 6 || mes == 9 || mes == 11 ){
            diasMes = 30; 
        }
        else if (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12){
            diasMes = 31;
        } //Desde este else if solo habria una posibilidad para el mes : 2
        else if (año % 4 == 0){ // Es bisiestro
            diasMes = 29; 
        }
        else if (mes == 2){ 
            diasMes = 28;
        }
        return diasMes;

    }

    /**
     *  Calcula y devuelve los dias del mes indicado
     *  Para el mes febrero habrá que tener en cuenta si año es o no bisiesto
     *  (múltiplo de 4)
     *  Si el mes es incorrecto devolver -1
     */
    public int calcularDiasMesV0(int mes, int año) {
        int diasMes;
        if (mes < 1 || mes > 12){
            diasMes = -1;
        }
        else if ( mes == 1 ||  mes == 3 ||  mes == 5 ||  mes == 7 ||  mes == 8 ||  mes == 10 ||  mes == 12){
            diasMes = 31;
        }
        else if ( mes == 2 ||  mes == 4 ||  mes == 6 ||  mes == 9 ||  mes == 11){
            diasMes = 30;
        }
        // A partir de aqui el unico valor que puede tomar mes es 2 
        else if (año % 4 == 0){
            diasMes = 29;
        }
        else {
            diasMes = 28;
        } 
        /* Si borramos el ultimo else, no habria un valor para diasMes 
         * para cuando sea febrero de un año no bisiesto, y provocaria que
         * la variable local tenga un valor por defecto, lo cual no es posible.
         * A menos que inicies asignando a diasMes 28, y no seria necesario
         * poner el else
         */
        return diasMes;
    }

    /**
     *  Calcula y devuelve los dias del mes indicado
     *  Para el mes febrero habrá que tener en cuenta si año es o no bisiesto
     *  (múltiplo de 4)
     *  Si el mes es incorrecto devolver -1
     */
    public int calcularDiasMesSwitch(int mes, int año){
        int diasMes;
        if (mes < 1 || mes > 12){
            diasMes = -1;
        }
        else{//mes entre 1 y 12
            switch(mes){
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12: diasMes = 31;
                    break;

                case 4:
                case 6:
                case 9:
                case 11: diasMes = 30;
                    break;
                    //mes 2 queda 
                default:  
                    if (año % 4 == 0){
                        diasMes = 29;
                    }
                    else{
                        diasMes = 28;
                    }
                    break;
            }
        }
        return diasMes;
    }

    /**
     *  si no es una letra mensaje error
     *  si letra vocal mayúscula escribir vocal mayúscula
     *  si letra vocal minúscula escribir minúscula
     *  escribir consonante en otro caso 
     *   En el cuestionario 1 UT3
     */
    public void detectarTipoLetra(char letra){

    }

    /**
     *  si no es una letra mensaje error
     *  si letra vocal mayúscula escribir vocal mayúscula
     *  si letra vocal minúscula escribir minúscula
     *  escribir consonante en otro caso 
     *   En el cuestionario 1 UT3
     */
    public void detectarTipoLetraV0(char letra)
    { //Utilizando la tabla de caracteres UNICODE
        if (letra < 'A' || letra > 'z' || (letra > 'Z' && letra < 'a')){
            System.out.println(" No es una letra");
        }
        else if (letra == 'A' || letra == 'E' ||  letra == 'I' ||  letra == 'O' || letra == 'U' ){
            System.out.println(" Es una vocal mayúscula");
        }
        else  if (letra == 'a' || letra == 'e' ||  letra == 'i' ||  letra == 'O' || letra == 'U' ){
            System.out.println(" Es una vocal minuscula");
        }
        else {
            System.out.println("Es consonante");
        }
    }

    /**
     * 
     *  Generar un aleatorio  entre 1 y 10 y escribir si es par
     *
     */

    public void mostrarAleatorioPar() {
        int aleatorio = (int)(Math.random() * 10) + 1;
        if(aleatorio % 2 == 0){
            System.out.println(aleatorio + " es par");
        }

    }

    /**
     * Generar una aleatorio entre 50 y 100 escribir si acaba en 3
     */
    public void mostrarAletorioAcaba3() {
        int aleatorio = (int)(Math.random() * 51) + 50;
        if(aleatorio % 10 == 3){
            System.out.println(aleatorio +" acaba en 3");
        }
        //Para cualquier otro caso aparte del if
        System.out.println(aleatorio + " no acaba en 3");
    }

    /**
     *  devuelve un String 
     *  1- NP / 2,3,4 – INS / 5 –
     *  SUF / 6 – B / 7,8 – NOT / 9,10 SB
     *  
     *  """"Asumimos nota correcta""""" quiere decir que los
     *  parametros actuales solo pueden estar entre el 1 y 10
     */
    public String devolverNombreNota(int nota){
        String resul = "SB";
        if (nota == 1){ //Aqui se debe poner si o si el else if
            resul = "NP";
        }
        else if (nota < 5){
            resul = "INS";
        }
        else if (nota == 5){
            resul = "SUF";
        }
        else if (nota == 6){
            resul = "B";
        }
        else if (nota < 9){
            resul = "NOT";
        }
        return resul;
    }

    /**
     *  devuelve un String 
     *  1- NP / 2,3,4 – INS / 5 –
     *  SUF / 6 – B / 7,8 – NOT / 9,10 SB
     *  
     *  Asumimos nota correcta
     */
    public String metodoStringConSwitch(int nota) {
        String resul;
        switch(nota){
            case 1: resul = "NP";
                    break;
            case 2: 
            case 3:    
            case 4: resul = "INS";
                    break;
            case 5: resul = "SUF";
                    break;
            case 6: resul = "B";
                    break;
            case 7:
            case 8: resul = "NOT";
                    break;
            default: resul = "SB";
                    break;
        }
        return resul;
    }

}
