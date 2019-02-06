
package Modelo;


public class GS_Denuncia_Cliente {
    
    private int Codigo;
    private String Direccion;
    private String Descripcion;
    private String Evidencia;
    private String Documento;
    private String Fecha;

    public GS_Denuncia_Cliente(int Codigo, String Direccion, String Descripcion, String Evidencia, String Documento) {
        this.Codigo = Codigo;
        this.Direccion = Direccion;
        this.Descripcion = Descripcion;
        this.Evidencia = Evidencia;
        this.Documento = Documento;
    }

    public GS_Denuncia_Cliente(int Codigo, String Direccion, String Descripcion, String Evidencia, String Documento, String Fecha) {
        this.Codigo = Codigo;
        this.Direccion = Direccion;
        this.Descripcion = Descripcion;
        this.Evidencia = Evidencia;
        this.Documento = Documento;
        this.Fecha = Fecha;
    }

    public GS_Denuncia_Cliente() {
    }

    public GS_Denuncia_Cliente(int Codigo) {
        this.Codigo = Codigo;
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getEvidencia() {
        return Evidencia;
    }

    public void setEvidencia(String Evidencia) {
        this.Evidencia = Evidencia;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    
}
