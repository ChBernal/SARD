
package Modelo;


public class GS_Postulacion {
    
    private int Codigo;
    private String DocumentoC;
    private int CodigoMascota;
    private String Cedula;
    private String Recibo;
    private String Fecha;
    private int Estado;

    public GS_Postulacion(int Codigo, String DocumentoC, int CodigoMascota, String Cedula, String Recibo, String Fecha, int Estado) {
        this.Codigo = Codigo;
        this.DocumentoC = DocumentoC;
        this.CodigoMascota = CodigoMascota;
        this.Cedula = Cedula;
        this.Recibo = Recibo;
        this.Fecha = Fecha;
        this.Estado = Estado;
    }

    public GS_Postulacion(String DocumentoC, int CodigoMascota, String Cedula, String Recibo, int Estado) {
        this.DocumentoC = DocumentoC;
        this.CodigoMascota = CodigoMascota;
        this.Cedula = Cedula;
        this.Recibo = Recibo;
        this.Estado = Estado;
    }
    
    public GS_Postulacion() {
    }

    public GS_Postulacion(int Codigo) {
        this.Codigo = Codigo;
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public String getDocumentoC() {
        return DocumentoC;
    }

    public void setDocumentoC(String DocumentoC) {
        this.DocumentoC = DocumentoC;
    }

    public int getCodigoMascota() {
        return CodigoMascota;
    }

    public void setCodigoMascota(int CodigoMascota) {
        this.CodigoMascota = CodigoMascota;
    }

    public String getCedula() {
        return Cedula;
    }

    public void setCedula(String Cedula) {
        this.Cedula = Cedula;
    }

    public String getRecibo() {
        return Recibo;
    }

    public void setRecibo(String Recibo) {
        this.Recibo = Recibo;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
    
}
