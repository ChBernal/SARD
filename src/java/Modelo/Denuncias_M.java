package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

public class Denuncias_M {
    Conexion conexion = new Conexion();
    Connection cnn = conexion.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void InsertarDenuncias (GS_Denuncias GSD){
        try {
            ps= cnn.prepareStatement("Call In_Denuncia(?,?,?,?)");
            ps.setString(1, GSD.getDireccion());
            ps.setString(2, GSD.getDescripcion());
            ps.setString(3, GSD.getEvidencia());
            ps.setString(4, GSD.getCorreo());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Sus datos fueron ingresados");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la denuncia"+e);
        }
    }
}
