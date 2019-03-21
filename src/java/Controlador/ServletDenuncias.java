package Controlador;

import Modelo.Denuncias_M;
import Modelo.GS_Denuncia_Cliente;
import Modelo.GS_Denuncias;
import Modelo.GS_Respuesta;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

@MultipartConfig
@WebServlet(name = "ServletDenuncias", urlPatterns = {"/ServletDenuncias"})
public class ServletDenuncias extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (request.getParameter("DenunciaNN") != null){
            this.Ingreso_Denuncias(request, response);
        }
        if (request.getParameter("DenunciaCC")!=null) {
            this.Ingreso_Denuncias2(request, response);
        }
        if (request.getParameter("Predeterminada")!=null || request.getParameter("Continuacion")!=null){
            this.Respuesta_PreCont_Anonima(request, response);
            request.getRequestDispatcher("Notificaciones-Admin.jsp").forward(request, response);
        }else if (request.getParameter("Finalizar")!=null){
            this.Respuesta_Finalizar_Anonima(request, response);
            request.getRequestDispatcher("Notificaciones-Admin.jsp").forward(request, response);
        }
        if (request.getParameter("PredeterminadaC")!= null || request.getParameter("ContinuacionC")!= null){
            this.Respuesta_PreCont_Ciudadano(request, response);
            request.getRequestDispatcher("Notificaciones-Admin.jsp").forward(request, response);
        }else if (request.getParameter("FinalizarC")!= null){
            this.Respuesta_Finalizar_Ciudadano(request, response);
            request.getRequestDispatcher("Notificaciones-Admin.jsp").forward(request, response);
        }
    }
    
    protected void Respuesta_PreCont_Anonima(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
        HttpSession datt = request.getSession();
        
        String Descripcion;
        int Codigo ;
        
        Descripcion= request.getParameter("Descripcion_RA");
        if (Descripcion.equalsIgnoreCase("")) {
            Descripcion="Su denuncia ha sido recibida, en los próximos 15 dias se le estará notificando el estado y los procesos a realizar. ";
        }
        Codigo = Integer.parseInt(request.getParameter("Codigo_RA"));
        GS_Respuesta GS_R =new GS_Respuesta(Descripcion, Codigo);
        Denuncias_M  Den= new Denuncias_M();
        Den.Respuesta_PreCont_Anonima(GS_R);        
                
     }
    
    protected void Respuesta_Finalizar_Anonima(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
        HttpSession datt = request.getSession();
        
        String Descripcion;
        int Codigo ;
        
        Descripcion= request.getParameter("Descripcion_RA");
        Codigo = Integer.parseInt(request.getParameter("Codigo_RA"));
        GS_Respuesta GS_R =new GS_Respuesta(Descripcion, Codigo);
        Denuncias_M  Den= new Denuncias_M();
        Den.Respuesta_Finalizar_Anonima(GS_R);
                
     }
    
    protected void Respuesta_PreCont_Ciudadano(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
        HttpSession datt = request.getSession();
        
        String Descripcion;
        int Codigo ;
        
        Descripcion= request.getParameter("Descripcion_RC");
        if (Descripcion.equalsIgnoreCase("")) {
            Descripcion="Su denuncia ha sido recibida, en los próximos 15 dias se le estará notificando el estado y los procesos a realizar. ";
        }
        Codigo = Integer.parseInt(request.getParameter("Codigo_RC"));
        GS_Respuesta GS_R =new GS_Respuesta(Descripcion, Codigo);
        Denuncias_M  Den= new Denuncias_M();
        Den.Respuesta_PreCont_Ciudadano(GS_R);
                
     }
    
    protected void Respuesta_Finalizar_Ciudadano(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
        HttpSession datt = request.getSession();
        
        String Descripcion;
        int Codigo ;
        
        Descripcion= request.getParameter("Descripcion_RC");
        Codigo = Integer.parseInt(request.getParameter("Codigo_RC"));
        GS_Respuesta GS_R =new GS_Respuesta(Descripcion, Codigo);
        Denuncias_M  Den= new Denuncias_M();
        Den.Respuesta_Finalizar_Ciudadano(GS_R);
                
     }
    
    protected void Ingreso_Denuncias(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Direccion,Descripcion,Correo;
        
        Direccion= request.getParameter("Direccion");
        Descripcion= request.getParameter("Descripcion");
        Part Evidencia= request.getPart("Evidencia");
        Correo= request.getParameter("Email");
        String NameFoto= Evidencia.getSubmittedFileName();
        int i = NameFoto.lastIndexOf("\\");
        String nuevo_nom = NameFoto.substring(i+1);
        String Name= Direccion+"_"+nuevo_nom;
        
        String url= "C:\\xampp\\htdocs\\Java\\NetBeansProjects\\MAppets\\web\\Uploads\\"+Name;
        String url2= "Uploads/"+Name;
        
        InputStream file= Evidencia.getInputStream();
        File img=new File(url);
        FileOutputStream sal=new FileOutputStream(img);
        int num= file.read();
        
        while (num !=-1) {            
            sal.write(num);
            num= file.read();
        }
        
        GS_Denuncias GSD = new GS_Denuncias(Direccion, Descripcion, url2, Correo);
        Denuncias_M  DM = new Denuncias_M();
        int x;
        x= DM.InsertarDenuncias(GSD);
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
        out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
        out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
        out.println("</head>");
        out.println("<body>");
        out.print("<script type='text/javascript'> alertify.alert('Su denuncia ha sido enviada, recuerda que dependiendo el caso, su denuncia sera atendida',function(){"
                + "window.location.href = 'index.jsp'}); </script>");
        out.println("<script src='Estilos/JS/jquery.min.js'></script>");
        out.println("</body>");
        out.println("</html>");
        
    }
    
    protected void Ingreso_Denuncias2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Direccion,Documento,Fecha,Descripcion;
        
        Direccion= request.getParameter("Direccion");
        Descripcion= request.getParameter("Descripcion");
        Part Evidencia= request.getPart("Evidencia");
        Documento= request.getParameter("Documento");
        String NameFoto= Evidencia.getSubmittedFileName();
        int i = NameFoto.lastIndexOf("\\");
        String nuevo_nom = NameFoto.substring(i+1);
        String Name= Direccion+"_"+nuevo_nom;
        
        String url= "C:\\xampp\\htdocs\\Java\\NetBeansProjects\\MAppets\\web\\Uploads\\"+Name;
        String url2= "Uploads/"+Name;
        InputStream file= Evidencia.getInputStream();
        File img=new File(url);
        FileOutputStream sal=new FileOutputStream(img);
        int num= file.read();
        
        while (num !=-1) {            
            sal.write(num);
            num= file.read();
        }
        
        GS_Denuncia_Cliente GSD=new GS_Denuncia_Cliente(0, Direccion, Descripcion, url2, Documento);
        Denuncias_M  Den= new Denuncias_M();
        Den.InsertarDenunciasC(GSD);
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
        out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
        out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
        out.println("</head>");
        out.println("<body>");
        out.print("<script type='text/javascript'> alertify.alert('Su denuncia ha sido enviada, recuerda que dependiendo el caso, su denuncia sera atendida',function(){"
                + "window.location.href = 'Menu-Ciudadano.jsp'}); </script>");
        out.println("<script src='Estilos/JS/jquery.min.js'></script>");
        out.println("</body>");
        out.println("</html>");
        
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
