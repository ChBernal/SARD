package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
                GS_Tips GSM = new GS_Tips(rs.getInt(1),rs.getString(2),rs.getString(3));
                Todo_Tips.add(GSM);
            }
        } catch (Exception e) {
        }
        return Todo_Tips;
    }
    
}
