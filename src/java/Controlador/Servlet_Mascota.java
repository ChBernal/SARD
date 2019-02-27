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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

@MultipartConfig
@WebServlet(name = "Servlet_Mascota", urlPatterns = {"/Servlet_Mascota"})
public class Servlet_Mascota extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         if (request.getParameter("Registro-Mascota") != null){
            this.InsertarMascota(request, response);
        }
         if (request.getParameter("Registro-Mascota-C") != null){
            this.InsertarMascotaC(request, response);
        }
         if (request.getParameter("Actualizar-Mascota-C") != null){
            this.AcyualizarMascotaC(request, response);
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
        
        int Existe = MM.Existente(GS_E);
         if (Existe==0) {
             
             GS_Mascota GS_M = new GS_Mascota(TipoMascota, Nombre, FechaNacimiento, Color, Raza, Sexo, url2);
             MM.In_Mascota(GS_M);
             
            int Codigo_Mascota;
            GS_Mascota GS_MA = new GS_Mascota(Nombre,FechaNacimiento,Raza);
            Codigo_Mascota = MM.Ultima_Mascota(GS_MA);
            GS_Mascota GS_MAS = new GS_Mascota();   
             JOptionPane.showMessageDialog(null, Codigo_Mascota);
            int Valor_Estado;
             if(Estado.equalsIgnoreCase("Adoptado")){
                 Valor_Estado=1;
                 GS_Estado_Mascota GS_EM =new GS_Estado_Mascota(Valor_Estado,Codigo_Mascota,Documento );
                 MM.Registro_Estado(GS_EM);
             }
             else if(Estado.equalsIgnoreCase("Con Propietario")){
                 Valor_Estado=2;
                 GS_Estado_Mascota GS_EM =new GS_Estado_Mascota(Valor_Estado,Codigo_Mascota, Documento);
                 MM.Registro_Estado(GS_EM);
             }
             if (Estado.equalsIgnoreCase("Disponible")) {
                 Valor_Estado=3;
                 Documento = "0";
                 GS_Estado_Mascota GS_EM =new GS_Estado_Mascota(Valor_Estado,Codigo_Mascota, Documento);
                 MM.Registro_Estado(GS_EM);
             }
             else if(Estado.equalsIgnoreCase("En Proceso")){
                 Valor_Estado=4;
                 Documento = "0";
                 GS_Estado_Mascota GS_EM =new GS_Estado_Mascota(Valor_Estado,Codigo_Mascota, Documento);
                 MM.Registro_Estado(GS_EM);
             }
         }else{
            JOptionPane.showMessageDialog(null,"La mascota ya esta registrada");
         }
        response.sendRedirect("Menu-Admin.jsp");
        
    }
    protected void InsertarMascotaC(HttpServletRequest request, HttpServletResponse response)
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
        Documento = request.getParameter("Documento-Duenno");
        Part Foto = request.getPart("Foto-Mascota");
        String Nombre_F = Foto.getSubmittedFileName();
        String Foto_Name = Nombre+"_"+Nombre_F;
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
        
        int Existe = MM.Existente(GS_E);
         if (Existe==0) {
             
             GS_Mascota GS_M = new GS_Mascota(TipoMascota, Nombre, FechaNacimiento, Color, Raza, Sexo, url2);
             MM.In_Mascota(GS_M);
             
            int Codigo_Mascota;
            GS_Mascota GS_MA = new GS_Mascota(Nombre,FechaNacimiento,Raza);
            Codigo_Mascota = MM.Ultima_Mascota(GS_MA);
            GS_Mascota GS_MAS = new GS_Mascota();   
             JOptionPane.showMessageDialog(null, Codigo_Mascota);
            GS_Estado_Mascota GS_EM =new GS_Estado_Mascota(2,Codigo_Mascota, Documento);
            MM.Registro_Estado(GS_EM);
         }else{
            JOptionPane.showMessageDialog(null,"La mascota ya esta registrada");
         }
        response.sendRedirect("Mascotas_Ciudadano.jsp");
        
    }
    protected void AcyualizarMascotaC(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String TipoMascota,Nombre,FechaNacimiento,Color,Raza,Sexo,Dueno,Documento,Estado;
        int  Codigo ;
        
        Codigo = Integer.parseInt(request.getParameter("Codigo-Mascota"));
        TipoMascota = request.getParameter("Tipo-Mascota");
        Nombre = request.getParameter("Nombre-Mascota");
        FechaNacimiento = request.getParameter("Nacimiento-Mascota");
        Color = request.getParameter("Color-Mascota");
        Raza = request.getParameter("Raza-Mascota");
        Sexo = request.getParameter("Genero-Mascota");
        String FotoA = request.getParameter("FotoActual");
        Part Foto = request.getPart("Foto-Mascota");
        String Nombre_F = Foto.getSubmittedFileName();
        String Foto_Name = Nombre+"_"+Nombre_F;
        
        if (Nombre_F!="") {
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
            GS_Mascota mas=new GS_Mascota(Codigo, TipoMascota, Nombre, FechaNacimiento, Color, Raza, Sexo, url2);
            Mascota_M MM = new Mascota_M();
            int x= MM.Ac_Mascota(mas);
            if (x>0) {
                JOptionPane.showMessageDialog(null, "Mascota Actualizada");
            }else{
                JOptionPane.showMessageDialog(null, "Error");
            }
            
            response.sendRedirect("Mascotas_Ciudadano.jsp");
        }
        else{
            String url2= FotoA;
            GS_Mascota mas=new GS_Mascota(Codigo, TipoMascota, Nombre, FechaNacimiento, Color, Raza, Sexo, url2);
            Mascota_M MM = new Mascota_M();
            int x= MM.Ac_Mascota(mas);
            if (x>0) {
                JOptionPane.showMessageDialog(null, "Mascota Actualizada");
            }else{
                JOptionPane.showMessageDialog(null, "Error");
            }
            response.sendRedirect("Mascotas_Ciudadano.jsp");
        } 
        
        
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
