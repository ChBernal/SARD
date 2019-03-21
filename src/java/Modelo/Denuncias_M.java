package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Denuncias_M {
     Conexion Conex= new Conexion();
    Connection BaseDatos= Conex.Conectando();
    PreparedStatement PreSta=null;
    ResultSet Reset=null;
    
    //Insertar Denuncias
    
    public int InsertarDenuncias (GS_Denuncias GSD){
        int x=0;
        try {
            PreSta= BaseDatos.prepareStatement("Call In_Denuncia(?,?,?,?)");
            PreSta.setString(1, GSD.getDireccion());
            PreSta.setString(2, GSD.getDescripcion());
            PreSta.setString(3, GSD.getEvidencia());
            PreSta.setString(4, GSD.getCorreo());
            PreSta.executeUpdate();
            x=1;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la denuncia"+e);
        }
        return x;
    }
    
     public void InsertarDenunciasC(GS_Denuncia_Cliente GD){
        
        try {
            PreSta= BaseDatos.prepareStatement("call In_DenunciaC(?,?,?,?)");
            PreSta.setString(1, GD.getDireccion());
            PreSta.setString(2, GD.getDescripcion());
            PreSta.setString(3, GD.getEvidencia());
            PreSta.setString(4, GD.getDocumento());
            PreSta.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error Denuncias cliente"+e);
        }
    }
     
    //Finaliza Insercion
     
    //Ver Denuncias Nuevas
    
    public ArrayList<GS_Denuncias> Inicial_Denuncias (){
        ArrayList<GS_Denuncias> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("call Inicial_Denuncias()");
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Denuncias ing=new GS_Denuncias(Reset.getInt(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Todo Denuncia");
        }
        return Tabla;
    }
    
    public ArrayList<GS_Denuncia_Cliente> Inicial_DenunciasC (){
        ArrayList<GS_Denuncia_Cliente> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("call Inicial_DenunciaC()");
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Denuncia_Cliente ing=new GS_Denuncia_Cliente(Reset.getInt(1), Reset.getString(2), Reset.getString(3), Reset.getString(4), Reset.getString(5), Reset.getString(6));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Todo Denuncia");
        }
        return Tabla;
    }
    
    //Finaliza Ver Denuncias  Nuevas


    //Respuestas de Denuncias
    
    public void Respuesta_PreCont_Anonima (GS_Respuesta GS_R){
        
        try {
            PreSta= BaseDatos.prepareStatement("call RespuestaA(?,?)");
            PreSta.setString(1, GS_R.getDescripcion());
            PreSta.setInt(2, GS_R.getCod_Denuncia());
            PreSta.executeUpdate();
            int codigo = GS_R.getCod_Denuncia();
            String x = ActualizarEstadoDenuncia(2,codigo);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+"Error al enviar denuncia");
        }
    }
    
    public void Respuesta_Finalizar_Anonima (GS_Respuesta GS_R){
        
        try {
            PreSta= BaseDatos.prepareStatement("call RespuestaA(?,?)");
            PreSta.setString(1, GS_R.getDescripcion());
            PreSta.setInt(2, GS_R.getCod_Denuncia());
            PreSta.executeUpdate();
            int codigo = GS_R.getCod_Denuncia();
            String x = ActualizarEstadoDenuncia(3,codigo);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+"Error al enviar denuncia");
        }
    }
    
    public void Respuesta_PreCont_Ciudadano (GS_Respuesta GS_R){
        
        try {
            PreSta= BaseDatos.prepareStatement("call RespuestaC(?,?)");
            PreSta.setString(1, GS_R.getDescripcion());
            PreSta.setInt(2, GS_R.getCod_Denuncia());
            PreSta.executeUpdate();
            int codigo = GS_R.getCod_Denuncia();
            String x = ActualizarEstadoDenunciaC(2,codigo);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+"Error al enviar denuncia");
        }
    }
    
    public void Respuesta_Finalizar_Ciudadano (GS_Respuesta GS_R){
        
        try {
            PreSta= BaseDatos.prepareStatement("call RespuestaC(?,?)");
            PreSta.setString(1, GS_R.getDescripcion());
            PreSta.setInt(2, GS_R.getCod_Denuncia());
            PreSta.executeUpdate();
            int codigo = GS_R.getCod_Denuncia();
            String x = ActualizarEstadoDenunciaC(3,codigo);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+"Error al enviar denuncia");
        }
    }
    
    public String ActualizarEstadoDenuncia (int Estado,int Codigo){
        String x="";
        try {
            PreSta = BaseDatos.prepareStatement("Call EstadoDenunciaA(?,?)");
            PreSta.setInt(1, Estado);
            PreSta.setInt(2, Codigo);
            PreSta.executeUpdate();
            x = ".";
        } catch (Exception e) {
            
        }
        return x;
    }
    
    public String ActualizarEstadoDenunciaC (int Estado,int Codigo){
        String x="";
        try {
            PreSta = BaseDatos.prepareStatement("Call EstadoDenunciaC(?,?)");
            PreSta.setInt(1, Estado);
            PreSta.setInt(2, Codigo);
            PreSta.executeUpdate();
            x = ".";
        } catch (Exception e) {
            
        }
        return x;
    }
    
    public ArrayList<GS_Denuncia_Cliente> Ver_DenunciasC (String Doc){
        ArrayList<GS_Denuncias> Tabla=new ArrayList<>();
        
        try {
            PreSta= BaseDatos.prepareStatement("call DenunciasCliente('Doc')");
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Denuncia_Cliente den = new GS_Denuncia_Cliente(Reset.getString(1), Reset.getString(2));
                Tabla.add(den);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Todo Denuncia");
        }
        return Tabla;
    }

}
