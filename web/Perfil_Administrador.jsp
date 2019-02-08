<%-- 
    Document   : Perfil_Ciudadano
    Created on : 6/02/2019, 09:40:09 AM
    Author     : User
--%>

<%@page import="Modelo.Admin_M"%>
<%@page import="Modelo.GS_Admin"%>
<%@page import="Modelo.Login_M"%>
<%@page import="Modelo.GS_Login"%>
<%@page import="Modelo.Ciudadano_M"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.GS_Ciudadano"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="UTF-8">
        <title>MAppets</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
	<link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/CSS/Perfil_Administrador.css">
        <script type="text/javascript" src="Estilos/JS/jquery.js"></script>
        <script type="text/javascript" src="Estilos/JS/E_Perfil_Administrador.js"></script>
    </head>
    <body>
        <div class="Barra">
            <a href="Menu-Ciudadano.jsp"><span class="fa fa-home"></span></a>
        </div>
        <div class="Caja-Perfil">
                <%
                    HttpSession Doc2=request.getSession();
                    String Documento=(String)Doc2.getAttribute("DocumentoSession");
                    String Clave=(String)Doc2.getAttribute("ClaveSession");
                    GS_Admin inggs = new GS_Admin(Documento);
                    ArrayList<GS_Admin> datos = new ArrayList<>();
                    Admin_M con = new Admin_M();
                    datos = con.Uno_Admin(inggs);
                    

                    for(int i=0; i<datos.size(); i++){
                        inggs = datos.get(i);
                        
                %>
            <div class="Perfil-C">
                <form action="Servlet_Administrador" method="post" enctype="multipart/form-data">
                <div class="Imagen">
                    <div id="Vista_Previa">
                        <img src="<%= inggs.getFoto()%>">
                    </div>
                    <label  class="fa fa-camera">
                        <input type="hidden" class="Foto1" value="<%= inggs.getFoto()%>">
                        <input  class="Foto" id="Foto" type="file" name="Foto_A" accept="image/jpg, image/jpeg, image/png">
                    </label>
                </div>
                <div class="Datos">
                    <label>Documento </label>
                    <input type="text" class="Documento" id="Documento" name="Documento_A" value="<%= inggs.getDocumento()%>" readonly >
                    <input type="hidden" id="Nombre"  name="Nombre_A" value="<%=inggs.getNombre()%>">
                    <label>Tipo de Documento </label>
                    <input type="text" name="Tipo" value="<%= inggs.getTipo_Documento()%>" readonly>
                    <label>Genero </label>
                    <input type="text" name="Genero" value="<%= inggs.getGenero()%>" readonly>
                    <label>Fecha de Nacimiento </label>	
                    <input type="text" name="Fecha" value="<%= inggs.getNacimiento()%>" readonly>
                    <label>Direccion</label>
                    <input class="Mo" id="Direccion" type="text" name="Direccion_A" value="<%= inggs.getDireccion()%>" required>
                    <label>Telefono</label>
                    <input class="Mo" id="Telefono2" type="text" name="Telefono2_A" value="<%= inggs.getTelefono()%>" required>
                    <label>Correo</label>
                    <input class="Mo" id="Correo" type="email" name="Correo_A" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%= inggs.getCorreo()%>" required>
                    <div class="btn-Act">
                        <input class="btn-Actualizar" type="submit" name="Actualizar_A" value="Actualizar">
                        <a href="#Mostrar-Cuenta" class="btn-Cambiar">Cambiar Contraseña?</a>
                    </div>
                </div>
                </form>
                <button class="btn-Editar">Editar</button>
            </div>
                <%
                    }
                %>
            <div id="Mostrar-Cuenta">
                <div class="Cuenta">
                    <div class="icons"><a href="Perfil_Administrador.jsp"><span class="fa fa-close"></a></span></div>
                    <h2>Usuario</h2>
                    <label class="Advertencia">Recuerda que solo puedes cambiar tu contraseña, porque el usuario siempre sera tu documento de identidad.</label>
                    <form action="Servlet_Contrasena" method="post">
                        <div class="Inputs">
                            <input type="hidden" name="Usuario_Administrador" value="<%= Documento%>">
                            <input type="hidden" name="Clave_Administrador" value="<%= Clave%>">
                            <label>Contraseña Actual:</label>
                            <input type="password" name="Contrasena_Actual">
                            <label>Nueva Contraseña:</label>
                            <input type="password" name="Contrasena_Nueva">
                            <label>Repetir Contraseña:</label>
                            <input type="password" name="Contrasena_Nueva2">
                            <input class="Boton-Act" type="submit" name="Act-Contrasena" value="Cambiar">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
