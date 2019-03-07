package Modelo;

public class GS_Tips {
    private int Codigo;
    private String Titulo;
    private String Imagen;
    private String Descripcion;

    public GS_Tips(int Codigo, String Titulo, String Imagen, String Descripcion) {
        this.Codigo = Codigo;
        this.Titulo = Titulo;
        this.Imagen = Imagen;
        this.Descripcion = Descripcion;
    }

    public GS_Tips(String Titulo, String Imagen, String Descripcion) {
        this.Titulo = Titulo;
        this.Imagen = Imagen;
        this.Descripcion = Descripcion;
    }
    
    public GS_Tips(int Codigo) {
        this.Codigo = Codigo;
    }

    public GS_Tips() {
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    
}
