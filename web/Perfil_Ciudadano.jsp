<%-- 
    Document   : Perfil_Ciudadano
    Created on : 6/02/2019, 09:40:09 AM
    Author     : User
--%>

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
        <link rel="stylesheet" href="Estilos/CSS/Perfil_Ciudadano.css">
        <script type="text/javascript" src="Estilos/JS/jquery.js"></script>
        <script type="text/javascript" src="Estilos/JS/E_Perfil_Ciudadano.js"></script>
    </head>
    <body>
        <div class="Barra">
            <a href="Menu-Ciudadano.jsp"><span class="fa fa-home"></span></a>
        </div>
        <div class="Caja-Perfil">
                <%
                    HttpSession Doc=request.getSession();
                    String Documento=(String)Doc.getAttribute("DocumentoSession");
                    GS_Ciudadano inggs = new GS_Ciudadano(Documento);
                    ArrayList<GS_Ciudadano> datos = new ArrayList<>();
                    Ciudadano_M con = new Ciudadano_M();
                    datos = con.Uno_Ciudadano(inggs);
                    

                    for(int i=0; i<datos.size(); i++){
                        inggs = datos.get(i);
                        
                %>
            <div class="Perfil-C">
            <form action="Servlet_Login" method="post" enctype="multipart/form-data">
                <div class="Imagen">
                    <div id="Vista_Previa">
                        <img src="Estilos/Imagenes/Perfil.png<%-- <%= inggs.getFoto()%> --%>">
                    </div>
                    <label  class="fa fa-camera">
                        <input type="hidden" class="Foto1" value="<%= inggs.getFoto()%>">
                        <input  class="Foto" id="Foto" type="file" name="Foto" accept="image/jpg, image/jpeg, image/png">
                    </label>
                </div>
                <div class="Datos">
                    <label>Documento </label>
                    <input type="text" class="Documento" name="Documento" value="<%= inggs.getDocumento()%>" readonly >
                    <label>Tipo de Documento </label>
                    <input type="text" name="Tipo" value="<%= inggs.getTipo_Documento()%>" readonly>
                    <label>Genero </label>
                    <input type="text" name="Genero" value="<%= inggs.getGenero()%>" readonly>
                    <label>Fecha de Nacimiento </label>	
                    <input type="text" name="Fecha" value="<%= inggs.getNacimiento()%>" readonly>
                    <label>Direccion</label>
                    <input class="Mo" type="text" name="Direccion" value="<%= inggs.getDireccion()%>" required>
                    <label>Barrio</label>
                    <input class="Mo" type="text" name="Barrio" value="<%= inggs.getBarrio()%>" required>
                    <label>Celular</label>
                    <input class="Mo" type="text" name="Celular" pattern="[0-9]{5,10}" value="<%= inggs.getCelular()%>" required>
                    <label>Telefono</label>
                    <input class="Mo" type="text" name="Telefono" value="<%= inggs.getFijo()%>" required>
                    <label>Ocupacion</label>
                    <input class="Mo" type="text" name="Ocupacion" value="<%= inggs.getOcupacion()%>" required>
                    <label>Correo</label>
                    <input class="Mo" type="email" name="Correo" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%= inggs.getCorreo()%>" required>
                    <div class="btn-Act">
                        <input class="btn-Actualizar" type="submit" name="Actualizar" value="Actualizar">
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
                    <label class="titulo">Usuario</label>
                    <%
                        ArrayList<GS_Login> datos2 = new ArrayList<>();
                        Login_M con2 = new Login_M();
                        datos2 = con2.Uno_Usuario(Documento);
                        GS_Login ing = new GS_Login();

                        for(int i=0; i<datos2.size(); i++){
                            ing = datos2.get(i);
                    %>
                    <label><%= ing.getUsuario()%></label>
                    <input type="password" name="Contraseña" value="<%= ing.getClave()%>">
                    <input type="submit" name="Act-Contraseña" value="Cambiar?">
                    <% } %>
                </div>
            </div>
        </div>
    </body>
</html>
