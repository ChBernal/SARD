<%-- 
    Document   : Mascotas-Proceso
    Created on : 21/03/2019, 11:30:18 AM
    Author     : User
--%>

<%@page import="Modelo.GS_Mascota"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Mascota_M"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="UTF-8">
        <title>MAppets</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
	<link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/CSS/Mascotas_Proceso.css">
        <script type="text/javascript" src="Estilos/JS/jquery.js"></script>
        <script type="text/javascript" src="Estilos/JS/Mascotas_Proceso.js"></script>
    </head>
    <body>
        <div class="Barra">
            <a href="Menu-Admin.jsp"><span class="fa fa-home"></span></a>
        </div>
        <div class="Container-Mascotas">
            <div class="titulo">
                <h1>Mascotas en proceso</h1>
            </div>
            <div class="Mascotas-Proceso">
                <%
                    Mascota_M MM = new Mascota_M();
                    ArrayList<GS_Mascota> Tabla_mascota = new ArrayList<>();    
                    GS_Mascota Mas = new GS_Mascota();
                    Tabla_mascota = MM.Mascota_Proceso();

                    for (int i = 0; i < Tabla_mascota.size();i++){
                        Mas = Tabla_mascota.get(i);

                %>
                <div class="Mascotas">
                    <div class="ImagenM">
                        <img src="<%= Mas.getFoto()%>">
                    </div>
                    <div class="DatosM">
                        <h2><%= Mas.getNombre()%></h2>
                        <label><%= Mas.getFecha_Nacimiento()%></label>
                        <label><%= Mas.getGenero()%></label>
                        <label><%= Mas.getRaza()%></label>
                        <label><%= Mas.getColor()%></label>
                    </div>
                </div>
                <div class="Container-Oculto">
                    <div class="Oculto">
                        <form action="Ciudadanos-Postulados.jsp" method="post">
                            <label>Desea ver los postulados a <%= Mas.getNombre()%>?</label>
                            <div class="btn">
                                <input type="hidden" name="Codigo" value="<%= Mas.getDocumento()%>">
                                <input class="btn-M" type="submit" name="boton-" value="Si">
                                <a class="btn-M">No</a>
                            </div>
                        </form>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </body>
</html>
