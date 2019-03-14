
package Modelo;


public class GS_Estadistacas {
    
    private int Codigo;
    private int Encuesta;
    private int Visita;
    private String Documento;

    public GS_Estadistacas(int Codigo, int Encuesta, int Visita, String Documento) {
        this.Codigo = Codigo;
        this.Encuesta = Encuesta;
        this.Visita = Visita;
        this.Documento = Documento;
    }

    public GS_Estadistacas(int Encuesta, int Visita, String Documento) {
        this.Encuesta = Encuesta;
        this.Visita = Visita;
        this.Documento = Documento;
    }

    public GS_Estadistacas(int Encuesta, String Documento) {
        this.Encuesta = Encuesta;
        this.Documento = Documento;
    }
    
    public GS_Estadistacas() {
    }

    public GS_Estadistacas(int Codigo) {
        this.Codigo = Codigo;
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public int getEncuesta() {
        return Encuesta;
    }

    public void setEncuesta(int Encuesta) {
        this.Encuesta = Encuesta;
    }

    public int getVisita() {
        return Visita;
    }

    public void setVisita(int Visita) {
        this.Visita = Visita;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }
    
    
}
