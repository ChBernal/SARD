
package Modelo;


public class GS_Administrador {

    private String Documento;
    private String Tipo_Documento;
    private String Nombre;
    private String Apellido;
    private String Genero;
    private String Fecha_Nacimiento;
    private String Direccion;
    private String Telefono;
    private String Correo;
    private int Rol;
    private String Foto;

    public GS_Administrador(String Documento, String Tipo_Documento, String Nombre, String Apellido, String Genero, String Fecha_Nacimiento, String Direccion, String Telefono, String Correo, int Rol, String Foto) {
        this.Documento = Documento;
        this.Tipo_Documento = Tipo_Documento;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Genero = Genero;
        this.Fecha_Nacimiento = Fecha_Nacimiento;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Rol = Rol;
        this.Foto = Foto;
    }

    public GS_Administrador(String Documento, String Tipo_Documento, String Nombre, String Apellido, String Genero, String Fecha_Nacimiento, String Direccion, String Telefono, String Correo, String Foto) {
        this.Documento = Documento;
        this.Tipo_Documento = Tipo_Documento;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Genero = Genero;
        this.Fecha_Nacimiento = Fecha_Nacimiento;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Foto = Foto;
    }

    public GS_Administrador(String Documento,String Direccion, String Telefono, String Correo, String Foto) {
        this.Documento = Documento;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Foto = Foto;
    }

    public GS_Administrador(String Documento) {
        this.Documento = Documento;
    }
    
    public String getDocumento() {
        return Documento;
    }

    public GS_Administrador() {
    }

    public GS_Administrador(String Nombre, String Apellido, String Foto) {
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Foto = Foto;
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

    public String getFecha_Nacimiento() {
        return Fecha_Nacimiento;
    }

    public void setFecha_Nacimiento(String Fecha_Nacimiento) {
        this.Fecha_Nacimiento = Fecha_Nacimiento;
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
