package Controlador;

import Modelo.Eventos_M;
import Modelo.GS_Eventos;
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

@MultipartConfig
@WebServlet(name = "Servlet_Eventos", urlPatterns = {"/Servlet_Eventos"})
public class Servlet_Eventos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if (request.getParameter("Enviar") != null){
            this.InsertarEvento(request, response);
        }

    }
    
    protected void InsertarEvento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String NombreEvento, TipoEvento, FechaEvento, DescripcionEvento;
        
        NombreEvento = request.getParameter("NombreEvento");
        TipoEvento = request.getParameter("Tipo_Evento");
        FechaEvento = request.getParameter("Fecha_Evento");
        DescripcionEvento = request.getParameter("Descripcion");
        Part ImagenEvento = request.getPart("Imagen");
        
        String url= "C:\\xampp\\htdocs\\Java\\NetBeansProjects\\MAppets\\web\\Uploads\\"+ImagenEvento;
        String url2 = "Uploads\\"+ImagenEvento;
        
        InputStream file= ImagenEvento.getInputStream();
        File img=new File(url);
        FileOutputStream sal=new FileOutputStream(img);
        int num= file.read();
        
        while (num !=-1) {            
            sal.write(num);
            num= file.read();
        }
        
        Eventos_M EM = new Eventos_M();
        GS_Eventos GSE = new GS_Eventos(NombreEvento, TipoEvento, FechaEvento, DescripcionEvento, url2);
        EM.In_Eventos(GSE);
        response.sendRedirect("Menu-Admin.jsp");
        
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
