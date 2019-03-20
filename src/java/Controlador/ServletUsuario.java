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
        if (request.getParameter("Registro-Ciudadano") != null){
            this.Insertar_Cliente(request, response);
        }
        if (request.getParameter("Registrarme") != null){
            this.Insertar_Ciudadano(request, response);
        }
        if (request.getParameter("btn-Actualizar") != null){
            this.Actualizar_Cliente_Admin(request, response);
        }
        if (request.getParameter("btn-Eliminar") != null){
            this.Eliminar_Cliente_Admin(request, response);
        }
    }
    
    protected void Insertar_Cliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Documento,Tipo,Lugar,Nombre,Apellido,Genero,Fecha,Direccion,Barrio,Telefono1,Telefono2,Correo,Ocupacion;
        Documento = request.getParameter("Documento-Ciudadano");
        Tipo= request.getParameter("Tipo-Documento-Ciudadano");
        Lugar= request.getParameter("Expedicion-Ciudadano");
        Nombre = request.getParameter("Nombre-Ciudadano");
        Apellido = request.getParameter("Apellido-Ciudadano");
        Genero = request.getParameter("Genero-Ciudadano");
        Fecha = request.getParameter("Nacimiento-Ciudadano");
        Direccion = request.getParameter("Direccion-Ciudadano");
        Barrio = request.getParameter("Barrio-Ciudadano");
        Telefono1 = request.getParameter("Telefono-Ciudadano");
        Telefono2 = request.getParameter("Celular-Ciudadano");
        Correo = request.getParameter("Email-Ciudadano");
        Ocupacion = request.getParameter("Ocupacion-Ciudadano");
        Part Foto = request.getPart("Foto-Ciudadano");
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
        
        GS_Ciudadano GSC = new GS_Ciudadano(Documento, Tipo, Lugar, Nombre, Apellido, Genero, Fecha, Direccion, Barrio, Telefono1, Telefono2, Correo, Ocupacion, url2);
        Ciudadano_ Ciudadano = new Ciudadano_();
        Ciudadano.In_Ciudadano(GSC);
        Login_M M_LG =new Login_M();
        M_LG.Login_Cliente(GSC);
        
        int Rol = Integer.parseInt(request.getParameter("Rol"));
        if (Rol==1) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
            out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
            out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
            out.println("</head>");
            out.println("<body>");
            out.print("<script type='text/javascript'> alertify.alert('Usuario Registrado',function(){"
                    + "window.location.href = 'Menu-Admin.jsp'}); </script>");
            out.println("<script src='Estilos/JS/jquery.min.js'></script>");
            out.println("</body>");
            out.println("</html>");
        }
        if (Rol==2) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
            out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
            out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
            out.println("</head>");
            out.println("<body>");
            out.print("<script type='text/javascript'> alertify.alert('Usuario Registrado',function(){"
                    + "window.location.href = 'Menu-SA.jsp'}); </script>");
            out.println("<script src='Estilos/JS/jquery.min.js'></script>");
            out.println("</body>");
            out.println("</html>");
        }
        }

    protected void Actualizar_Cliente_Perfil (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
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
            Ciudadano_ Cliente = new Ciudadano_();
            int Consulta =Cliente.Actualizar_Ciudadano(GSC);
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
                            + "window.location.href = 'Perfil_Ciudadano.jsp'}); </script>");
                    out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                    out.println("</body>");
                    out.println("</html>");
                }
                else{
                    JOptionPane.showMessageDialog(null, "ERROR AL ACTUALIZAR");       
                    response.sendRedirect("Perfil_Ciudadano.jsp");
                }
      
        }
    
    protected void Actualizar_Cliente_Admin (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Documento,Nombre,Direccion,Barrio,Telefono1,Telefono2,Correo, Ocupacion, Foto_Actual;
        Documento = request.getParameter("Documento-Ciudadano");
        Nombre = request.getParameter("Nombre-Ciudadano");
        Direccion = request.getParameter("Direccion-Ciudadano");
        Barrio = request.getParameter("Barrio-Ciudadano");
        Telefono1 = request.getParameter("Telefono-Ciudadano");
        Telefono2 = request.getParameter("Celular-Ciudadano");
        Correo = request.getParameter("Email-Ciudadano");
        Ocupacion = request.getParameter("Ocupacion-Ciudadano");
        Foto_Actual = request.getParameter("Foto_Actual");
        Part Foto = request.getPart("Foto");
        String Nombre_F = Foto.getSubmittedFileName();
        String Name = Nombre+"_"+Nombre_F;
        if (Nombre_F!=null) {
            
            
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
        Ciudadano_ Cliente = new Ciudadano_();
        int Consulta =Cliente.Actualizar_Ciudadano(GSC);
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
                        + "window.location.href = 'Lista_Ciudadano.jsp'}); </script>");
                out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                out.println("</body>");
                out.println("</html>");
            }
            else{
                JOptionPane.showMessageDialog(null, "ERROR AL ACTUALIZAR");       
                response.sendRedirect("Lista_Ciudadano.jsp");
            }
        }else{
            String url2 = Foto_Actual;
            
            GS_Ciudadano GSC = new GS_Ciudadano(Documento, Direccion, Barrio, Telefono1, Telefono2, Correo, Ocupacion, url2);
            Ciudadano_ Cliente = new Ciudadano_();
            int Consulta =Cliente.Actualizar_Ciudadano(GSC);
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
                            + "window.location.href = 'Lista_Ciudadano.jsp'}); </script>");
                    out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                    out.println("</body>");
                    out.println("</html>");
                }
                else{
                    JOptionPane.showMessageDialog(null, "ERROR AL ACTUALIZAR");       
                    response.sendRedirect("Lista_Ciudadano.jsp");
                }
        }
        }
    
    protected void Insertar_Ciudadano(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Documento,Tipo,Lugar,Nombre,Apellido,Genero,Fecha,Direccion,Barrio,Telefono1,Telefono2,Correo,Ocupacion;
        Documento = request.getParameter("Documento-Ciudadano");
        Tipo= request.getParameter("Tipo-Documento-Ciudadano");
        Lugar= request.getParameter("Expedicion-Ciudadano");
        Nombre = request.getParameter("Nombre-Ciudadano");
        Apellido = request.getParameter("Apellido-Ciudadano");
        Genero = request.getParameter("Genero-Ciudadano");
        Fecha = request.getParameter("Nacimiento-Ciudadano");
        Direccion = request.getParameter("Direccion-Ciudadano");
        Barrio = request.getParameter("Barrio-Ciudadano");
        Telefono1 = request.getParameter("Telefono-Ciudadano");
        Telefono2 = request.getParameter("Celular-Ciudadano");
        Correo = request.getParameter("Email-Ciudadano");
        Ocupacion = request.getParameter("Ocupacion-Ciudadano");
        Part Foto = request.getPart("Foto-Ciudadano");
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
        
        GS_Ciudadano GSC = new GS_Ciudadano(Documento, Tipo, Lugar, Nombre, Apellido, Genero, Fecha, Direccion, Barrio, Telefono1, Telefono2, Correo, Ocupacion, url2);
        Ciudadano_ Ciudadano = new Ciudadano_();
        Ciudadano.In_Ciudadano(GSC);
        Login_M M_LG =new Login_M();
        M_LG.Login_Cliente(GSC);
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
        out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
        out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
        out.println("</head>");
        out.println("<body>");
        out.print("<script type='text/javascript'> alertify.alert('Datos ingresados ahora puedes iniciar sesion',function(){"
                + "window.location.href = 'index.jsp'}); </script>");
        out.println("<script src='Estilos/JS/jquery.min.js'></script>");
        out.println("</body>");
        out.println("</html>");
        }
    protected void Eliminar_Cliente_Admin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Documento,Tipo,Lugar,Nombre,Apellido,Genero,Fecha,Direccion,Barrio,Telefono1,Telefono2,Correo,Ocupacion;
        Documento = request.getParameter("Documento-Ciudadano");
        GS_Ciudadano GSC = new GS_Ciudadano(Documento);
        Ciudadano_ Ciudadano = new Ciudadano_();
        Ciudadano.Eli_Cliente(GSC);
        
         response.sendRedirect("Lista_Ciudadano.jsp");
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
