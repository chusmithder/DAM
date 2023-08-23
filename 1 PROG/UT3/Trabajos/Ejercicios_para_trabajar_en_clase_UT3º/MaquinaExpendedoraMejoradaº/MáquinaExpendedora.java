
/**
 * Este proyecto modela una sencilla m�quina expendedora de billetes.
 * El precio del ticket se especifica via el constructor.
 * Los objetos verifican que un usuario solo introduce cantidades positivas de dinero y solo
 * emiten un ticket si se ha introducido suficiente dinero
 */

public class  M�quinaExpendedora
{
    // El precio de un ticket en esta m�quina
    private int precio;
    // Cantidad de dinero introducida por el usuario hasta ahora
    private int importe;
    // Cantidad total de dinero recogida por la m�quina
    private int total;

    /**
     * Crear una m�quina que emite tickets de un determinado precio
     * El precio ha de ser mayor que 0 y no hay verificaci�n de esto
     */

    public M�quinaExpendedora(int precioTicket)
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
     * Recibir una cantidad de dinero de un usuario
     * Verificar que la cantidad es positiva
     */

    public void insertarDinero(int cantidad)
    {
        if (cantidad > 0) 
        {
            importe = importe + cantidad;
        }
        else
        {
            System.out.println("Introduzca una cantidad positiva: " + cantidad);
        }
    }

    /**
     * Imprimir un ticket si se ha introducido suficiente dinero
     * y reduce el importe restando el precio del ticket. Escribe un mensaje de error si
     * se necesita m�s dinero
     */

    public void imprimirTicket()
    {
        if (importe >= precio)
        {
            // Simula impresi�n de un billete
            System.out.println("##################");
            System.out.println("# M�quina expendedora BlueJ");
            System.out.println("# Billete:");
            System.out.println("# " + precio + " cents.");
            System.out.println("##################");
            System.out.println();
            // Actualizar el total recogido por la m�quina con el precio
            total = total + precio;
            // decrementar el importe con el precio
            importe = importe - precio;
        }
        else
        {
            System.out.println("# Debe insertar al menos: " +
                (precio - importe) + " c�ntimos m�s ");   
        }

    }
    
    /**
     * Imprimir un ticket si se ha introducido suficiente dinero
     * y reduce el importe restando el precio del ticket. Escribe un mensaje de error si
     * se necesita m�s dinero
     */

    public void imprimirTicketV1()
    {
        int cantidadPendiente;
        cantidadPendiente = importe - precio;
        
        if (cantidadPendiente >= 0){
            // Simula impresi�n de un billete
            System.out.println("##################");
            System.out.println("# M�quina expendedora BlueJ");
            System.out.println("# Billete:");
            System.out.println("# " + precio + " cents.");
            System.out.println("##################");
            System.out.println();
            
            //Actualiza el total recogido por la maquina:
            total = total + precio;
            //Decrementa el valor del importe con el del precio
            importe = importe - precio;

        }
        else {
            System.out.println("# Debe insertar al menos: " +
                (precio - importe) + " c�ntimos m�s ");
        }

    }

    /**
     * Devolver el dinero del importe y poner el importe a 0
     */

    public int devolverCambio()
    {
        int cambio;     

        cambio = importe;
        importe = 0;
        return cambio;

    }

    /**
     * Simula que sacamos todo el dinero de la maquina
     * (Mutador)
     */
    public int vaciarMaquina () {
        int totalMaquina;
        totalMaquina = total;
        total = 0;
        return totalMaquina;
    }

}
