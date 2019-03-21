
<%@page import="Modelo.GS_Ambiente_Salud"%>
<%@page import="Modelo.Ambiente_Salud_M"%>
<%@page import="Modelo.Visitas_M"%>
<%@page import="Modelo.GS_Visitas"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelo.Administrador_M"%>
<%@page import="Modelo.GS_Administrador"%>
<%@page import="Modelo.Ciudadano_M"%>
<%@page import="Modelo.GS_Ciudadano"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Visitas</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link rel="stylesheet" href="Estilos/CSS/Lista_Visitas.css">
        <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
        <script src="Estilos/alertifyjs/alertify.js"></script>
        <script src="Estilos/JS/jquery.js"></script>
        <script src="Estilos/JS/E_Lista_Visitas.js"></script>
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
            <article class="Lista_Visitas">
                <div id="Cabezera" class="Cabezera">
                    <h1>Lista Visitas</h1>
                </div>
                <div class="Scroll_Lista">
                 <%
                    String Encargado="";
                    String Postulante="";
                    ArrayList<GS_Visitas> Dato_Visitas = new ArrayList<>();
                    Visitas_M con = new Visitas_M();
                    Dato_Visitas = con.Ver_Visitas();
                    GS_Visitas GSV = new GS_Visitas();

                    for(int i=0; i<Dato_Visitas.size(); i++){
                        GSV = Dato_Visitas.get(i);
                        
                        ArrayList<GS_Ambiente_Salud> Nombre_Ambiente = new ArrayList<>();
                        Ambiente_Salud_M SASS=new Ambiente_Salud_M();
                        GS_Ambiente_Salud GS_SA =new GS_Ambiente_Salud(GSV.getEncargado());
                        Nombre_Ambiente= SASS.Uno_Ambiente(GS_SA);
                                
                            for(int e=0; e<Nombre_Ambiente.size(); i++){
                                GS_SA = Nombre_Ambiente.get(i);
                                Encargado=GS_SA.getNombre()+GS_SA.getApellido();
                            }
                        ArrayList<GS_Ciudadano> Nombre_Postulante = new ArrayList<>();
                        Ciudadano_M Ciudadano=new Ciudadano_M();
                        GS_Ciudadano GS_C =new GS_Ciudadano(GSV.getPostulante());
                        Nombre_Postulante= Ciudadano.Uno_Ciudadano(GS_C);
                                
                            for(int e=0; e<Nombre_Postulante.size(); i++){
                                GS_C = Nombre_Postulante.get(i);
                                Postulante=GS_C.getNombre()+GS_C.getApellido();
                            }
                        
                %>
                <form action="Servlet_Visitas" method="POST" enctype="multipart/form-data">
                <div class="Datos_Visita">
                    <h1><%=GSV.getFecha()%></h1>
                    <h1><%=Encargado%></h1>
                    <h1><%=Postulante%></h1>
                </div>
                <%}%>
                <div class="Respuesta_Visita">
                        
                        <div class="Botones">
                            <label class="btn-Editar" name="btn-Editar" ><span class="fa fa-pencil"></span> Editar </label>
                            <button class="btn-Actualizar" name="btn-Actualizar" ><span class="fa fa-refresh"></span> Actualizar </button>
                            <label class="btn-Cancelar" name="btn-Cancelar" ><span class="fa fa-close"></span> Cancelar</label>
                            <button class="btn-Eliminar" name="btn-Eliminar" ><span class="fa fa-trash"></span> Eliminar </button>
                        </div>
                </form>
                </div>
                
                </div>
            </article>
        </main>
    </body>
</html>
