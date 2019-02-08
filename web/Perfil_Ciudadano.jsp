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
                <form action="ServletUsuario" method="post" enctype="multipart/form-data">
                <div class="Imagen">
                    <div id="Vista_Previa">
                        <img src="Estilos/Imagenes/Perfil.png<%-- <%= inggs.getFoto()%> --%>">
                    </div>
                    <label  class="fa fa-camera">
                        <input type="hidden" class="Foto1" value="<%= inggs.getFoto()%>">
                        <input  class="Foto" id="Foto" type="file" name="Foto_C" accept="image/jpg, image/jpeg, image/png">
                    </label>
                </div>
                <div class="Datos">
                    <label>Documento </label>
                    <input type="text" class="Documento" id="Documento" name="Documento_C" value="<%= inggs.getDocumento()%>" readonly >
                    <input type="hidden" id="Nombre"  name="Nombre_C" value="<%=inggs.getNombre()%>">
                    <label>Tipo de Documento </label>
                    <input type="text" name="Tipo" value="<%= inggs.getTipo_Documento()%>" readonly>
                    <label>Genero </label>
                    <input type="text" name="Genero" value="<%= inggs.getGenero()%>" readonly>
                    <label>Fecha de Nacimiento </label>	
                    <input type="text" name="Fecha" value="<%= inggs.getNacimiento()%>" readonly>
                    <label>Direccion</label>
                    <input class="Mo" id="Direccion" type="text" name="Direccion_C" value="<%= inggs.getDireccion()%>" required>
                    <label>Barrio</label>
                    <input class="Mo" id="Barrio" type="text" name="Barrio_C" value="<%= inggs.getBarrio()%>" required>
                    <label>Celular</label>
                    <input class="Mo" id="Telefono1" type="text" name="Telefono1_C" pattern="[0-9]{5,10}" value="<%= inggs.getCelular()%>" required>
                    <label>Telefono</label>
                    <input class="Mo" id="Telefono2" type="text" name="Telefono2_C" value="<%= inggs.getFijo()%>" required>
                    <label>Ocupacion</label>
                    <input class="Mo"  id="Ocupacion" type="text" name="Ocupacion_C" value="<%= inggs.getOcupacion()%>" required>
                    <label>Correo</label>
                    <input class="Mo" id="Correo" type="email" name="Correo_C" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%= inggs.getCorreo()%>" required>
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
                    <div class="icons"><span class="fa fa-close"></span></div>
                    <h2>Usuario</h2>
                    <label class="Advertencia">Recuerda que solo puedes cambiar tu contraseña, porque el usuario siempre sera tu documento de identidad.</label>
                    <div class="Inputs">
                        <%
                            ArrayList<GS_Login> Datos_Login = new ArrayList<>();
                            Login_M  M_Lg = new Login_M();
                            Datos_Login = M_Lg.Uno_Usuario(Documento);
                            GS_Login GS_LG = new GS_Login();

                            for(int i=0; i<Datos_Login.size(); i++){
                                GS_LG = Datos_Login.get(i);
                        %>
                        <input type="hidden" class="Usuario_Cliente" value="<%=GS_LG.getUsuario()%>"
                        <input type="hidden" class="Clave_Cliente" value="<%=GS_LG.getClave()%>"
                        <%}%>
                        <label>Contraseña Actual:</label>
                        <input type="password" class="Contraseña_Actual" name="Contraseña">
                        <label>Nueva Contraseña:</label>
                        <input type="password" class="Contraseña_Nueva" name="Contraseña">
                        <input class="Boton-Act" type="submit" name="Act-Contraseña" value="Cambiar?">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
