package Modelo;

public class GS_Eventos {
    private int Codigo;
    private String Nombre;
    private String TipoEvento;
    private String Fecha;
    private String Descripcion;
    private String Imagen;

    public GS_Eventos() {
    }

    public GS_Eventos(String Nombre, String TipoEvento, String Fecha, String Descripcion, String Imagen) {
        this.Nombre = Nombre;
        this.TipoEvento = TipoEvento;
        this.Fecha = Fecha;
        this.Descripcion = Descripcion;
        this.Imagen = Imagen;
    }

    public GS_Eventos(int Codigo, String Nombre, String TipoEvento, String Fecha, String Descripcion, String Imagen) {
        this.Codigo = Codigo;
        this.Nombre = Nombre;
        this.TipoEvento = TipoEvento;
        this.Fecha = Fecha;
        this.Descripcion = Descripcion;
        this.Imagen = Imagen;
    }
    
    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getTipoEvento() {
        return TipoEvento;
    }

    public void setTipoEvento(String TipoEvento) {
        this.TipoEvento = TipoEvento;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }
    
}
