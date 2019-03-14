<%-- 
    Document   : Postulacion
    Created on : 6/03/2019, 08:47:04 AM
    Author     : User
--%>

<%@page import="Modelo.Mascota_M"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.GS_Mascota"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession Dat = request.getSession();
    String Doc=(String)Dat.getAttribute("DocumentoSession");
    int Cod=(Integer)Dat.getAttribute("Codigo_M");
%>
<html lang="en">
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
        <div class="Container-Postulacion">
            <div class="Datos">
                <div class="Titulo"> <h1>Postulacion</h1> </div>
                <div class="Mascota">
                <%
                    GS_Mascota inggs = new GS_Mascota(Cod);
                    ArrayList<GS_Mascota> datos = new ArrayList<>();
                    Mascota_M con = new Mascota_M();
                    datos = con.Uno_Mascota(inggs);
                    

                    for(int i=0; i<datos.size(); i++){
                        inggs = datos.get(i);
                %>
                    <div class="ImagenM">
                        <img src="<%= inggs.getFoto()%>">
                    </div>
                    <div class="DatosM">
                        <h1><%= inggs.getNombre()%></h1>
                        <label><%= inggs.getFecha_Nacimiento() %></label>
                        <label><%= inggs.getGenero() %></label>
                        <label><%= inggs.getRaza() %></label>
                        <label><%= inggs.getColor() %></label>
                    </div>
                <%  } %>
                </div>
                
                <div class="Datos-Ciudadano">
                <form action="Servlet_Postulacion" method="POST" enctype="multipart/form-data">
                    <label>Adjuntar copia de la cedula</label>
                    <input type="file" name="Cedula" required accept="application/pdf">
                    <label>Adjuntar copia de un recibo publico</label>
                    <input type="file" name="Recibo" required accept="application/pdf">
                    <div class="Boton">
                        <input type="hidden" name="Codi" value="<%= Cod%>">
                        <input type="hidden" name="Docu" value="<%= Doc%>">
                        <input type="submit" name="btn-Fin-Postulacion" value="Postularme">
                    </div>
                </form>
                </div>
            </div>
        </div>
    </body>
</html>
