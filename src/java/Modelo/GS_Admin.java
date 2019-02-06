package Modelo;

public class GS_Admin {
    private String Documento;
    private String Tipo_Documento;
    private String Nombre;
    private String Apellido;
    private String Genero;
    private String Nacimiento;
    private String Direccion;
    private String Telefono;
    private String Correo;
    private int Rol;
    private String Foto;

    public GS_Admin() {
    }

    public GS_Admin(String Documento) {
        this.Documento = Documento;
    }

    public GS_Admin(String Documento, String Tipo_Documento, String Nombre, String Apellido, String Genero, String Nacimiento, String Direccion, String Telefono, String Correo, String Foto) {
        this.Documento = Documento;
        this.Tipo_Documento = Tipo_Documento;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Genero = Genero;
        this.Nacimiento = Nacimiento;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Foto = Foto;
    }

    public GS_Admin(String Documento, String Tipo_Documento, String Nombre, String Apellido, String Genero, String Nacimiento, String Direccion, String Telefono, String Correo, int Rol, String Foto) {
        this.Documento = Documento;
        this.Tipo_Documento = Tipo_Documento;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Genero = Genero;
        this.Nacimiento = Nacimiento;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Rol = Rol;
        this.Foto = Foto;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getTipo_Documento() {
        return Tipo_Documento;
    }

    public void setTipo_Documento(String Tipo_Documento) {
        this.Tipo_Documento = Tipo_Documento;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    public String getNacimiento() {
        return Nacimiento;
    }

    public void setNacimiento(String Nacimiento) {
        this.Nacimiento = Nacimiento;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public int getRol() {
        return Rol;
    }

    public void setRol(int Rol) {
        this.Rol = Rol;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

}
