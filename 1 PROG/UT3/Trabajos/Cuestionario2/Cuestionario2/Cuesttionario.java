
/**
 *  
 * 
 * @author  
 * @version  
 */
public class Cuesttionario
{
     
 /**
     * 
     */
    public void X() {
        int r = 4;
        int s = 2;
        r = s;
        System.out.println(r +"y"+ s);
    }

    /**
     * 
     */
    public void XX() {
        int p = 4;
        int q = 8;
        q = p;
        p = q;
        System.out.println(p +"y"+ q);
    }

    /**
     * 
     */
    public double xxx() {
        double descuento;
        char codigo = 'b';
        switch (codigo)
        {
            case 'a':
            case 'A': descuento = 0.0;
                break;
            case 'b':
            case 'B': descuento = 0.1;
                break;
            case 'c':
            case 'C': descuento = 0.2;
                break;
            default:
                descuento = 0.3;
        }
        return descuento;
    }

    /**
     * 
     */
    public void metodo() {
        boolean par = false;
        if(par){

            System.out.println("Es par");
        }
    }

    /**
     * 
     */
    public int XXXX() {
        int x = 3;
        int y = 4;
        switch (x + 4)
        {
        case 6: y += 3;
        case 7: y += 1;
        default: y += 1; // se ejecuta hacia abaj desde el 7o
        }
        return y;
    }

}
