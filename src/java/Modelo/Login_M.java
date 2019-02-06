package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
