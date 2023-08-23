
/**
 *  Este proyecto simula
 * 
 */
public class Cantante
{
    private boolean feliz;

    /**
     * Crear cantantes con un estado inicial feliz  
     */
    public Cantante()    {
        feliz = true;
    }

    /**
     * Examina el estado de animo
     * ACCESOR - Examina su estado de animo (atributo feliz) 
     */
    public void cantar() {
        if (feliz == true){
            System.out.println("Cantando bajo la lluvia");
        }
        else {
            System.out.println("No tiene animo para cantar");
        }

    }

    /**
     * VERSION IF
     */
    public boolean estaTristeV1() {
        if(feliz == false){
            return true;
        }
        return false;
    }

    /**
     * SIN IF
     */
    public boolean estaTristeV2() {
        return !feliz;
    }

    /**
     * VERSION IF 
     */
    public boolean estaTristeV3() {
        if(!feliz){ //Se evalua !feliz, si es verdad es porque feliz es falso
            return true;
        }
        return false;
    }

    /**
     * Cambiar estado de animo
     * MUTADOR
     */
    public void cambiarEstadoAnimoV1() {
        if (feliz == true){
            feliz = false;
        }
        else {
            feliz = true;
        }
    }
    
    /**
     * Cambiar estado de animo
     * MUTADOR (sin sentencia if)
     */
    public void cambiarEstadoAnimoV2(){
        feliz = !feliz;
        
    }

}
