package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Ciudadano_M {
    Conexion conexion = new Conexion();
    Connection cnn = conexion.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<GS_Ciudadano> Uno_Ciudadano (GS_Ciudadano GSC){
        ArrayList<GS_Ciudadano> Uno_Ciudadano = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("Call Uno_Cliente(?)");
            ps.setString(1, GSC.getDocumento());
            rs = ps.executeQuery();
            while (rs.next()){
                GS_Ciudadano GSCi = new GS_Ciudadano(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
                Uno_Ciudadano.add(GSCi);
            }
        } catch (Exception e) {
        }
        
        return Uno_Ciudadano;
    }
}
