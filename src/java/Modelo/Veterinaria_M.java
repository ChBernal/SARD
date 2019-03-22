
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;


public class Veterinaria_M {

    Conexion Conex = new Conexion();
    Connection BaseDatos = Conex.Conectando();
    PreparedStatement PreSta = null;
    ResultSet Reset = null;
    
    public ArrayList<GS_Veterinaria> Uno_Veterinaria (String ID){
        ArrayList<GS_Veterinaria> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("call Uno_Veterinaria (?)");
            PreSta.setString(1, ID);
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Veterinaria ing=new GS_Veterinaria(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8),Reset.getString(9),Reset.getString(10));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Veterinaria");
        }
        return Tabla;
    }
    
    public ArrayList<GS_Veterinaria> Todo_cero (){
        ArrayList<GS_Veterinaria> Tabla=new ArrayList<>();
        try {
            PreSta= BaseDatos.prepareStatement("call Todo_Veterinaria_cero ()");
            Reset= PreSta.executeQuery();
            while (Reset.next()) {   
                GS_Veterinaria ing=new GS_Veterinaria(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8),Reset.getString(9),Reset.getInt(10), Reset.getString(11));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Veterinaria");
        }
        return Tabla;
    }
    
     public ArrayList<GS_Veterinaria> Todo_cuatro (){
        ArrayList<GS_Veterinaria> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("call Todo_Veterinaria_cuatro ()");
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Veterinaria ing=new GS_Veterinaria(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8),Reset.getString(9), Reset.getInt(10), Reset.getString(11));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Veterinaria");
        }
        return Tabla;
    }
    
     public void In_Veterinaria_Admin(GS_Veterinaria GS){
        try{
            PreSta=BaseDatos.prepareStatement("call In_Veterinaria_Admin (?,?,?,?,?,?,?,?,?,?,?)");
            PreSta.setString(1, GS.getNit());
            PreSta.setString(2, GS.getNombre());
            PreSta.setString(3, GS.getRepresentante());
            PreSta.setString(4, GS.getTipo_Veterinaria());
            PreSta.setString(5, GS.getFecha_Fundacion());
            PreSta.setString(6, GS.getDireccion());
            PreSta.setString(7, GS.getBarrio());
            PreSta.setString(8, GS.getTelefono());
            PreSta.setString(9, GS.getCorreo());
            PreSta.setInt(10, GS.getRol());
            PreSta.setString(11, GS.getFoto());
            PreSta.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
    }
    }
    
      public int In_Veterinaria_Inactivas (GS_Veterinaria GS){
         int Actualizar =0;
            try{
                PreSta=BaseDatos.prepareStatement("call In_Veterinaria_Inactiva (?,?,?,?,?,?,?,?,?,?)");
                PreSta.setString(1, GS.getNit());   
                PreSta.setString(2, GS.getNombre());
                PreSta.setString(3, GS.getRepresentante());
                PreSta.setString(4, GS.getTipo_Veterinaria());
                PreSta.setString(5, GS.getFecha_Fundacion());
                PreSta.setString(6, GS.getDireccion());
                PreSta.setString(7, GS.getBarrio());
                PreSta.setString(8, GS.getTelefono());
                PreSta.setString(9, GS.getCorreo());
                PreSta.setString(10, GS.getFoto());
                Actualizar=PreSta.executeUpdate();
            }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
        return Actualizar;
    }
     
     public int Act_Veterinaria_Activas (GS_Veterinaria GS){
         int Actualizar =0;
            try{
                PreSta=BaseDatos.prepareStatement("call A_Veterinaria_4 (?,?,?,?,?,?,?,?)");
                PreSta.setString(1, GS.getNit());   
                PreSta.setString(2, GS.getNombre());
                PreSta.setString(3, GS.getRepresentante());
                PreSta.setString(4, GS.getDireccion());
                PreSta.setString(5, GS.getBarrio());
                PreSta.setString(6, GS.getTelefono());
                PreSta.setString(7, GS.getCorreo());
                PreSta.setString(8, GS.getFoto());
                Actualizar=PreSta.executeUpdate();
            }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
        return Actualizar;
    }
     
      public int Act_Veterinaria_Inactivas (GS_Veterinaria GS){
         int Actualizar =0;
            try{
                PreSta=BaseDatos.prepareStatement("call A_Veterinaria_0 (?,?,?,?,?,?,?,?,?)");
                PreSta.setString(1, GS.getNit());   
                PreSta.setString(2, GS.getNombre());
                PreSta.setString(3, GS.getRepresentante());
                PreSta.setString(4, GS.getDireccion());
                PreSta.setString(5, GS.getBarrio());
                PreSta.setString(6, GS.getTelefono());
                PreSta.setString(7, GS.getCorreo());
                PreSta.setInt(8, GS.getRol());
                PreSta.setString(9, GS.getFoto());
                Actualizar=PreSta.executeUpdate();
            }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
        return Actualizar;
    }
     
     
    
     
     public void Eli_Veterinaria(GS_Veterinaria GS){
        try{
            PreSta=BaseDatos.prepareStatement("call B_Veterinaria(?)");
            PreSta.setString(1,GS.getNit());
            PreSta.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
    
    
}
