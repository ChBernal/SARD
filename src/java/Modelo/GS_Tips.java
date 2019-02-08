package Modelo;

public class GS_Tips {
    private int Codigo;
    private String Nombre;
    private String Tip;

    public GS_Tips() {
    }

    public GS_Tips(int Codigo, String Nombre, String Tip) {
        this.Codigo = Codigo;
        this.Nombre = Nombre;
        this.Tip = Tip;
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

    public String getTip() {
        return Tip;
    }

    public void setTip(String Tip) {
        this.Tip = Tip;
    }
    
}
