/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.GS_Login;
import Modelo.Login_M;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
@WebServlet(name = "ServletContraseña", urlPatterns = {"/ServletContrase_a"})
public class ServletContrasena extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Documento,Clave,Actual,Nueva;
        JOptionPane.showMessageDialog(null, "Entra");
        Documento = request.getParameter("Documento_C");
        Clave = request.getParameter("Clave_C");
        Actual = request.getParameter("Actual_C");
        Nueva = request.getParameter("Nueva_C");
        if (Clave.equals(Actual)) {
            GS_Login lg=new GS_Login(Documento, Nueva);
            Login_M act=new Login_M();
            int X= act.Actualizar_Contraseña(lg);
            if(X>0){
                JOptionPane.showMessageDialog(null,"Sus datos fueron actualizados");
            }else{
                JOptionPane.showMessageDialog(null,"Error al actualizar");
            }
        }
        else{
            JOptionPane.showMessageDialog(null, "Contraseña actual no coincide con la Anterior");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
