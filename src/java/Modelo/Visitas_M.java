/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Usuario
 */
public class Visitas_M {
 
    Conexion Conex=new Conexion();
    Connection BaseDatos= Conex.Conectando();
    PreparedStatement PreSta=null;
    ResultSet Reset=null;
    
    public ArrayList<GS_Visitas> Ver_Visitas (){
        ArrayList<GS_Visitas> Tabla=new ArrayList<>();
        
       
        try {
            PreSta= BaseDatos.prepareStatement("call Ver_Visitas()");
            Reset= PreSta.executeQuery();
            
            while (Reset.next()) {   
                GS_Visitas ing=new GS_Visitas(Reset.getInt(1), Reset.getString(2), Reset.getString(3), Reset.getString(4));
                Tabla.add(ing);
            }
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" Error en Ver Visitas");
        }
        return Tabla;
    }
    
    public void Asignar_Visita (GS_Visitas GS){
        try{
            PreSta=BaseDatos.prepareStatement("call Asignar_Visita (?,?,?)");
            PreSta.setString(1, GS.getFecha());
            PreSta.setString(2, GS.getEncargado());
            PreSta.setString(3, GS.getPostulante());
            PreSta.executeUpdate();
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
}
