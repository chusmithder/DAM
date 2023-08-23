/**
 * Este proyecto modela una sencilla máquina expendedora de billetes.
 * El precio del ticket se especifica via el constructor.
 * Es una máquina sencilla en el sentido de que confía que el usuario 
 * inserte el suficiente dinero antes de emitir el ticket.
 * Asume también que el usuario introduce cantidades positivas
 */

public class  MáquinaExpendedora
{
    // El precio de un ticket en esta máquina
    private int precio;
    // Cantidad de dinero introducida por el usuario hasta ahora
    private int importe;
    // Cantidad total de dinero recogida por la máquina
    private int total;

    /**
     * Crear una máquina que emite tickets de un determinado precio
     * El precio ha de ser mayor que 0 y no hay que verificar esto
     */

    public MáquinaExpendedora(int precioTicket)
    {
        precio = precioTicket;
        importe = 0;
        total = 0;
    }

    /**
     * Devolver el precio de un billete
     */
    public int getPrecio()
    {
        return precio;
    }

    /**
     * Devolver la cantidad de dinero insertada hasta el momento
     * para el billete
     */
    public int getImporte()
    {
        return importe;
    }

    /**
     * Devolver la cantidad total recogida por la maquina
     */
    public int getTotal()
    {
        return total;
    }

    /**
     * Recibir una cantidad de dinero de un usuario
     */

    public void insertarDinero(int cantidad)
    {
        importe = importe + cantidad; //importe += cantidad;
    }

    /**
     * Imprimir un ticket
     * Actualizar el total recolectado por la máquina y
     * poner el importe a 0
     */

    public void imprimirTicket()
    {
        // Simula impresión de un billete

        System.out.println("##################################");
        System.out.println("# Máquina expendedora BlueJ");
        System.out.println("# Billete:");
        System.out.println("# " + precio + " cents.");
        System.out.println("##################################");
        System.out.println();

        // Actualizar el total recogido por la máquina
        total = total + importe;
        // Poner el importe a 0
        importe = 0;
    }

    /**
     * Mostrar xxxx texto en pantalla (terminal)
     * No es accesor ni mutador
     */
    public void prompt() {
        System.out.println("Por favor, inserte la cantidad correcta de dinero");
    }

    /**
     * Es un metodo accesor (muestra el valor de la variable de instancia 
     * precio)
     */
    public void mostrarPrecio() {
        System.out.println("El precio total del ticket es " + precio + " cents");
    }



}