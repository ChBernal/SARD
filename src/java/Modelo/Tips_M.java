package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Tips_M {
    Conexion conexion = new Conexion();
    Connection cnn = conexion.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<GS_Tips> Todo_Tips (){
        ArrayList<GS_Tips> Todo_Tips = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("Call Todo_Tips()");
            rs = ps.executeQuery();
            while (rs.next()){
                GS_Tips GSM = new GS_Tips(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
                Todo_Tips.add(GSM);
            }
        } catch (Exception e) {
        }
        return Todo_Tips;
    }
    
    public void In_Tips (GS_Tips GS_Tips){
        try {
            ps = cnn.prepareStatement("Call In_Tips(?,?,?)");
            ps.setString(1, GS_Tips.getTitulo());
            ps.setString(2, GS_Tips.getImagen());
            ps.setString(3, GS_Tips.getDescripcion());
            ps.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Erro al crear el Tip \n"+e);
        }
    }
    
}
