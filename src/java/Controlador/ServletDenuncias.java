package Controlador;

import Modelo.Denuncias_M;
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
        if (request.getParameter("Boton").equalsIgnoreCase("Anonima")) {
            this.Respuesta_Anonima(request, response);
        }
    }
    protected void Respuesta_Anonima(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
        HttpSession datt = request.getSession();
        
        String Descripcion;
        int Codigo ;
        
        Descripcion= request.getParameter("Descripcion_RA");
        if (Descripcion.equalsIgnoreCase("")) {
            Descripcion="aQUI HAY QUE PONER LA RESPUESTA PREDETERMINADA ";
        }
        Codigo = Integer.parseInt(request.getParameter("Codigo_RA"));
         GS_Respuesta GS_R =new GS_Respuesta(Descripcion, Codigo);
        Denuncias_M  Den= new Denuncias_M();
        Den.Respuesta_Denuncia(GS_R);        
        
                
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
        DM.InsertarDenuncias(GSD);
        request.getRequestDispatcher("index.jsp").forward(request, response);    
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
