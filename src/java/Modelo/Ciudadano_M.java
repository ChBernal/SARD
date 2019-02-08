package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Ciudadano_M {
    Conexion Conex = new Conexion();
    Connection BaseDatos = Conex.Conectando();
    PreparedStatement PreSta = null;
    ResultSet Reset = null;
    
    public ArrayList<GS_Ciudadano> Uno_Ciudadano (GS_Ciudadano GSC){
        ArrayList<GS_Ciudadano> Uno_Ciudadano = new ArrayList<>();
        try {
            PreSta = BaseDatos.prepareStatement("Call Uno_Cliente(?)");
            PreSta.setString(1, GSC.getDocumento());
            Reset = PreSta.executeQuery();
            while (Reset.next()){
                GS_Ciudadano GSCi = new GS_Ciudadano(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getString(10), Reset.getString(11), Reset.getString(12), Reset.getString(13), Reset.getString(14));
                Uno_Ciudadano.add(GSCi);
            }
        } catch (Exception e) {
        }
        
        return Uno_Ciudadano;
    }
    public ArrayList<GS_Ciudadano> Todo_Cliente() {
        ArrayList<GS_Ciudadano> Todo_Cliente = new ArrayList<>();
        try {
            PreSta = BaseDatos.prepareStatement("call Todo_Cliente()");
            Reset = PreSta.executeQuery();
            while (Reset.next()){
                GS_Ciudadano GSCi = new GS_Ciudadano(Reset.getString(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getString(10), Reset.getString(11), Reset.getString(12), Reset.getString(13), Reset.getString(14));
                Todo_Cliente.add(GSCi);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return Todo_Cliente;
    }
    
    public int Actualizar_Ciudadano (GS_Ciudadano GS){
         int Actualizar=0;
        try{
            PreSta=BaseDatos.prepareStatement("call A_Cliente(?,?,?,?,?,?,?,?)");
            PreSta.setString(1, GS.getDocumento());
            PreSta.setString(2, GS.getDireccion());
            PreSta.setString(3, GS.getBarrio());
            PreSta.setString(4, GS.getCelular());
            PreSta.setString(5, GS.getFijo());
            PreSta.setString(6, GS.getCorreo());
            PreSta.setString(7, GS.getOcupacion());
            PreSta.setString(8, GS.getFoto());
            Actualizar=PreSta.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
    }
        return Actualizar;
    }
    
}
