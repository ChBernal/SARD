<%-- 
    Document   : Postulacion
    Created on : 6/03/2019, 08:47:04 AM
    Author     : User
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession Dat = request.getSession();
    int Doc=(Integer)Dat.getAttribute("Codigo_M");
%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
	<link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/CSS/Postulacion.css">
        <script type="text/javascript" src="Estilos/JS/jquery.js"></script>
        <script type="text/javascript" src="Estilos/JS/Mascotas_Ciudadano.js"></script>
        <title>MAppets</title>
    </head>
    <body>
        <div class="Barra">
            <a href="Menu-Ciudadano.jsp"><span class="fa fa-home"></span></a>
        </div>
        <div class="Contenedor-Postulacion">
            <div class="Contenido-Postulacion">
                
            </div>
        </div>
    </body>
</html>
