package Modelo;

public class GS_Postulacion {
    
    private int Codigo;
    private String DocumentoC;
    private int CodigoMascota;
    private String Cedula;
    private String Recibo;
    private String Fecha;
    private int Estado;
    private String TipoMascota;
    private String NombreMascota;
    private String FotoMascota;
    private String NombreP;
    private String ApellidoP;
    private String Telefono1P;
    private String Telefono2P;
    private int Codigo_Postulacion;
    private String CorreoP;
    private String CopiaCC;
    private String CopiaRP;
    private int Encuesta;

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

    public GS_Postulacion(String DocumentoC, String Cedula, String Recibo, String Fecha, String TipoMascota, String NombreMascota, String FotoMascota, String NombreP) {
        this.DocumentoC = DocumentoC;
        this.Cedula = Cedula;
        this.Recibo = Recibo;
        this.Fecha = Fecha;
        this.TipoMascota = TipoMascota;
        this.NombreMascota = NombreMascota;
        this.FotoMascota = FotoMascota;
        this.NombreP = NombreP;
    }

    public GS_Postulacion(int CodigoMascota, String TipoMascota, String NombreMascota, String FotoMascota, String DocumentoC, String NombreP, String ApellidoP, String Telefono1P, String Telefono2P, String CorreoP, String Fecha, String CopiaCC, String CopiaRP) {
        this.CodigoMascota = CodigoMascota;
        this.TipoMascota = TipoMascota;
        this.NombreMascota = NombreMascota;
        this.FotoMascota = FotoMascota;
        this.DocumentoC = DocumentoC;
        this.NombreP = NombreP;
        this.ApellidoP = ApellidoP;
        this.Telefono1P = Telefono1P;
        this.Telefono2P = Telefono2P;
        this.CorreoP = CorreoP;
        this.Fecha = Fecha;
        this.CopiaCC = CopiaCC;
        this.CopiaRP = CopiaRP;
    }

  
   
    public GS_Postulacion(int Codigo,int CodigoMascota, String TipoMascota, String NombreMascota, String FotoMascota, String DocumentoC, String NombreP, String ApellidoP, String Telefono1P, String Telefono2P, String CorreoP, String Fecha, String CopiaCC, String CopiaRP, int Encuesta) {
        this.Codigo = Codigo;
        this.CodigoMascota = CodigoMascota;
        this.TipoMascota = TipoMascota;
        this.NombreMascota = NombreMascota;
        this.FotoMascota = FotoMascota;
        this.DocumentoC = DocumentoC;
        this.NombreP = NombreP;
        this.ApellidoP = ApellidoP;
        this.Telefono1P = Telefono1P;
        this.Telefono2P = Telefono2P;
        this.CorreoP = CorreoP;
        this.Fecha = Fecha;
        this.CopiaCC = CopiaCC;
        this.CopiaRP = CopiaRP;
        this.Encuesta = Encuesta;
    }

    public int getEncuesta() {
        return Encuesta;
    }

    public void setEncuesta(int Encuesta) {
        this.Encuesta = Encuesta;
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

    public String getTipoMascota() {
        return TipoMascota;
    }

    public void setTipoMascota(String TipoMascota) {
        this.TipoMascota = TipoMascota;
    }

    public String getNombreMascota() {
        return NombreMascota;
    }

    public void setNombreMascota(String NombreMascota) {
        this.NombreMascota = NombreMascota;
    }

    public String getFotoMascota() {
        return FotoMascota;
    }

    public void setFotoMascota(String FotoMascota) {
        this.FotoMascota = FotoMascota;
    }

    public String getNombreP() {
        return NombreP;
    }

    public void setNombreP(String NombreP) {
        this.NombreP = NombreP;
    }

    public String getApellidoP() {
        return ApellidoP;
    }

    public void setApellidoP(String ApellidoP) {
        this.ApellidoP = ApellidoP;
    }

    public String getTelefono1P() {
        return Telefono1P;
    }

    public void setTelefono1P(String Telefono1P) {
        this.Telefono1P = Telefono1P;
    }

    public String getTelefono2P() {
        return Telefono2P;
    }

    public void setTelefono2P(String Telefono2P) {
        this.Telefono2P = Telefono2P;
    }

    public String getCorreoP() {
        return CorreoP;
    }

    public void setCorreoP(String CorreoP) {
        this.CorreoP = CorreoP;
    }

    public String getCopiaCC() {
        return CopiaCC;
    }

    public void setCopiaCC(String CopiaCC) {
        this.CopiaCC = CopiaCC;
    }

    public String getCopiaRP() {
        return CopiaRP;
    }

    public void setCopiaRP(String CopiaRP) {
        this.CopiaRP = CopiaRP;
    }
    
}

