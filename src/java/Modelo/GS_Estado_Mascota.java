
package Modelo;


public class GS_Estado_Mascota {
   private int Codigo;
   private int Estado;
   private int Cod_Mascota;
   private String Doc_Dueño;

    public GS_Estado_Mascota(int Estado, int Cod_Mascota, String Doc_Dueño) {
        this.Estado = Estado;
        this.Cod_Mascota = Cod_Mascota;
        this.Doc_Dueño = Doc_Dueño;
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }

    public int getCod_Mascota() {
        return Cod_Mascota;
    }

    public void setCod_Mascota(int Cod_Mascota) {
        this.Cod_Mascota = Cod_Mascota;
    }

    public String getDoc_Dueño() {
        return Doc_Dueño;
    }

    public void setDoc_Dueño(String Doc_Dueño) {
        this.Doc_Dueño = Doc_Dueño;
    }
   
   
}
