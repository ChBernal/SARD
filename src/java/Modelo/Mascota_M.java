package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Mascota_M {
    Conexion conexion = new Conexion();
    Connection cnn = conexion.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<GS_Mascota> Todo_Mascota() {
        ArrayList<GS_Mascota> Todo_Mascota = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("Call Todo_Mascota()");
            rs = ps.executeQuery();
            while (rs.next()){
                GS_Mascota GSM = new GS_Mascota(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                Todo_Mascota.add(GSM);
            }
        } catch (Exception e) {
        }
        return Todo_Mascota;
    }
    
    public ArrayList<GS_Mascota> Mascota_Disponible() {
        ArrayList<GS_Mascota> Todo_Mascota = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("Call Mas_Disponibles()");
            rs = ps.executeQuery();
            while (rs.next()){
                GS_Mascota GSM = new GS_Mascota(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                Todo_Mascota.add(GSM);
            }
        } catch (Exception e) {
        }
        return Todo_Mascota;
    }
}
