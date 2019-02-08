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
@WebServlet(name = "Servlet_Contrasena", urlPatterns = {"/Servlet_Contrasena"})
public class Servlet_Contrasena extends HttpServlet {

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
        
        if (request.getParameter("Act-Contrasena") != null){
            JOptionPane.showMessageDialog(null, "Le entro completo");
            this.Actualizar_Login(request, response);
        }
    }
    protected void Actualizar_Login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Documento,Clave,Actual,Nueva,Nueva2;
        JOptionPane.showMessageDialog(null, "Entra");
        Documento = request.getParameter("Usuario_Cliente");
        Clave = request.getParameter("Clave_Cliente");
        Actual = request.getParameter("Contrasena_Actual");
        Nueva = request.getParameter("Contrasena_Nueva");
        Nueva2 = request.getParameter("Contrasena_Nueva2");
        if (Clave.equals(Actual)) {
            
            if (Nueva.equals(Nueva2)) {
                GS_Login lg=new GS_Login(Documento, Nueva);
                Login_M act=new Login_M();
                int X= act.Actualizar_Contraseña(lg);
                if(X>0){
                    JOptionPane.showMessageDialog(null,"Sus datos fueron actualizados");
                    request.getRequestDispatcher("Perfil_Ciudadano.jsp").forward(request, response);
                }else{
                    JOptionPane.showMessageDialog(null,"Error al actualizar");
                }
            }
            else{
                JOptionPane.showMessageDialog(null, "Contraseña nueva no coincide con la Anterior");
                request.getRequestDispatcher("Perfil_Ciudadano.jsp").forward(request, response);
            }
        }
        else{
            JOptionPane.showMessageDialog(null, "Contraseña actual no coincide con la Anterior");
            request.getRequestDispatcher("Perfil_Ciudadano.jsp").forward(request, response);
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
