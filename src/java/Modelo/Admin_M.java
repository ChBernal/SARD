package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Admin_M {
    Conexion conexion = new Conexion();
    Connection cnn = conexion.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<GS_Admin> Uno_Admin (GS_Admin GSA){
        ArrayList<GS_Admin> Uno_Admin = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("Call Uno_Admin(?)");
            ps.setString(1, GSA.getDocumento());
            rs = ps.executeQuery();
            while (rs.next()){
                GS_Admin GSAd = new GS_Admin(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
                Uno_Admin.add(GSAd);
            }
        } catch (Exception e) {
        }
        
        return Uno_Admin;
    }    
}
