
/**
 *  
 * 
 * @author  
 * @version  
 */
public class TestCiirculo
{
     

    /**
     *  METODO STATIC
     */
    public static void main(String[] args) {
         System.out.println(Circulo.PI);
         // Circulo.PI = 67;// NO SE PUEDE ASIGNAR A UNA CONSTANTE
         Circulo c1 = new Circulo(8);
         Circulo c2 = new Circulo(88);
         System.out.println("Circulos creados: " + Circulo.getContadorCirculos());
         // radio++; //no puede acceder a una variable de instancia
         //se asume que actua directamente sobre la clase, no supone las instancias
         //Usaremos poco Static, para no desviarnos de la definicion de orientacion a objetos
         //Cuando un metodo no alude a los atributos (solo parametros) pueden ser estaticos
         
    }
}
