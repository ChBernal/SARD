package Modelo;

public class GS_Login {
    private String Usuario;
    private String Clave;
    private int Rol;
    private int Estado;

    public GS_Login() {
    }
    
    public GS_Login(String Usuario, String Clave, int Rol, int Estado) {
        this.Usuario = Usuario;
        this.Clave = Clave;
        this.Rol = Rol;
        this.Estado = Estado;
    }

    public GS_Login(String Usuario, String Clave, int Estado) {
        this.Usuario = Usuario;
        this.Clave = Clave;
        this.Estado = Estado;
    }

    public GS_Login(String Usuario, String Clave) {
        this.Usuario = Usuario;
        this.Clave = Clave;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getClave() {
        return Clave;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }

    public int getRol() {
        return Rol;
    }

    public void setRol(int Rol) {
        this.Rol = Rol;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
    
    

    
}
