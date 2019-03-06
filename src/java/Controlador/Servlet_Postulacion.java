/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.GS_Postulaciones;
import Modelo.GS_Preguntas_Postulacion;
import Modelo.Postulacion_M;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
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
    }
        protected void Insertar_Postulacion_Pre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,Docu;
        
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
        response.sendRedirect("Menu-Ciudadano.jsp");
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
