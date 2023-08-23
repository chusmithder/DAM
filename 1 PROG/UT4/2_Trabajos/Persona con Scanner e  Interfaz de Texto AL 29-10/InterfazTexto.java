import java.util.Scanner;
/**
 * Clase que modela un interfaz de texto
 * para interactuar con el usuario
 * 
 */
 
public class InterfazTexto
{
    private final int COMPLETO = 1;
    private final int NOMBRE = 2;
    private final int EDAD = 3;
    private final int SUELDO = 4;
    private final int ESTADO = 5;
    private Persona persona;
    private Scanner teclado;

    /**
     * Constructor de la clase InterfazTexto
     */
    public InterfazTexto()    {
          
    }

     /**
     *  Único método público de la clase. Controla toda la lógica
     *  de la aplicación. Pide los datos de una persona, crea el objeto Persona
     *  y luego a través de un menú da la posibilidad al usuario de mostrar esos
     *  datos     
     */
    public void ejecutar()    {
        int edad = 0;
        double sueldo = 0;
        char estado = 'a';
        int opcion = 0;
        
        bienvenida();
        
        String nombre = leerNombre(); //ais
        persona.setNombre(nombre);
        
        edad = leerEdad();
        persona.setEdad(edad);
        
        sueldo = leerSueldo();
        persona.setSueldo(sueldo);
        
        estado = leerEstado();
        persona.setEstado(estado);
        
        opcion = mostrarMenu();
        switch(opcion){
            case COMPLETO: 
                mostrarDatosCompletos();
            break;
            case NOMBRE:   
                mostrarNombre();
            break;
            case EDAD:     
                mostrarEdad();
            break;
            case SUELDO:   
                mostrarSueldo();
            break;
            case ESTADO:   
                mostrarEstadoCivil();
            break;
        }
        
        despedida();
    }
    
    /**
     *   Pide por teclado un nombre y lo devuelve
     *  
     */
    private String leerNombre()    {
        System.out.println("Dame nombre: ");
        String nombre = teclado.nextLine();
        return nombre;
    }
    
     /**
     *   
     * Pide por teclado la edad y la devuelve
     */
    private int leerEdad()    {
         System.out.println("Dame edad: ");
        int edad = teclado.nextInt();
        return edad;
    }
    
      /**
     *   
     *  Pide por teclado el sueldo y lo devuelve
     */
    private double leerSueldo()    {
        System.out.println("Dame sueldo: ");
        double sueldo = teclado.nextDouble();
       
        teclado.nextLine();
        return sueldo;
    }
    
      /**
     *   
     *  Pide por teclado el estado civil y lo devuelve
     */
    private char leerEstado()    {
     System.out.println("Dame estado Civil: ");
        char estado = teclado.nextLine().charAt(0);  
        return estado;
    }
    
    /**
     * Muestra un mensaje de bienvenida  
     */
    private void bienvenida()    {
          System.out.println("Bienvenido/a a nuestra aplicación");
    }
    
     /**
     * 
     * Muestra un mensaje de despedida       
     */
    private void despedida()    {
          System.out.println("Adiós");
    }
    
      /**
     * Muestra en pantalla los datos completos de la persona    
     */
    private void mostrarDatosCompletos()    {
          System.out.println(persona.toString());
    }
    
      /**
     * 
     * Muestra solo la edad   
     */
    private void mostrarEdad()    {
          System.out.println("Edad: " + persona.getEdad());
    }
    
      /**
     * 
     * Muestra solo el nombre     
     */
    private void mostrarNombre()    {
        System.out.println("Nombre: " + persona.getNombre());
    }
    
     /**
     * Muestra solo el sueldo     
     */
    private void mostrarSueldo()    {
           System.out.println("Sueldo: " + persona.getSueldo());
    }
    
          /**
     * 
     * Muestra solo el estado civil     
     */
    private void mostrarEstadoCivil()    {
           System.out.println("Estado: " + persona.getEstado());
           
    }
    
        /**
     * 
     * Muestra el menú inicial al usuario
     * Le pide que teclee una opción, la lee desde el teclado y la devuelve
     */
    private int mostrarMenu()    {
        borrarPantalla();
        System.out.println("1. Mostrar datos completos");
        System.out.println("2. Mostrar nombre");
        System.out.println("3. Mostrar edad");
        System.out.println("4. Mostrar sueldo");
        System.out.println("5. Mostrar estado civil");
        System.out.println("Introduce opción: ");
        int opcion = teclado.nextInt();
        // teclado.nextLine();
        return opcion;
    }
    
      /**
     *  Limpiar la pantalla
     *  
     */
    private void borrarPantalla( )    {
         System.out.println('\u000C');
    }
    
    
}
