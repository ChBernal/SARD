
package Modelo;


public class GS_Respuesta {
   
    private int Codigo;
    private String Descripcion;
    private int Cod_Denuncia;
    private String Fecha;

    public GS_Respuesta(int Codigo, String Descripcion, int Cod_Denuncia, String Fecha) {
        this.Codigo = Codigo;
        this.Descripcion = Descripcion;
        this.Cod_Denuncia = Cod_Denuncia;
        this.Fecha = Fecha;
    }

    public GS_Respuesta(String Descripcion, int Cod_Denuncia) {
        this.Descripcion = Descripcion;
        this.Cod_Denuncia = Cod_Denuncia;
    }

    public GS_Respuesta() {
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getCod_Denuncia() {
        return Cod_Denuncia;
    }

    public void setCod_Denuncia(int Cod_Denuncia) {
        this.Cod_Denuncia = Cod_Denuncia;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    
    
}
