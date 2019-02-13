
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;


public class Ambiente_Salud_M {
    Conexion Conex=new Conexion();
    Connection BaseDatos= Conex.Conectando();
    PreparedStatement PreSta=null;
    ResultSet Reset=null;
    
    public void In_Ambiente_Salud (GS_Ambiente_Salud GS){
        try{
            PreSta=BaseDatos.prepareStatement("call In_Cliente_Admin(?,?,?,?,?,?,?,?,?,?,?)");
            PreSta.setString(1, GS.getDocumento());
            PreSta.setString(2, GS.getTipo_Documento());
            PreSta.setString(3, GS.getNombre());
            PreSta.setString(4, GS.getApellido());
            PreSta.setString(5, GS.getGenero());
            PreSta.setString(6, GS.getFecha_Nacimiento());
            PreSta.setString(7, GS.getDireccion());
            PreSta.setString(8, GS.getTelefono());
            PreSta.setString(9, GS.getCorreo());
            PreSta.setInt(10, GS.getRol());
            PreSta.setString(11, GS.getFoto());
            
            PreSta.executeUpdate();
            JOptionPane.showMessageDialog(null,"DATOS INGRESADOS");
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
    
     public int Act_Ambiente_Salud (GS_Ambiente_Salud GS){
         int Actualizar=0;
        try{
            PreSta=BaseDatos.prepareStatement("call A_Cliente_Admin (?,?,?,?,?)");
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
   
     public void Eli_Ambiente_Salud(GS_Ambiente_Salud GS){
        try{
            PreSta=BaseDatos.prepareStatement(" call B_Ambiente_Salud (?)");
            PreSta.setString(1,GS.getDocumento());
            PreSta.executeUpdate();
            JOptionPane.showMessageDialog(null, "Datos Borrados");
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
    
    
    public ArrayList<GS_Ambiente_Salud> Uno_Salud (String ID){
        ArrayList<GS_Ambiente_Salud> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("call Uno_Salud (?)");
            PreSta.setString(1, ID);
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Ambiente_Salud ing=new GS_Ambiente_Salud(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getString(10));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Salud");
        }
        return Tabla;
    }
    public ArrayList<GS_Ambiente_Salud> Todo_Salud (){
        ArrayList<GS_Ambiente_Salud> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("call Todo_Salud ()");
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Ambiente_Salud ing=new GS_Ambiente_Salud(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getString(10));
                Tabla.add(ing);
            }  
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Salud");
        }
        return Tabla;
    }
    
     public ArrayList<GS_Ambiente_Salud> Todo_Ambiente (){
        ArrayList<GS_Ambiente_Salud> Tabla=new ArrayList<>();
        try {
            PreSta= BaseDatos.prepareStatement("call Todo_Ambiente ()");
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Ambiente_Salud ing=new GS_Ambiente_Salud(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getString(10));
                Tabla.add(ing);
            }  
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Salud");
        }
        return Tabla;
    }
    public ArrayList<GS_Ambiente_Salud> Uno_Ambiente (String ID){
        ArrayList<GS_Ambiente_Salud> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("call Uno_Ambiente (?)");
            PreSta.setString(1, ID);
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Ambiente_Salud ing=new GS_Ambiente_Salud(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getString(10));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Ambiente");
        }
        return Tabla;
    }
    
    
      public void Login_Ambiente (GS_Ambiente_Salud GS){
        try{
            PreSta=BaseDatos.prepareStatement("call In_Login(?,?,?)");
            PreSta.setString(1, GS.getDocumento());
            PreSta.setString(2, GS.getDocumento());
            PreSta.setInt(3, 2);
            PreSta.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
      
      
      public void Login_Salud (GS_Ambiente_Salud GS){
        try{
            PreSta=BaseDatos.prepareStatement("call In_Login(?,?,?)");
            PreSta.setString(1, GS.getDocumento());
            PreSta.setString(2, GS.getDocumento());
            PreSta.setInt(3, 3);
            PreSta.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
}
