
<%@page import="Modelo.Ciudadano_M"%>
<%@page import="Modelo.GS_Ciudadano"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Ciudadano</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link rel="stylesheet" href="Estilos/CSS/Lista_Ciudadano.css">
        <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
        <script src="Estilos/alertifyjs/alertify.js"></script>
        <script src="Estilos/JS/jquery.js"></script>
        <script src="Estilos/JS/E_Lista_Ciudadano.js"></script>
    </head>
    
    <body>
    <header id="header">
        <nav class="Menu">
            <div class="Enlaces">
                <a href="Menu-Admin.jsp"><span class="fa fa-home"></span></a>
            </div>
        </nav>
    </header>
        <main>
            <article class="Lista_Ciudadano">
                <div id="Cabezera" class="Cabezera">
                    <h1>Lista Ciudadanos</h1>
                </div>
                 <%
                    ArrayList<GS_Ciudadano> Dato_Ciudadano = new ArrayList<>();
                    Ciudadano_M con = new Ciudadano_M();
                    Dato_Ciudadano = con.Todo_Ciudadano();
                    GS_Ciudadano Dat_Ciudadano = new GS_Ciudadano();

                    for(int i=0; i<Dato_Ciudadano.size(); i++){
                        Dat_Ciudadano = Dato_Ciudadano.get(i);
                %>
                <div class="Nombre">
                    <h1><%=Dat_Ciudadano.getNombre()+" "+Dat_Ciudadano.getApellido()%></h1>
                </div>
                <div class="Datos_Ciudadano">
                    <div class="Left_Ciudadano">
                        <div id="Vista_Previa"> <img src="<%=Dat_Ciudadano.getFoto()%>"></div>
                        <label  class="fa fa-camera">
                        <input  class="Foto" id="Foto" type="file" name="Foto_C"  value="" accept="image/jpg, image/jpeg, image/png">
                        </label>
                    </div> 
                    <div class="Rigth_Ciudadano">
                        <div class="Datos1">
                            <label><%=Dat_Ciudadano.getDocumento()%><label>
                            <label><%=Dat_Ciudadano.getTipo_Documento()%><label>
                            <label><%=Dat_Ciudadano.getExpedicion()%><label>
                            <label><%=Dat_Ciudadano.getGenero()%><label>
                            <label><%=Dat_Ciudadano.getNacimiento()%><label>
                            <label><%=Dat_Ciudadano.getDireccion()%><label>
                        </div>
                        <div class="Datos2">
                            <label><%=Dat_Ciudadano.getBarrio()%><label>
                            <label><%=Dat_Ciudadano.getCelular()%><label>
                            <label><%=Dat_Ciudadano.getFijo()%><label>
                            <label><%=Dat_Ciudadano.getCorreo()%><label>
                            <label><%=Dat_Ciudadano.getOcupacion()%><label>
                        </div>
                    </div>
                      
                </div>
                <%}%>
            </article>
        </main>
    </body>
</html>
