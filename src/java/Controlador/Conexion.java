package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class Conexion {
    Connection cnn = null;
    
    public Connection Conectando(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnn = DriverManager.getConnection("jdbc:mysql://localhost/SARD","root","0000");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Error en la conexion \n"+e);
        }
        
        return cnn;
    }
}
