package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Login_M {
    Conexion conexion = new Conexion();
    Connection cnn = conexion.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    private int Rol;
    
    public int Rol (GS_Login GSL){
        try {
            ps = cnn.prepareStatement("Call C_Usu_Clav (?,?)");
            ps.setString(1, GSL.getUsuario());
            ps.setString(2, GSL.getClave());
            rs = ps.executeQuery();
            while (rs.next()){
                GS_Login GSLo = new GS_Login(rs.getString(1), rs.getString(2), rs.getInt(3));
                Rol = rs.getInt(3);
            }
        } catch (Exception e) {
        }
        return Rol;
    }
    public ArrayList<GS_Login> Uno_Usuario (String ID){
        ArrayList<GS_Login> Usuario=new ArrayList<>();
        
        try {
            ps = cnn.prepareStatement("Call Datos_Login(?)");
            ps.setString(1, ID);
            rs = ps.executeQuery();
            while (rs.next()){
                GS_Login Gsl = new GS_Login(rs.getString(1), rs.getString(2), rs.getInt(3));
                Usuario.add(Gsl);
            }
        } catch (Exception e) {
        }
        
        return Usuario;
    }
    public int Actualizar_Contraseña(GS_Login GS){
         int Actualizar=0;
        try{
            ps=cnn.prepareStatement("call A_Login(?,?)");
            ps.setString(1, GS.getUsuario());
            ps.setString(2, GS.getClave());
            Actualizar=ps.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
    }
        return Actualizar;
    }
    
        public void Login_Cliente (GS_Ciudadano GS){
        try{
            ps=cnn.prepareStatement("call In_Login(?,?,?)");
            ps.setString(1, GS.getDocumento());
            ps.setString(2, GS.getDocumento());
            ps.setInt(3, 5);
            ps.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
}
