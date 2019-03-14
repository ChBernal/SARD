/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.GS_Postulacion;
import Modelo.GS_Preguntas_Postulacion;
import Modelo.Postulacion_M;
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

/**
 *
 * @author User
 */
@MultipartConfig
@WebServlet(name = "Servlet_Postulacion", urlPatterns = {"/Servlet_Postulacion"})
public class Servlet_Postulacion extends HttpServlet {

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
        
        if (request.getParameter("btn-Postulacion") != null) {
            this.Insertar_Postulacion_Pre(request, response);
        }
        if (request.getParameter("btn-Fin-Postulacion") != null) {
            this.Insertar_Postulacion_Final(request, response);
        }
    }
        protected void Insertar_Postulacion_Pre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,Docu;
        int Codi;
        
        Codi= Integer.parseInt(request.getParameter("Codigo"));
        HttpSession Datos1 = request.getSession();
        Datos1.setAttribute("Codigo_M", Codi);
        R1= request.getParameter("Res1");
        R2= request.getParameter("Res2");
        R3= request.getParameter("Res3");
        R4= request.getParameter("Res4");
        R5= request.getParameter("Res5");
        R6= request.getParameter("Res6");
        R7= request.getParameter("Res7");
        R8= request.getParameter("Res8");
        R9= request.getParameter("Res9");
        R10= request.getParameter("Res10");
        R11= request.getParameter("Res11");
        R12= request.getParameter("Res12");
        R13= request.getParameter("Res13");
        R14= request.getParameter("Res14");
        R15= request.getParameter("Res15");
        R16= request.getParameter("Res16");
        R17= request.getParameter("Res17");
        R18= request.getParameter("Res18");
        R19= request.getParameter("Res19");
        R20= request.getParameter("Res20");
        Docu= request.getParameter("Documento");
        
        Postulacion_M EM = new Postulacion_M();
        GS_Preguntas_Postulacion GSE = new GS_Preguntas_Postulacion(R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, Docu);
        EM.InsertarPostulacion(GSE);
        response.sendRedirect("Postulacion.jsp");
    }
    protected void Insertar_Postulacion_Final(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String Documento;
        int Codi;
        
        Documento= request.getParameter("Docu");
        Codi= Integer.parseInt(request.getParameter("Codi"));
        Part Cedula = request.getPart("Cedula");
        Part Recibo = request.getPart("Recibo");
        String Nombre_C = Cedula.getSubmittedFileName();
        String Nombre_R = Recibo.getSubmittedFileName();
        String Foto_Name_C = Documento+"_"+Nombre_C;
        String Foto_Name_R = Documento+"_"+Nombre_R;
        
        String urlCed = "C:\\xampp\\htdocs\\Java\\NetBeansProjects\\MAppets\\web\\Uploads\\"+Foto_Name_C;
        String urlCed2 = "Uploads\\"+Foto_Name_C;
        
        String urlRec = "C:\\xampp\\htdocs\\Java\\NetBeansProjects\\MAppets\\web\\Uploads\\"+Foto_Name_R;
        String urlRec2 = "Uploads\\"+Foto_Name_R;

        InputStream fileCed= Cedula.getInputStream();
        File imgCed=new File(urlCed);
        FileOutputStream sal=new FileOutputStream(imgCed);
        int num= fileCed.read();
        
        while (num !=-1) {            
            sal.write(num);
            num= fileCed.read();
        }
        
        InputStream fileRec= Cedula.getInputStream();
        File imgRec=new File(urlCed);
        FileOutputStream salRec=new FileOutputStream(imgRec);
        int numRec= fileRec.read();
        
        while (numRec !=-1) {            
            salRec.write(numRec);
            numRec= fileRec.read();
        }
        
        Postulacion_M EM = new Postulacion_M();
        GS_Postulacion GSE = new GS_Postulacion(Documento, Codi, urlCed2, urlRec2, 1);
        int x;
        x= EM.InsertarPostulacionFinal(GSE);
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<link rel='stylesheet' href='Estilos/alertifyjs/css/alertify.css'>");
        out.println("<link rel='stylesheet' href='Estilos/CSS/EsttilosBody.css'>");
        out.println("<script src='Estilos/alertifyjs/alertify.js'></script>");
        out.println("</head>");
        out.println("<body>");
        out.print("<script type='text/javascript'> alertify.alert('Gracias por seguir y completar todos los procesos, dentro de un tiempo te envian una cita de encuentro',function(){"
                + "window.location.href = 'index.jsp'}); </script>");
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
