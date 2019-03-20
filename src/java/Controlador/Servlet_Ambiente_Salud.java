/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Modelo.Ambiente_Salud_M;
import Modelo.GS_Ambiente_Salud;
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
@WebServlet(name = "Servlet_Ambiente_Salud", urlPatterns = {"/Servlet_Ambiente_Salud"})
@MultipartConfig
public class Servlet_Ambiente_Salud extends HttpServlet {

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
        
        if (request.getParameter("Registro-SASS")!=null) {
            this.Insertar_Ambiente_Salud(request, response);
        }
        if (request.getParameter("btn-Actualizar")!=null) {
            this.Actualizar_Ambiente_Salud(request, response);
        }
        if (request.getParameter("btn-Eliminar")!=null) {
            this.Eliminar_Ambiente_Salud(request, response);
        }
        
    }
    
     protected void Insertar_Ambiente_Salud (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Documento,Tipo,Nombre,Apellido,Genero,Fecha,Direccion,Telefono,Correo,RolNombre;
        int Rol=0;
        Documento = request.getParameter("Documento-SASS");
        Tipo= request.getParameter("Tipo-Documento-SASS");
        Nombre = request.getParameter("Nombre-SASS");
        Apellido = request.getParameter("Apellido-SASS");
        Genero = request.getParameter("Genero-SASS");
        Fecha = request.getParameter("Nacimiento-SASS");
        Direccion = request.getParameter("Direccion-SASS");
        Telefono = request.getParameter("Telefono-SASS");
        Correo = request.getParameter("Email-SASS");
        RolNombre =request.getParameter("Rol-SASS");
            if (RolNombre.equalsIgnoreCase("Secretaria de Ambiente")) {
                Rol=2;
            }
            else if(RolNombre.equalsIgnoreCase("Secretaria de Salud")){
                Rol=3;
            }
        Part Foto = request.getPart("Foto-SASS");
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
        
         GS_Ambiente_Salud GSAS = new GS_Ambiente_Salud(Documento, Tipo, Nombre, Apellido, Genero, Fecha, Direccion, Telefono, Correo, Rol, url2);
         Ambiente_Salud_M AS = new Ambiente_Salud_M();
        AS.In_Ambiente_Salud(GSAS);
        if(Rol==2){
            AS.Login_Ambiente(GSAS);
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
        else{
            AS.Login_Salud(GSAS);
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
     }
     
     protected void Actualizar_Ambiente_Salud (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Nombre,Foto_Antigua,Documento,Direccion,Telefono,Correo;
        Documento = request.getParameter("Documento-SASS");
        Nombre = request.getParameter("Nombre-SASS");
        Direccion = request.getParameter("Direccion-SASS");
        Telefono = request.getParameter("Telefono-SASS");
        Correo = request.getParameter("Email-SASS");
        Foto_Antigua = request.getParameter("Foto_Antigua");
        Part Foto = request.getPart("Foto-SASS");
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

            GS_Ambiente_Salud GSAS = new GS_Ambiente_Salud(Documento, Direccion, Telefono, Correo, url2);
             Ambiente_Salud_M AS = new Ambiente_Salud_M();

            int Consulta;
            Consulta=AS.Act_Ambiente_Salud(GSAS);
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
                        + "window.location.href = 'Lista_SASS.jsp'}); </script>");
                out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                out.println("</body>");
                out.println("</html>");
            }
            else{
                JOptionPane.showMessageDialog(null,"ERROR AL ACTUALIZAR");
                response.sendRedirect("Lista_SASS.jsp");
            }
         }
         else{
            
            String url2 = Foto_Antigua;

            GS_Ambiente_Salud GSAS = new GS_Ambiente_Salud(Documento, Direccion, Telefono, Correo, url2);
             Ambiente_Salud_M AS = new Ambiente_Salud_M();

            int Consulta;
            Consulta=AS.Act_Ambiente_Salud(GSAS);
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
                        + "window.location.href = 'Lista_SASS.jsp'}); </script>");
                out.println("<script src='Estilos/JS/jquery.min.js'></script>");
                out.println("</body>");
                out.println("</html>");
            }
            else{
                JOptionPane.showMessageDialog(null,"ERROR AL ACTUALIZAR");
                response.sendRedirect("Lista_SASS.jsp");
            }
             
         }
     }
     
     protected void Eliminar_Ambiente_Salud (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Documento;
        Documento=request.getParameter("Documento-SASS");
        GS_Ambiente_Salud GSAS = new GS_Ambiente_Salud(Documento);
         Ambiente_Salud_M Am_Sa = new Ambiente_Salud_M();
        Am_Sa.Eli_Ambiente_Salud(GSAS);
        
        response.sendRedirect("Lista_SASS.jsp");
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
