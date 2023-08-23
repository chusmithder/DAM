


import javax.swing.JOptionPane;   
/**
 * Modela un saludo personalizado
 * 
 * 
 */

public class Saludo
{
        private String nombre;
        
        /**
         * Constructor de la clase Saludo
         */
        public Saludo(String aQuien)
        {
                nombre = aQuien;
        }

        /**
         * @param  
         * @return     
         */
        public void saludar()
        {
                JOptionPane.showMessageDialog(null,"Hola " + nombre +
                        " cómo estás?");        
        }
}
