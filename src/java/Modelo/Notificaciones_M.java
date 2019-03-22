package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Notificaciones_M {
    Conexion Con = new Conexion();
    Connection Cnn = Con.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public int CantidadTotalA (){
        int Cantidad = 0;
        
        try {
            ps= Cnn.prepareStatement("call CantidadNotificaciones()");
            rs= ps.executeQuery();
            
            while (rs.next()) {   
                rs.getInt(1);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Todo Denuncia");
        }
        return Cantidad;
    }
    
    public int DenunciasA (){
        int Cantidad = 0;
        
        try {
            ps= Cnn.prepareStatement("call ContarAnonimas()");
            rs= ps.executeQuery();
            
            while (rs.next()) {   
                rs.getInt(1);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Todo Denuncia");
        }
        return Cantidad;
    }
    
    public int DenunciasC (){
        int Cantidad = 0;
        
        try {
            ps= Cnn.prepareStatement("call ContarCiudadano()");
            rs= ps.executeQuery();
            
            while (rs.next()) {   
                rs.getInt(1);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Todo Denuncia");
        }
        return Cantidad;
    }
    
    public int Postulaciones (){
        int Cantidad = 0;
        
        try {
            ps= Cnn.prepareStatement("call ContarPostulacion()");
            rs= ps.executeQuery();
            
            while (rs.next()) {   
                rs.getInt(1);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Todo Denuncia");
        }
        return Cantidad;
    }
    
}
