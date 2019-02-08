/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Ciudadano_M;
import Modelo.GS_Ciudadano;
import Modelo.GS_Login;
import Modelo.Login_M;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

/**
 *
 * @author Usuario
 */
@MultipartConfig
@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

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
        
        if (request.getParameter("Actualizar") != null){
            this.Actualizar_Cliente_Perfil(request, response);
        }
    }
    protected void Actualizar_Cliente_Perfil (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        JOptionPane.showMessageDialog(null, "entra funciom");
        String Documento,Nombre,Direccion,Barrio,Telefono1,Telefono2,Correo, Ocupacion;
        Documento = request.getParameter("Documento_C");
        Nombre = request.getParameter("Nombre_C");
        Direccion = request.getParameter("Direccion_C");
        Barrio = request.getParameter("Barrio_C");
        Telefono1 = request.getParameter("Telefono1_C");
        Telefono2 = request.getParameter("Telefono2_C");
        Correo = request.getParameter("Correo_C");
        Ocupacion = request.getParameter("Ocupacion_C");
        Part Foto = request.getPart("Foto_C");
        String Nombre_F = Foto.getSubmittedFileName();
        String Name = Nombre+"_"+Nombre_F;
        
        String url= "C:\\xampp\\htdocs\\Java\\NetBeansProjects\\MAppets\\web\\Uploads\\"+Name;
        String url2 = "Uploads\\"+Name;
        
        InputStream file= Foto.getInputStream();
        File img=new File(url);
        FileOutputStream sal=new FileOutputStream(img);
        int num= file.read();
        
        while (num !=-1) {            
            sal.write(num);
            num= file.read();
        }
        GS_Ciudadano GSC = new GS_Ciudadano(Documento, Direccion, Barrio, Telefono1, Telefono2, Correo, Ocupacion, url2);
        Ciudadano_M Cliente = new Ciudadano_M();
        int Consulta =Cliente.Actualizar_Ciudadano(GSC);
            if (Consulta>0) {
                JOptionPane.showMessageDialog(null, "DATOS ACTUALIZADOS");
            }
            else{
                JOptionPane.showMessageDialog(null, "ERROR AL ACTUALIZAR");
            }
        response.sendRedirect("Perfil_Ciudadano.jsp");
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
