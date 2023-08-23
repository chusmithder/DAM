
/**
 * La clase modela un nº racional, una fracción
 * representada por su numerador y denominador
 * @author - Christhoper Pinday Delgado
 */
public class Fraccion
{
    private int numerador;  
    private int denominador;

    /**
     *
     * Constructor  
     */
    public  Fraccion(){
        numerador = 0;
        denominador = 0;
    }   
    
    /**
     * constructor para los objetos de la clase Fraccion
     */
    public Fraccion(int numerador, int denominador)
    {
            this.numerador = numerador;
            this.denominador = denominador;
    }

    /**
     * Accesor para el numerador
     */
    public int getNumerador(){
       return numerador;
    }
    
     /**
     * Accesor para el denominador
     */
    public int getDenominador(){
       return denominador;
    }
    
    /**
     * Mutador para el numerador
     */
    public void setNumerador(int numerador){
        this.numerador = numerador;
    }
    
    /**
     * Mutador para el denominador
     */
    public void setDenominador(int denominador)
    {
       this.denominador = denominador;
    }  
    
    /**
     * Suma la fracción actual por la que 
     * se recibe como parámetro
     * @param otra fraccion con la que sumar
     * @return  la suma de dos  fracciones
     */
    public Fraccion sumar(Fraccion otra) {
        Fraccion suma = new Fraccion();
        suma.numerador = numerador * otra.getDenominador() + denominador * otra.getNumerador();
        suma.denominador = denominador * otra.getDenominador();
        return suma;
    }
    
     /**
     * Resta la fracción actual por la que 
     * se recibe como parámetro
     * @param otra  fracción con la que se resta
     * @return  la resta  de dos fracciones
     */
    public Fraccion restar(Fraccion otra)
    {
        int x = numerador * otra.getDenominador() - denominador * otra.getNumerador();
        int y = denominador * otra.getDenominador();
        return new Fraccion(x, y);
    }
    
    /**
     * Multiplica la fracción actual por la que 
     * se recibe como parámetro
     * @param otra fraccion por la que se multiplica
     * @return  el producto de dos fracciones
     */
    public Fraccion multiplicar(Fraccion otra)
    {        
        int n = numerador * otra.getNumerador();
        int d = denominador * otra.getDenominador();
        return new Fraccion(n, d);
    }
    
    /**
     * Divide la fracción actual entre la que 
     * se pasa como parámetro
     * @param otra  fraccion entre la que se dividirá
     * @return  el cociente de dos fracciones
     */
    public Fraccion dividir(Fraccion otra)
    {
        int n = numerador * otra.getDenominador();
        int d = denominador * otra.getNumerador();
        return new Fraccion(n, d);
    }
    
    /**
     * Compara dos fracciones, la actual y 
     * la recibida como parámetro
     * @param otra la fracción con la que comparar
     * @return true si son iguales
     */
    public boolean igualQue(Fraccion otra)
    {
        int x = numerador * otra.getDenominador();
        int y = denominador * otra.getNumerador();
        if(x == y){
            return true;
        }
        return false;
    }
    
     /**
     * Compara dos fracciones, la actual y 
     * la recibida como parámetro
     * @param otra la fracción con la que comparar
     * @return true si la fraccióna actual es 
     *          menor que la recibida como parámetro
     */
    public boolean menorQue(Fraccion otra)
    {
        int x = numerador * otra.getDenominador();
        int y = denominador * otra.getNumerador();
        if(x < y){
            return true;
        }
        return false;
    }
    
    /**
     *
     * @return  la fracción actual clonada   
     */
    public Fraccion clonar()
    {
        return new Fraccion(this.numerador, this.denominador);
    }
    
    /**
     * Representación textual de la fracción
     */
    
    public String toString()
    {
        String tmp = numerador + " / " + denominador;
        return tmp;
    }
                
}
