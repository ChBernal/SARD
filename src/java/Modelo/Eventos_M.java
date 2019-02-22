package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Eventos_M {
    Conexion conexion = new Conexion();
    Connection cnn = conexion.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<GS_Eventos> Tres_Eventos (){
        ArrayList<GS_Eventos> Tres_Eventos = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("Call Tres_Eventos()");
            rs = ps.executeQuery();
            while (rs.next()){
                GS_Eventos GSM = new GS_Eventos(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
                Tres_Eventos.add(GSM);
            }
        } catch (Exception e) {
        }
        return Tres_Eventos;
    }
    
    public void In_Eventos (GS_Eventos GSE){
        try {
            ps = cnn.prepareStatement("Call In_Eventos(?,?,?,?,?)");
            ps.setString(1, GSE.getNombre());
            ps.setString(2, GSE.getTipoEvento());
            ps.setString(3, GSE.getFecha());
            ps.setString(4, GSE.getDescripcion());
            ps.setString(5, GSE.getImagen());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Evento creado correctamente");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Erro al crear el evento \n"+e);
        }
    }
            
}
