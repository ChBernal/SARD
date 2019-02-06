package Modelo;

public class GS_Denuncias {
    private String Direccion;
    private String Descripcion;
    private String Evidencia;
    private String Correo;

    public GS_Denuncias(String Direccion, String Descripcion, String Evidencia, String Correo) {
        this.Direccion = Direccion;
        this.Descripcion = Descripcion;
        this.Evidencia = Evidencia;
        this.Correo = Correo;
    }

    public GS_Denuncias() {
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

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

}
