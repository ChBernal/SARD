
package Modelo;

public class GS_Veterinaria {
    
    private String Nit;
    private String Nombre;
    private String Representante;
    private String Tipo_Veterinaria;
    private String Fecha_Fundacion;
    private String Direccion;
    private String Barrio;
    private String Telefono;
    private String Correo;
    private int Rol;
    private String Foto;

    public GS_Veterinaria(String Nit, String Nombre, String Representante, String Tipo_Veterinaria, String Fecha_Fundacion, String Direccion, String Barrio, String Telefono, String Correo, int Rol, String Foto) {
        this.Nit = Nit;
        this.Nombre = Nombre;
        this.Representante = Representante;
        this.Tipo_Veterinaria = Tipo_Veterinaria;
        this.Fecha_Fundacion = Fecha_Fundacion;
        this.Direccion = Direccion;
        this.Barrio = Barrio;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Rol = Rol;
        this.Foto = Foto;
    }

    public GS_Veterinaria(String Nit, String Nombre, String Representante, String Tipo_Veterinaria, String Fecha_Fundacion, String Direccion, String Barrio, String Telefono, String Correo, String Foto) {
        this.Nit = Nit;
        this.Nombre = Nombre;
        this.Representante = Representante;
        this.Tipo_Veterinaria = Tipo_Veterinaria;
        this.Fecha_Fundacion = Fecha_Fundacion;
        this.Direccion = Direccion;
        this.Barrio = Barrio;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Foto = Foto;
    }

    public GS_Veterinaria(String Nit, String Nombre, String Representante, String Direccion, String Barrio, String Telefono, String Correo, String Foto) {
        this.Nit = Nit;
        this.Nombre = Nombre;
        this.Representante = Representante;
        this.Direccion = Direccion;
        this.Barrio = Barrio;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Foto = Foto;
    }

    public GS_Veterinaria(String Nit) {
        this.Nit = Nit;
    }
    

    public GS_Veterinaria() {
    }

    public String getNit() {
        return Nit;
    }

    public void setNit(String Nit) {
        this.Nit = Nit;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getRepresentante() {
        return Representante;
    }

    public void setRepresentante(String Representante) {
        this.Representante = Representante;
    }

    public String getTipo_Veterinaria() {
        return Tipo_Veterinaria;
    }

    public void setTipo_Veterinaria(String Tipo_Veterinaria) {
        this.Tipo_Veterinaria = Tipo_Veterinaria;
    }

    public String getFecha_Fundacion() {
        return Fecha_Fundacion;
    }

    public void setFecha_Fundacion(String Fecha_Fundacion) {
        this.Fecha_Fundacion = Fecha_Fundacion;
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
