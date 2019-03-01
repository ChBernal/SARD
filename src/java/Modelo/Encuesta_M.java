
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Encuesta_M {
    Conexion conexion = new Conexion();
    Connection cnn = conexion.Conectando();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void In_Encuenta(GS_Preguntas_Postulacion GSP) {
        try {
            
        } catch (Exception e) {
        }
    }
}
