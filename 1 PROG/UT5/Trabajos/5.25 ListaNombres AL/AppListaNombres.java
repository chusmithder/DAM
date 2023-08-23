import java.util.Arrays;
/**
 * 
 * Acepta como argumento del main el tama�o m�ximo de la lista
 * Si no se pasan argumentos se muestra un mensaje de error, se le informa al usuario
 * de la sintaxis a utilizar y se acaba el programa
 * 
 * En otro caso se crea la lista y:
 *  - se llama al m�todo cargarDeFichero() 
 *  - se muestra la lista
 *  - se muestra el nombre m�s largo
 *  - se borran los que empiezan por 'r'
 *  - se muestra la lista
 *  - se muestra cu�ntos empiezan por 'aL'
 *  - se muestran los nombres que empiezan por "a"
 */
public class AppListaNombres
{

    /**
     *  
     */
    public static void main(String[] args) {
        if (args.length == 1){
           int tam = Integer.parseInt(args[0]);//asumimos positivo
           if (tam >= 1) {
               ListaNombres lista = new ListaNombres(tam);
               lista.cargarDeFichero();
               lista.printLista();
               
               System.out.println("Nombre m�s largo:");
               System.out.println(lista.nombreMasLargo());
               
               System.out.println("Lista sin elementos que empiezan por r:");
               lista.borrarLetra('r');
               lista.printLista();
               
               System.out.println("Empiezan por aL: " + lista.empiezanPor("aL"));
               
               String[] empA = lista.empiezanPorLetra('a');
               System.out.println("Lista sin elementos que empiezan por a:");
               System.out.println(Arrays.toString(empA));               
           }
           else {
               System.out.println("El tama�o debe ser de al menos 1");
           }
       }
        else{
            System.out.println("Debe insertar el tama�o maximo de la lista");
        }
        
    }
}
