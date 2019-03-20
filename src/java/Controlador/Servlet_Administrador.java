/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Admin_M;
import Modelo.Administrador_M;
import Modelo.Ciudadano_;
import Modelo.GS_Admin;
import Modelo.GS_Administrador;
import Modelo.GS_Ciudadano;
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
 * @author User
 */
@MultipartConfig
@WebServlet(name = "Servlet_Administrador", urlPatterns = {"/Servlet_Administrador"})
public class Servlet_Administrador extends HttpServlet {

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
        
        if (request.getParameter("Registro-Administrador") != null){
            this.Insertar_Admin(request, response);
        }
        if (request.getParameter("Consultar") != null){
            String Lista = request.getParameter("Listas-Usuarios");
            if (Lista.equalsIgnoreCase("ciudadanos")) {
                response.sendRedirect("Lista_Ciudadano.jsp");
            }
            else if (Lista.equalsIgnoreCase("veterinaria")) {
                response.sendRedirect("Lista_Veterinaria.jsp");
            }
            else if (Lista.equalsIgnoreCase("sass")) {
                response.sendRedirect("Lista_SASS.jsp");
            }
            else if (Lista.equalsIgnoreCase("administradores")) {
                response.sendRedirect("Lista_Administrador.jsp");
            }
        }
        if (request.getParameter("Actualizar_A") != null){
            this.Actualizar_Admin_Perfil(request, response);
        }
        if (request.getParameter("btn-Actualizar") != null){
            this.Actualizar_Admin(request, response);
        }
        if (request.getParameter("btn-Eliminar") != null){
            this.Eliminar_Administrador(request, response);
        }
        
    }
    protected void Insertar_Admin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Documento,Tipo,Nombre,Apellido,Genero,Fecha,Direccion,Telefono,Correo;
        Documento = request.getParameter("Documento-Administrador");
        Tipo= request.getParameter("Tipo-Documento-Administrador");
        Nombre = request.getParameter("Nombre-Administrador");
        Apellido = request.getParameter("Apellido-Administrador");
        Genero = request.getParameter("Genero-Administrador");
        Fecha = request.getParameter("Nacimiento-Administrador");
        Direccion = request.getParameter("Direccion-Administrador");
        Telefono = request.getParameter("Telefono-Administrador");
        Correo = request.getParameter("Email-Administrador");
        Part Foto = request.getPart("Foto-Administrador");
        String url2;
       
            String Nombre_F = Foto.getSubmittedFileName();
            String Name = Nombre+"_"+Nombre_F;

            String url= "C:\\xampp\\htdocs\\Java\\NetBeansProjects\\MAppets\\web\\Uploads\\"+Name;
             url2 = "Uploads/"+Name;

            InputStream file= Foto.getInputStream();
            File img=new File(url);
            FileOutputStream sal=new FileOutputStream(img);
            int num= file.read();

            while (num !=-1) {            
                sal.write(num);
                num= file.read();
            }
        
        
        GS_Administrador GSA = new GS_Administrador(Documento,Tipo, Nombre, Apellido, Genero,Fecha, Direccion, Telefono, Correo, url2);
        Administrador_M Admin = new Administrador_M();
        Admin.In_Administrador(GSA);
        Admin.Login_Admin(GSA);
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
        out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
        out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
        out.println("</head>");
        out.println("<body>");
        out.print("<script type='text/javascript'> alertify.alert('Administrador Registrado',function(){"
                + "window.location.href = 'Menu-Admin.jsp'}); </script>");
        out.println("<script src='Estilos/JS/jquery.min.js'></script>");
        out.println("</body>");
        out.println("</html>");

        }
    protected void Actualizar_Admin_Perfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        String Documento,Nombre,Direccion,Telefono,Correo;
        Nombre =request.getParameter("Nombre_A");
        Documento = request.getParameter("Documento_A");
        Direccion = request.getParameter("Direccion_A");
        Telefono = request.getParameter("Telefono2_A");
        Correo = request.getParameter("Correo_A");
        Part Foto = request.getPart("Foto_A");
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
        GS_Admin GSA = new GS_Admin(Documento, Direccion, Telefono, Correo, url2);
        Admin_M Admin = new Admin_M();
        int Consulta;
        Consulta=Admin.Act_Administrador(GSA);
        if (Consulta>0) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
            out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
            out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
            out.println("</head>");
            out.println("<body>");
            out.print("<script type='text/javascript'> alertify.alert('Datos actualizados',function(){"
                    + "window.location.href = 'Perfil_Administrador.jsp'}); </script>");
            out.println("<script src='Estilos/JS/jquery.min.js'></script>");
            out.println("</body>");
            out.println("</html>");
        }
        else{
            JOptionPane.showMessageDialog(null,"ERROR AL ACTUALIZAR");       
            response.sendRedirect("Perfil_Administrador.jsp");
        }

    }
    
    protected void Actualizar_Admin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        String Documento,Nombre,Direccion,Telefono,Correo, Foto_Antigua;
        Nombre =request.getParameter("Nombre-Administrador");
        Documento = request.getParameter("Documento-Administrador");
        Direccion = request.getParameter("Direccion-Administrador");
        Telefono = request.getParameter("Telefono-Administrador");
        Correo = request.getParameter("Email-Administrador");
        Foto_Antigua = request.getParameter("Foto_Antigua");
        Part Foto = request.getPart("Foto-Administrador");
        String Nombre_F = Foto.getSubmittedFileName();
        String Name = Nombre+"_"+Nombre_F;
        if (Nombre_F!="") {
          
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
            GS_Admin GSA = new GS_Admin(Documento, Direccion, Telefono, Correo, url2);
            Admin_M Admin = new Admin_M();
            int Consulta;
            Consulta=Admin.Act_Administrador(GSA);
            if (Consulta>0) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
                out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
                out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
                out.println("</head>");
                out.println("<body>");
                out.print("<script type='text/javascript'> alertify.alert('Datos actualizados',function(){"
                        + "window.location.href = 'Lista_Administrador.jsp'}); </script>");
                out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                out.println("</body>");
                out.println("</html>");
            }
            else{
                JOptionPane.showMessageDialog(null,"ERROR AL ACTUALIZAR");
                response.sendRedirect("Lista_Administrador.jsp");
            }       
        }
        else{
            
            String url2 = Foto_Antigua;
            GS_Admin GSA = new GS_Admin(Documento, Direccion, Telefono, Correo, url2);
            Admin_M Admin = new Admin_M();
            int Consulta;
            Consulta=Admin.Act_Administrador(GSA);
            if (Consulta>0) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
                out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
                out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
                out.println("</head>");
                out.println("<body>");
                out.print("<script type='text/javascript'> alertify.alert('Datos actualizados',function(){"
                        + "window.location.href = 'Lista_Administrador.jsp'}); </script>");
                out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                out.println("</body>");
                out.println("</html>");
            }
            else{
                JOptionPane.showMessageDialog(null,"ERROR AL ACTUALIZAR");
                response.sendRedirect("Lista_Administrador.jsp");
            }       
        }

    }
    
    protected void Eliminar_Administrador(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Documento;
        Documento = request.getParameter("Documento-Administrador");
        GS_Administrador GSA = new GS_Administrador(Documento);
        Administrador_M Administrador = new Administrador_M();
        Administrador.Eli_Administrador(GSA);
        
         response.sendRedirect("Lista_Administrador.jsp");
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
