/**
 * Esta clase mantiene informaci�n sobre un libro.
 * Podra formar parte de una aplicaci�n m�s grande como un sistema que gestionase una librer�a, por ejemplo.
 *
 * @author (Introduce tu nombre)
 * @version (Inserta la fecha de hoy)
 */
public class Libro
{
    // los atributos
    private String autor;
    private String titulo;
    private int numeroPaginas;
    private String numeroReferencia;
    private int vecesPrestado;
    /**
     * establecer el autor y el titulo cunado el objeto se construya
     */
    public Libro(String queAutor, String queTitulo, int queNumeroPaginas)
    {
        autor = queAutor;
        titulo = queTitulo;
        numeroPaginas= queNumeroPaginas;
        numeroReferencia = "";
        vecesPrestado = 0;
    }

    /**
     *     
     */
    public String getAutor() {
        return autor;
    }
    
        /**
     *     
     */
    public String getTitulo() {
        return titulo;
    }
    
       /**
     *     
     */
    public int getNumeroPaginas() {
        return numeroPaginas;
    }
    
    /**
    *     
    */
    public String getNumeroReferencia() {
        return numeroReferencia;
    }
    
    /**
    *     
    */
    public int getVecesPrestado() {
        return vecesPrestado;
    }
    
    /**
     *     
     */
    public void printAutor() {
        System.out.println("Autor:" + autor);
    }
    
        /**
     *     
     */
    public void printTitulo() {
        System.out.println("Titulo:" + titulo);
    }
    
    /**
     *     
     */
    public void printDetalles() {
        System.out.println("Titulo:" + titulo);
        System.out.println("Autor:" + autor);
        System.out.println("Numero Paginas:" + numeroPaginas);
        System.out.println("Numero deReferencia:" + numeroReferencia);
        System.out.println("Veces Prestado:" + vecesPrestado);
    }
    
    /**
    *     
    */
    public void setNumeroReferencia(String queNumeroReferencia){
        numeroReferencia = queNumeroReferencia;
    }
    
    /**
    *     
    */
    public void prestar(){
        vecesPrestado ++ ; 
    }
}
