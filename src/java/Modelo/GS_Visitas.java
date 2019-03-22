
package Modelo;

  

    
public class GS_Visitas {
    
      private int Id_Visita;
      private String Fecha;
      private String Encargado;
      private String Postulante;
      private int Postulacion;

    public GS_Visitas() {
    }

    public GS_Visitas(int Id_Visita, String Fecha, String Encargado, String Postulante) {
        this.Id_Visita = Id_Visita;
        this.Fecha = Fecha;
        this.Encargado = Encargado;
        this.Postulante = Postulante;
    }

    public GS_Visitas(String Fecha, String Encargado, String Postulante, int Postulacion) {
        this.Fecha = Fecha;
        this.Encargado = Encargado;
        this.Postulante = Postulante;
        this.Postulacion = Postulacion;
    }

    public int getPostulacion() {
        return Postulacion;
    }

    public void setPostulacion(int Postulacion) {
        this.Postulacion = Postulacion;
    }

    
    
    public int getId_Visita() {
        return Id_Visita;
    }

    public void setId_Visita(int Id_Visita) {
        this.Id_Visita = Id_Visita;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getEncargado() {
        return Encargado;
    }

    public void setEncargado(String Encargado) {
        this.Encargado = Encargado;
    }

    public String getPostulante() {
        return Postulante;
    }

    public void setPostulante(String Postulante) {
        this.Postulante = Postulante;
    }
      
      
}
