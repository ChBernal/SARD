/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.GS_Veterinaria;
import Modelo.Veterinaria_M;
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
 * @author SENA
 */

@WebServlet(name = "Servlet_Veterinaria", urlPatterns = {"/Servlet_Veterinaria"})
@MultipartConfig
public class Servlet_Veterinaria extends HttpServlet {

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
        
        if (request.getParameter("Registro-Veterinaria")!=null) {
            JOptionPane.showMessageDialog(null, "entra boton");
             Insertar_Veterinaria(request, response);
        }
       
        if (request.getParameter("btn-Actualizar-Activas")!=null) {
             Actualizar_Veterinaria_Activa(request, response);
        }
        if (request.getParameter("btn-Actualizar-Inactivas")!=null) {
             Actualizar_Veterinaria_Inactivas(request, response);
        }
        if (request.getParameter("btn-Eliminar")!=null) {
             Eliminar_Veterinaria(request, response);
        }
    }
    
     protected void Insertar_Veterinaria (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int Rol=0;
        String Nit,Nombre,Representante,Tipo,Fecha,Direccion,Barrio,Telefono,Correo,RolNombre;
        Nit = request.getParameter("Nit");
        Nombre = request.getParameter("Nombre-Veterinaria");
        Representante= request.getParameter("Representante-Veterinaria");
        Tipo= request.getParameter("Tipo-Veterinaria");
        Fecha = request.getParameter("Fecha-Fundacion");
        Direccion = request.getParameter("Direccion-Veterinaria");
        Barrio = request.getParameter("Barrio-Veterinaria");
        Telefono = request.getParameter("Telefono-Veterinaria");
        Correo = request.getParameter("Email-Veterinaria");
        RolNombre= request.getParameter("Estado-Veterinaria");
            if (RolNombre.equalsIgnoreCase("Activo")) {
             Rol=4;
            }
            else if (RolNombre.equalsIgnoreCase("Inactivo")) {
             Rol=0;
            }
        Part Foto = request.getPart("Foto-Veterinaria"); 
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
         GS_Veterinaria GSC = new GS_Veterinaria(Nit, Nombre, Representante, Tipo, Fecha, Direccion, Barrio, Telefono, Correo,Rol, url2);
         Veterinaria_M veterinaria = new Veterinaria_M();
        veterinaria.In_Veterinaria_Admin(GSC);    ;
        
        response.sendRedirect("Menu-Admin.jsp");
    }
     
    protected void Insertar_Veterinaria_Login (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int Rol;
        String Nit,Nombre,Representante,Tipo,Fecha,Direccion,Barrio,Telefono,Correo;
        Nit = request.getParameter("Nit");
        Nombre = request.getParameter("Nombre");
        Representante= request.getParameter("Representante");
        Tipo= request.getParameter("Tipo");
        Fecha = request.getParameter("Fecha_Fundacion");
        Direccion = request.getParameter("Direccion");
        Barrio = request.getParameter("Barrio");
        Telefono = request.getParameter("Telefono");
        Correo = request.getParameter("Correo");
        Part Foto = request.getPart("Foto"); 
        String Nombre_F = Foto.getSubmittedFileName();
        String Name = Nombre+"_"+Nombre_F;
        
        String url= "C:\\xampp\\htdocs\\Java\\NetBeansProjects\\SARD\\web\\Uploads\\"+Name;
        String url2 = "Uploads\\"+Name;
        
        InputStream file= Foto.getInputStream();
        File img=new File(url);
        FileOutputStream sal=new FileOutputStream(img);
        int num= file.read();
        
        while (num !=-1) {            
            sal.write(num);
            num= file.read();
        }
        GS_Veterinaria GSC = new GS_Veterinaria(Nit, Nombre, Representante, Tipo, Fecha, Direccion, Barrio, Telefono, Correo, url2);
        Veterinaria_M veterinaria = new Veterinaria_M();
        veterinaria.In_Veterinaria_Admin(GSC);    ;
        
        response.sendRedirect("Login.jsp");
    }
     protected void Actualizar_Veterinaria_Activa (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Nit,Nombre,Representante,Direccion,Barrio,Telefono,Correo, RolNombre, Foto_Actual;
        int Rol=0, Actualizar;
        Nit = request.getParameter("Nit-Veterinaria");
        Nombre = request.getParameter("Nombre-Veterinaria");
        Representante= request.getParameter("Representante-Veterinaria");
        Direccion = request.getParameter("Direccion-Veterinaria");
        Barrio = request.getParameter("Barrio-Veterinaria");
        Telefono = request.getParameter("Telefono-Veterinaria");
        Correo = request.getParameter("Email-Veterinaria");
        Foto_Actual = request.getParameter("Foto-Actual");
        Part Foto = request.getPart("Foto-Veterinaria"); 
        
        String Nombre_F = Foto.getSubmittedFileName();
        String Name = Nombre+"_"+Nombre_F;
        JOptionPane.showMessageDialog(null, Foto_Actual);
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
            GS_Veterinaria GSC = new GS_Veterinaria(Nit, Nombre, Representante, Direccion, Barrio, Telefono, Correo, url2);
            Veterinaria_M veterinaria = new Veterinaria_M();
            Actualizar = veterinaria.Act_Veterinaria_Activas(GSC);
                 if (Actualizar>0) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
                    out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
                    out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
                    out.println("</head>");
                    out.println("<body>");
                    out.print("<script type='text/javascript'> alertify.alert('Datos actualizados',function(){"
                            + "window.location.href = 'Lista_Veterinaria.jsp'}); </script>");
                    out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                    out.println("</body>");
                    out.println("</html>");
                 }
                 else{
                     JOptionPane.showMessageDialog(null, "ERROR AL ACTUALIZAR");
                    response.sendRedirect("Lista_Veterinaria.jsp");
                 }
         }
         else{
            String url2 = Foto_Actual;
            GS_Veterinaria GSC = new GS_Veterinaria(Nit, Nombre, Representante, Direccion, Barrio, Telefono, Correo, url2);
            Veterinaria_M veterinaria = new Veterinaria_M();
            Actualizar = veterinaria.Act_Veterinaria_Activas(GSC);
                 if (Actualizar>0) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
                    out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
                    out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
                    out.println("</head>");
                    out.println("<body>");
                    out.print("<script type='text/javascript'> alertify.alert('Datos actualizados',function(){"
                            + "window.location.href = 'Lista_Veterinaria.jsp'}); </script>");
                    out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                    out.println("</body>");
                    out.println("</html>");
                 }
                 else{
                     JOptionPane.showMessageDialog(null, "ERROR AL ACTUALIZAR");
                    response.sendRedirect("Lista_Veterinaria.jsp");
                 }         
        }
    
        
    }
     
    protected void Actualizar_Veterinaria_Inactivas (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Nit,Nombre,Representante,Direccion,Barrio,Telefono,Correo, RolNombre, Foto_Actual;
        int Rol=0, Actualizar;
        Nit = request.getParameter("Nit-Veterinaria");
        Nombre = request.getParameter("Nombre-Veterinaria");
        Representante= request.getParameter("Representante-Veterinaria");
        Direccion = request.getParameter("Direccion-Veterinaria");
        Barrio = request.getParameter("Barrio-Veterinaria");
        Telefono = request.getParameter("Telefono-Veterinaria");
        Correo = request.getParameter("Email-Veterinaria");
        JOptionPane.showMessageDialog(null, Correo);
        Foto_Actual = request.getParameter("Foto-Actual");
        Part Foto = request.getPart("Foto-Veterinaria"); 
        Rol= Integer.parseInt(request.getParameter("Estado-Veterinaria"));
        
        String Nombre_F = Foto.getSubmittedFileName();
        String Name = Nombre+"_"+Nombre_F;
        JOptionPane.showMessageDialog(null, Foto_Actual);
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
            GS_Veterinaria GSC = new GS_Veterinaria(Nit, Nombre, Representante, Direccion, Barrio, Telefono, Correo, Rol, url2);
            Veterinaria_M veterinaria = new Veterinaria_M();
            Actualizar = veterinaria.Act_Veterinaria_Inactivas(GSC);
                 if (Actualizar>0) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
                    out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
                    out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
                    out.println("</head>");
                    out.println("<body>");
                    out.print("<script type='text/javascript'> alertify.alert('Datos actualizados',function(){"
                            + "window.location.href = 'Lista_Veterinaria.jsp'}); </script>");
                    out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                    out.println("</body>");
                    out.println("</html>");
                 }
                 else{
                     JOptionPane.showMessageDialog(null, "ERROR AL ACTUALIZAR");
        response.sendRedirect("Lista_Veterinaria.jsp");
                 }
         }
         else{
            String url2 = Foto_Actual;
            GS_Veterinaria GSC = new GS_Veterinaria(Nit, Nombre, Representante, Direccion, Barrio, Telefono, Correo, Rol, url2);
            Veterinaria_M veterinaria = new Veterinaria_M();
            Actualizar = veterinaria.Act_Veterinaria_Inactivas(GSC);
                 if (Actualizar>0) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
                    out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
                    out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
                    out.println("</head>");
                    out.println("<body>");
                    out.print("<script type='text/javascript'> alertify.alert('Datos actualizados',function(){"
                            + "window.location.href = 'Lista_Veterinaria.jsp'}); </script>");
                    out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                    out.println("</body>");
                    out.println("</html>");
                 }
                 else{
                     JOptionPane.showMessageDialog(null, "ERROR AL ACTUALIZAR");
        response.sendRedirect("Lista_Veterinaria.jsp");
                 }      
        }
    
        
    }
     
     protected void Eliminar_Veterinaria (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Documento;
        Documento=request.getParameter("Nit-Veterinaria");
        GS_Veterinaria GSA = new GS_Veterinaria(Documento);
        Veterinaria_M Vete = new Veterinaria_M();
        Vete.Eli_Veterinaria(GSA);
        response.sendRedirect("Lista_Veterinaria.jsp");
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
