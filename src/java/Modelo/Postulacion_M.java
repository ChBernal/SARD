
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;


public class Postulacion_M {

    Conexion Conex= new Conexion();
    Connection BaseDatos= Conex.Conectando();
    PreparedStatement PreSta=null;
    ResultSet Reset=null;
    
    public void InsertarPostulacion (GS_Preguntas_Postulacion GSD){
        try {
            PreSta= BaseDatos.prepareStatement("Call In_Encuesta(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            PreSta.setString(1, GSD.getR1());
            PreSta.setString(2, GSD.getR2());
            PreSta.setString(3, GSD.getR3());
            PreSta.setString(4, GSD.getR4());
            PreSta.setString(5, GSD.getR5());
            PreSta.setString(6, GSD.getR6());
            PreSta.setString(7, GSD.getR7());
            PreSta.setString(8, GSD.getR8());
            PreSta.setString(9, GSD.getR9());
            PreSta.setString(10, GSD.getR10());
            PreSta.setString(11, GSD.getR11());
            PreSta.setString(12, GSD.getR12());
            PreSta.setString(13, GSD.getR13());
            PreSta.setString(14, GSD.getR14());
            PreSta.setString(15, GSD.getR15());
            PreSta.setString(16, GSD.getR16());
            PreSta.setString(17, GSD.getR17());
            PreSta.setString(18, GSD.getR18());
            PreSta.setString(19, GSD.getR19());
            PreSta.setString(20, GSD.getR20());
            PreSta.setString(21, GSD.getDocu());
            PreSta.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la denuncia"+e);
        }
    }
    
    public void InsertarEstadisticas (GS_Estadistacas GSD){
        try {
            PreSta= BaseDatos.prepareStatement("Call In_Estadisticas(?,?)");
            PreSta.setInt(1, GSD.getEncuesta());
            PreSta.setString(2, GSD.getDocumento());
            PreSta.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la denuncia"+e);
        }
    }
    
    public int InsertarPostulacionFinal (GS_Postulacion GSD){
        int x=0;
        try {
            PreSta= BaseDatos.prepareStatement("Call In_Postulacion(?,?,?,?,?)");
            PreSta.setString(1, GSD.getDocumentoC());
            PreSta.setInt(2, GSD.getCodigoMascota());
            PreSta.setString(3, GSD.getCedula());
            PreSta.setString(4, GSD.getRecibo());
            PreSta.setInt(5, GSD.getEstado());
            PreSta.executeUpdate();
            x=1;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la denuncia"+e);
        }
        return x;
    }
    
    public ArrayList<GS_Postulacion> VerPostulaciones (){
        ArrayList<GS_Postulacion> Datos_Postulacion = new ArrayList<>();
        try {
            JOptionPane.showMessageDialog(null, "Enttra al try");
            PreSta = BaseDatos.prepareStatement("Call Postulaciones()");
            Reset = PreSta.executeQuery();
            
            while (Reset.next()){
                JOptionPane.showMessageDialog(null, "entra al while");
                GS_Postulacion GS_P=new GS_Postulacion(Reset.getInt(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6), Reset.getString(7), Reset.getString(8), Reset.getString(9), Reset.getString(10), Reset.getString(11), Reset.getString(12), Reset.getString(13), Reset.getInt(14));
                JOptionPane.showMessageDialog(null, "LLENA GS");
                Datos_Postulacion.add(GS_P);
                JOptionPane.showMessageDialog(null, "llena arreglo");
            }
        }
        catch (Exception e){
            
        }
        return Datos_Postulacion;
    }
    
    public ArrayList<GS_Preguntas_Postulacion> Uno_Preguntas (GS_Preguntas_Postulacion GSC){
        ArrayList<GS_Preguntas_Postulacion> Uno_Preguta = new ArrayList<>();
        try {
            PreSta = BaseDatos.prepareStatement("Call Uno_Respuesta(?)");
            PreSta.setString(1, GSC.getDocu());
            Reset = PreSta.executeQuery();
            while (Reset.next()){
                GS_Preguntas_Postulacion GSCi = new GS_Preguntas_Postulacion(Reset.getString(1));
                Uno_Preguta.add(GSCi);
            }
        } catch (Exception e) {   
        }
        return Uno_Preguta;
    }
	
}
