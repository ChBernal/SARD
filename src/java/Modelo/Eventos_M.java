package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Eventos_M {
    Conexion conexion = new Conexion();
    Connection cnn = conexion.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<GS_Eventos> Todo_Eventos (){
        ArrayList<GS_Eventos> Todo_Eventos = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("Call Todo_Eventos()");
            rs = ps.executeQuery();
            while (rs.next()){
                GS_Eventos GSM = new GS_Eventos(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
                Todo_Eventos.add(GSM);
            }
        } catch (Exception e) {
        }
        return Todo_Eventos;
    }
            
}
