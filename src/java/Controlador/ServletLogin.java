package Controlador;

import Modelo.Admin_M;
import Modelo.Ambiente_Salud_M;
import Modelo.Ciudadano_;
import Modelo.GS_Admin;
import Modelo.GS_Ambiente_Salud;
import Modelo.GS_Ciudadano;
import Modelo.GS_Login;
import Modelo.Login_M;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {
    private int Rol;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if (request.getParameter("Ingresar") != null){
            Rol = this.Login(request, response);
            switch (Rol){
                case 1:
                    this.Datos_Admin(request, response);
                    response.sendRedirect("Menu-Admin.jsp");
                    break;
                case 2:
                    this.Datos_SA(request, response);
                    response.sendRedirect("Menu-SA.jsp");
                    break;
                case 3:
                    break;
                case 4:
                    break;
                case 5:
                    this.Datos_Ciudadano(request, response);
                    response.sendRedirect("Menu-Ciudadano.jsp");
                    break;
                default:
                    JOptionPane.showMessageDialog(null, "Datos incorrectos");
                    response.sendRedirect("index.jsp");
                    
            }
        }
        if (request.getParameter("UsuarioContrasena")!=null) {
            Actualizar_Contraseña(request, response);
        }
    }
    
    protected void Actualizar_Contraseña(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Usuario,Contraseña_Antigua, Contraseña1,Contraseña2;
        int Rol = Integer.parseInt(request.getParameter("Rol"));
        Usuario = request.getParameter("Documento");
        Contraseña_Antigua = request.getParameter("ClaveAntigua");
        Contraseña1 = request.getParameter("ClaveNueva");
        Contraseña2 = request.getParameter("RepetirClave");
        
        /* VALIDAR CONTRASEÑA ANTIGUA*/
        Login_M Login = new Login_M();
        ArrayList<GS_Login> Antigua = new ArrayList<>();
        Antigua = Login.Uno_Usuario(Usuario);
        GS_Login GSL = new GS_Login();

        for(int i=0; i<Antigua.size(); i++){
            GSL= Antigua.get(i);
        }
        String C_Antigua =GSL.getClave();
        int Ingreso = GSL.getEstado()+1;
        
        if (Contraseña_Antigua.equals(C_Antigua)) {
            
             if (Contraseña1.equals(C_Antigua)) {
                JOptionPane.showMessageDialog(null,"Tu nueva contraseña no puede ser igual a la anterior");
            }
            else{
               if (Contraseña1.equals(Contraseña2)) {
                    GS_Login GS_C1= new GS_Login(Usuario, Contraseña1, Ingreso);
                    Login.Actualizar_Contraseña(GS_C1);
                    JOptionPane.showMessageDialog(null, "Tu contraseña ha sido Actualizada con exito");
                }
                else{
                    JOptionPane.showMessageDialog(null, "La contraseña Nueva y la confirmación no coinciden");
                }
            }
           
        }
        else{
            JOptionPane.showMessageDialog(null, "La Contraseña Actual no coincide con la digitada");
        }
       
        if (Rol==1) {
          response.sendRedirect("Menu-Admin.jsp");  
        }
        if (Rol==2) {
          response.sendRedirect("Menu-SA.jsp");  
        }
        if (Rol==3) {
          response.sendRedirect("Menu-SA.jsp");  
        }
        if (Rol==4) {
          response.sendRedirect("");  
        }
        if (Rol==5) {
          response.sendRedirect("Menu-Ciudadano.jsp");  
        }
    }
    protected int Login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Usuario,Clave;
        Usuario = request.getParameter("Usuario");
        Clave = request.getParameter("Clave");
        GS_Login GSL = new GS_Login(Usuario, Clave);
        Login_M LM = new Login_M();
        Rol = LM.Rol(GSL);
        HttpSession Datos1 = request.getSession();
        Datos1.setAttribute("DocumentoSession", Usuario);
        Datos1.setAttribute("ClaveSession", Clave);
        return Rol;
    }
    
    protected void Datos_Admin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Documento = request.getParameter("Usuario");
        String Nombre = null;
        GS_Admin GSA = new GS_Admin(Documento);
        Admin_M AM = new Admin_M();
        ArrayList<GS_Admin> Datos_Admin = new ArrayList<>();
        Datos_Admin = AM.Uno_Admin(GSA);
        
        if (Datos_Admin.size()>0){
            for (int i = 0; i < Datos_Admin.size(); i++){
                GSA = Datos_Admin.get(i);
                Nombre = GSA.getNombre();
            }
        }
        HttpSession Datos = request.getSession();
        Datos.setAttribute("NombreSession", Nombre);
        Datos.setAttribute("DocumentoSession", Documento);
    }
    
    protected void Datos_Ciudadano(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Documento = request.getParameter("Usuario");
        String Nombre = null;
        GS_Ciudadano GSC = new GS_Ciudadano(Documento);
        Ciudadano_ CM = new Ciudadano_();
        ArrayList<GS_Ciudadano> Datos_Ciudadano = new ArrayList<>();
        Datos_Ciudadano = CM.Uno_Ciudadano(GSC);
        
        if (Datos_Ciudadano.size()>0){
            for (int i = 0; i < Datos_Ciudadano.size(); i++){
                GSC = Datos_Ciudadano.get(i);
                Nombre = GSC.getNombre();
            }
        }
        HttpSession Datos = request.getSession();
        Datos.setAttribute("NombreSession", Nombre);
        Datos.setAttribute("DocumentoSession", Documento);
    }
    
    protected void Datos_SA(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Documento = request.getParameter("Usuario");
        String Nombre = null;
        GS_Ambiente_Salud GSAS = new GS_Ambiente_Salud(Documento);
        Ambiente_Salud_M SASS = new Ambiente_Salud_M();
        ArrayList<GS_Ambiente_Salud> Datos_SASS = new ArrayList<>();
        Datos_SASS = SASS.Uno_Ambiente(GSAS);
        
        if (Datos_SASS.size()>0){
            for (int i = 0; i < Datos_SASS.size(); i++){
                GSAS = Datos_SASS.get(i);
                Nombre = GSAS.getNombre();
                JOptionPane.showMessageDialog(null, Nombre);
            }
        }
        HttpSession Datos = request.getSession();
        Datos.setAttribute("NombreSession", Nombre);
        Datos.setAttribute("DocumentoSession", Documento);
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
