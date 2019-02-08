/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.GS_Estado_Mascota;
import Modelo.GS_Existente;
import Modelo.GS_Mascota;
import Modelo.Mascota_M;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "Servlet_Mascota", urlPatterns = {"/Servlet_Mascota"})
public class Servlet_Mascota extends HttpServlet {

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
        
         if (request.getParameter("Registro-Mascota") != null){
            this.InsertarMascota(request, response);
        }
    }
     protected void InsertarMascota(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String TipoMascota,Nombre,FechaNacimiento,Color,Raza,Sexo,Dueno,Documento,Estado;
        int  Codigo ;
        
        TipoMascota = request.getParameter("Tipo-Mascota");
        Nombre = request.getParameter("Nombre-Mascota");
        FechaNacimiento = request.getParameter("Nacimiento-Mascota");
        Color = request.getParameter("Color-Mascota");
        Raza = request.getParameter("Raza-Mascota");
        Sexo = request.getParameter("Genero-Mascota");
        Estado = request.getParameter("Estado-Mascota");
        Documento = request.getParameter("Documento-Duenno");
        Part Foto = request.getPart("Foto-Mascota");
        String Nombre_F = Foto.getSubmittedFileName();
        String Foto_Name = Nombre+"_"+Nombre_F;
        JOptionPane.showMessageDialog(null, TipoMascota);
        String url = "C:\\xampp\\htdocs\\Java\\NetBeansProjects\\MAppets\\web\\Uploads\\"+Foto_Name;
        String url2 = "Uploads\\"+Foto_Name;

        InputStream file= Foto.getInputStream();
        File img=new File(url);
        FileOutputStream sal=new FileOutputStream(img);
        int num= file.read();

        while (num !=-1) {            
            sal.write(num);
            num= file.read();
        }
        
        Mascota_M MM = new Mascota_M();
        GS_Existente GS_E =new GS_Existente(Nombre, Documento, FechaNacimiento, TipoMascota);
        
        int Existe =MM.Existente(GS_E);
         if (Existe==0) {
             GS_Mascota GS_M = new GS_Mascota(TipoMascota, Nombre, FechaNacimiento, Color, Raza, Sexo, url2);
             MM.In_Mascota(GS_M);
             
            int Codigo_Mascota =0;
            GS_Mascota GS_MA = new GS_Mascota(Nombre,Raza, FechaNacimiento);
            Codigo_Mascota = MM.Ultima_Mascota(GS_MA);
            GS_Mascota GS_MAS = new GS_Mascota();   
            JOptionPane.showMessageDialog(null, Codigo_Mascota);
             
            int Valor_Estado;
             if(Estado.equalsIgnoreCase("Adoptado")){
                 Valor_Estado=1;
                 Documento = "0";
                 GS_Estado_Mascota GS_EM =new GS_Estado_Mascota(Valor_Estado,Codigo_Mascota,Documento );
             }
             else if(Estado.equalsIgnoreCase("Con Propietario")){
                 Valor_Estado=2;
                 GS_Estado_Mascota GS_EM =new GS_Estado_Mascota(Valor_Estado,Codigo_Mascota, Documento);
             }
             if (Estado.equalsIgnoreCase("Disponible")) {
                 Valor_Estado=3;
                 Documento = "0";
                 GS_Estado_Mascota GS_EM =new GS_Estado_Mascota(Valor_Estado,Codigo_Mascota, Documento);
             }
             else if(Estado.equalsIgnoreCase("En Proceso")){
                 Valor_Estado=4;
                 Documento = "0";
                 GS_Estado_Mascota GS_EM =new GS_Estado_Mascota(Valor_Estado,Codigo_Mascota, Documento);
             }
         }
         else{
            JOptionPane.showMessageDialog(null,"La mascota ya esta registrada");
         }
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
