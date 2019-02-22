/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
@WebServlet(name = "Servlet_Mascota_Modal", urlPatterns = {"/Servlet_Mascota_Modal"})
public class Servlet_Mascota_Modal extends HttpServlet {
int Cd;
String Tm,N,FnM,C,R,G,F;
        
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
        
        ArrayList<GS_Mascota> datos=new ArrayList<>();
        int Doc= Integer.parseInt(request.getParameter("Id"));
        JOptionPane.showMessageDialog(null, Doc);
        GS_Mascota Masc=new GS_Mascota(Doc);
        Mascota_M dat=new Mascota_M();
        datos= dat.Uno_Mascota(Masc);
        
        for (int i = 0; i < datos.size(); i++) {
            Masc= datos.get(i);
            
            Cd= Masc.getDocumento();
            Tm= Masc.getTipo_Mascota();
            N= Masc.getNombre();
            FnM= Masc.getFecha_Nacimiento();
            C= Masc.getColor();
            R= Masc.getRaza();
            G= Masc.getGenero();
            F= Masc.getFoto();
        }
        response.getWriter().write(Cd+" ");
        response.getWriter().write(Tm+" ");
        response.getWriter().write(N+" ");
        response.getWriter().write(FnM+" ");
        response.getWriter().write(C+" ");
        response.getWriter().write(R+" ");
        response.getWriter().write(G+" ");
        response.getWriter().write(F+" ");
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
