
package Modelo;


public class GS_Existente {
   
    private String Nombre;
    private String Documento;
    private String Fecha_Nacimiento;
    private String Tipo_Mascota;

    public GS_Existente(String Nombre, String Documento, String Fecha_Nacimiento, String Tipo_Mascota) {
        this.Nombre = Nombre;
        this.Documento = Documento;
        this.Fecha_Nacimiento = Fecha_Nacimiento;
        this.Tipo_Mascota = Tipo_Mascota;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getFecha_Nacimiento() {
        return Fecha_Nacimiento;
    }

    public void setFecha_Nacimiento(String Fecha_Nacimiento) {
        this.Fecha_Nacimiento = Fecha_Nacimiento;
    }

    public String getTipo_Mascota() {
        return Tipo_Mascota;
    }

    public void setTipo_Mascota(String Tipo_Mascota) {
        this.Tipo_Mascota = Tipo_Mascota;
    }
    
    
    
}
