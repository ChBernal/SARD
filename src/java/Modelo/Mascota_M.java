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
    
    public ArrayList<GS_Mascota> Uno_Mascota (GS_Mascota GSM){
        ArrayList<GS_Mascota> Tabla=new ArrayList<>();
        try {
            ps= cnn.prepareStatement("call Uno_Mascota(?)");
            ps.setInt(1, GSM.getDocumento());
            rs= ps.executeQuery();
            int zz=GSM.getDocumento();
              JOptionPane.showMessageDialog(null, "Documento "+zz);
            while (rs.next()) {  
                JOptionPane.showMessageDialog(null, "Entra While");
                GS_Mascota ing=new GS_Mascota(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Uno Cliente");
        }
        return Tabla;
    }
    public ArrayList<GS_Mascota> Mascota_Cliente (String Docu){
        ArrayList<GS_Mascota> Tabla=new ArrayList<>();
        try {
            ps= cnn.prepareStatement("call Mascota_Cliente(?)");
            ps.setString(1, Docu);
            rs= ps.executeQuery();
            
            while (rs.next()) {   
                GS_Mascota ing=new GS_Mascota(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Mascota Cliente");
        }
        return Tabla;
    }
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
    
    public void In_Mascota (GS_Mascota GSM){
        try {
            ps = cnn.prepareStatement("call In_Mascota(?,?,?,?,?,?,?)");
            ps.setString(1, GSM.getTipo_Mascota());
            ps.setString(2, GSM.getNombre());
            ps.setString(3, GSM.getFecha_Nacimiento());
            ps.setString(4, GSM.getColor());
            ps.setString(5, GSM.getRaza());
            ps.setString(6, GSM.getGenero());
            ps.setString(7, GSM.getFoto());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null,"Datos Ingresados Correctamente");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e);
        }
    }
    
    public int Ac_Mascota (GS_Mascota GSM){
        int Actualizar=0;
        try {
            ps = cnn.prepareStatement("call A_Mascota(?,?,?,?,?,?,?,?)");
            ps.setInt(1, GSM.getDocumento());
            ps.setString(2, GSM.getTipo_Mascota());
            ps.setString(3, GSM.getNombre());
            ps.setString(4, GSM.getFecha_Nacimiento());
            ps.setString(5, GSM.getColor());
            ps.setString(6, GSM.getRaza());
            ps.setString(7, GSM.getGenero());
            ps.setString(8, GSM.getFoto());
            Actualizar= ps.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e);
        }
        return Actualizar;
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
    public int Ultima_Mascota(GS_Mascota GS_M) {
        int Codigo_Mascota =0;
        try {
            ps = cnn.prepareStatement("Call Ultima_Mascota (?,?,?)");
            ps.setString(1,GS_M.getNombre());
            ps.setString(2,GS_M.getRaza());
            ps.setString(3,GS_M.getFecha_Nacimiento());
            JOptionPane.showMessageDialog(null, GS_M.getRaza());
            rs = ps.executeQuery();
            while(rs.next()){
                Codigo_Mascota = rs.getInt(1);
            }
            
        } catch (Exception e) {
        }
        return Codigo_Mascota;
    }
    public int Existente (GS_Existente GSM){
        int Existe=0;
        try {
            ps = cnn.prepareStatement("call Existente(?,?,?,?)");
            ps.setString(1, GSM.getNombre());
            ps.setString(2, GSM.getDocumento());
            ps.setString(3, GSM.getFecha_Nacimiento());
            ps.setString(4, GSM.getTipo_Mascota());
            Existe=ps.executeUpdate(); 
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e);
        }
        return Existe;
    }
    public int Registro_Estado (GS_Estado_Mascota GS_EM){
        int Existe=0;
        try {
            ps = cnn.prepareStatement("call In_RegEstado(?,?,?)");
            ps.setInt(1, GS_EM.getEstado());
            ps.setInt(2, GS_EM.getCod_Mascota());
            ps.setString(3, GS_EM.getDoc_Dueño());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null,"Registro Exitoso");
            Existe=1;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e);
        }
        return Existe;
    }
}
