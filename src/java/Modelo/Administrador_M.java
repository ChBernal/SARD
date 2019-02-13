
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;


public class Administrador_M {

    Conexion Conex=new Conexion();
    Connection BaseDatos= Conex.Conectando();
    PreparedStatement PreSta=null;
    ResultSet Reset=null;
    
    public ArrayList<GS_Administrador> Uno_Admin (String ID){
        ArrayList<GS_Administrador> Tabla=new ArrayList<>();
        
       
        try {
            PreSta= BaseDatos.prepareStatement("call Uno_Admin (?)");
            PreSta.setString(1, ID);
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Administrador ing=new GS_Administrador(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getString(10));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Admin");
        }
        return Tabla;
    }
    
     public ArrayList<GS_Administrador> Tabla_Admin (GS_Administrador GS){
        ArrayList<GS_Administrador> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("call Todo_Admin (?)");
            PreSta.setString(1, GS.getDocumento());
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                 GS_Administrador ing=new GS_Administrador(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getInt(10),Reset.getString(11));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Admin");
        }
        return Tabla;
    }
     
     public ArrayList<GS_Administrador> Filtro_Admin(String dato){
        ArrayList<GS_Administrador> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("select Documento, Tipo_Documento,Nombre,Apellido,Genero,Fecha_Nacimiento,Direccion,Telefono,Correo,Foto from Administrador where Documento like '%"+dato+"%' || Tipo_Documento like  '%"+dato+"%' || Nombre like '%"+dato+"%' || Apellido like '%"+dato+"%' || Correo like '%"+dato+"%'");
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Administrador ing=new GS_Administrador(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getString(10));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e);
        }
        return Tabla;
    }
    
    public void In_Administrador (GS_Administrador GS){
        try{
            PreSta=BaseDatos.prepareStatement("call In_Admin (?,?,?,?,?,?,?,?,?,?)");
            PreSta.setString(1, GS.getDocumento());
            PreSta.setString(2, GS.getTipo_Documento());
            PreSta.setString(3, GS.getNombre());
            PreSta.setString(4, GS.getApellido());
            PreSta.setString(5, GS.getGenero());
            PreSta.setString(6, GS.getFecha_Nacimiento());
            PreSta.setString(7, GS.getDireccion());
            PreSta.setString(8, GS.getTelefono());
            PreSta.setString(9, GS.getCorreo());
            PreSta.setString(10, GS.getFoto());
            PreSta.executeUpdate();
            JOptionPane.showMessageDialog(null,"DATOS INGRESADOS");
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
    }
    }
    
     public int Act_Administrador (GS_Administrador GS){
         int Actualizar=0;
        try{
            PreSta=BaseDatos.prepareStatement("call A_Admin(?,?,?,?,?)");
            PreSta.setString(1, GS.getDocumento());
            PreSta.setString(2, GS.getDireccion());
            PreSta.setString(3, GS.getTelefono());
            PreSta.setString(4, GS.getCorreo());
            PreSta.setString(5, GS.getFoto());
            Actualizar=PreSta.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
    }
        return Actualizar;
    }
     
     public void Eli_Administrador(GS_Administrador GS){
        try{
            PreSta=BaseDatos.prepareStatement("call B_Administrador(?)");
            PreSta.setString(1,GS.getDocumento());
            PreSta.executeUpdate();
            JOptionPane.showMessageDialog(null, "Datos Borrados");
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
    
   
     public void Login_Admin (GS_Administrador GS){
        try{
            PreSta=BaseDatos.prepareStatement("call In_Login(?,?,?)");
            PreSta.setString(1, GS.getDocumento());
            PreSta.setString(2, GS.getDocumento());
            PreSta.setInt(3, 1);
            PreSta.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
    }
    }
    
}
