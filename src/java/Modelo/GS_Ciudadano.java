package Modelo;

public class GS_Ciudadano {
    private String Documento;
    private String Tipo_Documento;
    private String Expedicion;
    private String Nombre;
    private String Apellido;
    private String Genero;
    private String Nacimiento;
    private String Direccion;
    private String Barrio;
    private String Celular;
    private String Fijo;
    private String Correo;
    private String Ocupacion;
    private int Rol;
    private String Foto;

    public GS_Ciudadano() {
    }

    public GS_Ciudadano(String Documento) {
        this.Documento = Documento;
    }

    public GS_Ciudadano(String Documento, String Tipo_Documento, String Expedicion, String Nombre, String Apellido, String Genero, String Nacimiento, String Direccion, String Barrio, String Celular, String Fijo, String Correo, String Ocupacion, String Foto) {
        this.Documento = Documento;
        this.Tipo_Documento = Tipo_Documento;
        this.Expedicion = Expedicion;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Genero = Genero;
        this.Nacimiento = Nacimiento;
        this.Direccion = Direccion;
        this.Barrio = Barrio;
        this.Celular = Celular;
        this.Fijo = Fijo;
        this.Correo = Correo;
        this.Ocupacion = Ocupacion;
        this.Foto = Foto;
    }

    public GS_Ciudadano(String Documento, String Tipo_Documento, String Expedicion, String Nombre, String Apellido, String Genero, String Nacimiento, String Direccion, String Barrio, String Celular, String Fijo, String Correo, String Ocupacion, int Rol, String Foto) {
        this.Documento = Documento;
        this.Tipo_Documento = Tipo_Documento;
        this.Expedicion = Expedicion;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Genero = Genero;
        this.Nacimiento = Nacimiento;
        this.Direccion = Direccion;
        this.Barrio = Barrio;
        this.Celular = Celular;
        this.Fijo = Fijo;
        this.Correo = Correo;
        this.Ocupacion = Ocupacion;
        this.Rol = Rol;
        this.Foto = Foto;
    }

    public GS_Ciudadano(String Documento, String Direccion, String Barrio, String Celular, String Fijo, String Correo, String Ocupacion, String Foto) {
        this.Documento = Documento;
        this.Direccion = Direccion;
        this.Barrio = Barrio;
        this.Celular = Celular;
        this.Fijo = Fijo;
        this.Correo = Correo;
        this.Ocupacion = Ocupacion;
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

    public String getExpedicion() {
        return Expedicion;
    }

    public void setExpedicion(String Expedicion) {
        this.Expedicion = Expedicion;
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

    public String getBarrio() {
        return Barrio;
    }

    public void setBarrio(String Barrio) {
        this.Barrio = Barrio;
    }

    public String getCelular() {
        return Celular;
    }

    public void setCelular(String Celular) {
        this.Celular = Celular;
    }

    public String getFijo() {
        return Fijo;
    }

    public void setFijo(String Fijo) {
        this.Fijo = Fijo;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getOcupacion() {
        return Ocupacion;
    }

    public void setOcupacion(String Ocupacion) {
        this.Ocupacion = Ocupacion;
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
