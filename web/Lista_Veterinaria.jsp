
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelo.Veterinaria_M"%>
<%@page import="Modelo.GS_Veterinaria"%>
<%@page import="Modelo.Ciudadano_M"%>
<%@page import="Modelo.GS_Ciudadano"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Veterinaria</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link rel="stylesheet" href="Estilos/CSS/Lista_Veterinaria.css">
        <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
        <script src="Estilos/alertifyjs/alertify.js"></script>
        <script src="Estilos/JS/jquery.js"></script>
        <script src="Estilos/JS/E_Lista_Veterinaria.js"></script>
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
            <article class="Lista_Veterinaria">
                <div id="Cabezera" class="Cabezera">
                    <h1>Lista Veterinarias</h1>
                </div>
                <div class="Opciones_Veterinaria">
                    <button class="Activas"><span class="fa fa-check "></span> Activas</button>
                    <button class="Inactivas"><span class="fa fa-minus "></span> Inactivas</button>
                </div>
                <div class="Scroll_Activas">
                 <%
                    ArrayList<GS_Veterinaria> Dato_Activas = new ArrayList<>();
                    Veterinaria_M M_Activas = new Veterinaria_M();
                    Dato_Activas = M_Activas.Todo_cuatro();
                    GS_Veterinaria Dat_Activas = new GS_Veterinaria();

                    for(int i=0; i<Dato_Activas.size(); i++){
                        Dat_Activas = Dato_Activas.get(i);
                %>
                
                <div class="Nombre_Activas">
                    <h1><%=Dat_Activas.getNombre()%></h1>
                </div>
                
                <div class="Datos_Activas">
                        <div>
                            <div class="Left_Veterinaria">
                                <div id="Vista_Previa"> <img src="<%=Dat_Activas.getFoto()%>"></div>
                                <label  class="fa fa-camera">
                                <input  class="Foto" id="Foto" type="file" name="Foto"  value="" accept="image/jpg, image/jpeg, image/png">
                                </label>
                            </div> 
                            <div class="Rigth_Veterinaria">
                                <div class="Datos1">
                                    <label><%=Dat_Activas.getNit()%><label>
                                            <input type="text" id="Representante-Veterinaria" name="Representante-Veterinaria"  pattern="[A-Z,a-z ]{1,50}" value="<%=Dat_Activas.getRepresentante()%>">
                                    <label><%=Dat_Activas.getTipo_Veterinaria()%><label>
                                    <label><%=Dat_Activas.getFecha_Fundacion()%><label>
                                </div>
                                <div class="Datos2">
                                    <input type="text" id="Direccion-Veterinaria" name="Direccion-Veterinaria" value="<%=Dat_Activas.getDireccion()%>">
                                    <input type="text" id="Barrio-Veterinaria" name="Barrio-Veterinaria" pattern="[A-Z,a-z ]{1,50}" value="<%=Dat_Activas.getBarrio()%>">
                                    <input type="text" id="Telefono-Veterinaria" name="Telefono-Veterinaria" pattern="[0-9]{5,10}" value="<%=Dat_Activas.getTelefono()%>">
                                    <input type="text" id="Email-Ciudadano" name="Email-Ciudadano"  pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%=Dat_Activas.getCorreo()%>">
                                </div>
                            </div>
                        </div>
                        <div class="Botones">
                            <button class="btn-Editar" name="btn-Editar" ><span class="fa fa-pencil"></span> Editar </button>
                            <button class="btn-Actualizar" name="btn-Actualizar" ><span class="fa fa-refresh"></span> Actualizar </button>
                            <button class="btn-Cancelar" name="btn-Cancelar" ><span class="fa fa-close"></span> Cancelar</button>
                            <button class="btn-Eliminar" name="btn-Eliminar" ><span class="fa fa-trash"></span> Eliminar </button>
                        </div>
                </div>
                <%}%>
                </div>
                
                <div class="Scroll_Inactivas">
                 <%
                    ArrayList<GS_Veterinaria> Dato_Inactivas = new ArrayList<>();
                    Veterinaria_M M_Inactivas = new Veterinaria_M();
                    Dato_Inactivas = M_Inactivas.Todo_cero();
                    GS_Veterinaria Dat_Inactivas = new GS_Veterinaria();
                    for(int i=0; i<Dato_Inactivas.size(); i++){
                        Dat_Inactivas = Dato_Inactivas.get(i);
                %>
                
                <div class="Nombre_Inactivas">
                    <h1><%=Dat_Inactivas.getNombre()%></h1>
                </div>
                
                <div class="Datos_Inactivas">
                        <div>
                            <div class="Left_Veterinaria">
                                <div id="Vista_Previa"> <img src="<%=Dat_Inactivas.getFoto()%>"></div>
                                <label  class="fa fa-camera">
                                <input  class="Foto" id="Foto" type="file" name="Foto"  value="" accept="image/jpg, image/jpeg, image/png">
                                </label>
                            </div> 
                            <div class="Rigth_Veterinaria">
                                <div class="Datos1">
                                    <label><%=Dat_Inactivas.getNit()%><label>
                                            <input type="text" id="Representante-Veterinaria" name="Representante-Veterinaria"  pattern="[A-Z,a-z ]{1,50}" value="<%=Dat_Inactivas.getRepresentante()%>">
                                    <label><%=Dat_Inactivas.getTipo_Veterinaria()%><label>
                                    <label><%=Dat_Inactivas.getFecha_Fundacion()%><label>
                                </div>
                                <div class="Datos2">
                                    <input type="text" id="Direccion-Veterinaria" name="Direccion-Veterinaria" value="<%=Dat_Inactivas.getDireccion()%>">
                                    <input type="text" id="Barrio-Veterinaria" name="Barrio-Veterinaria" pattern="[A-Z,a-z ]{1,50}" value="<%=Dat_Inactivas.getBarrio()%>">
                                    <input type="text" id="Telefono-Veterinaria" name="Telefono-Veterinaria" pattern="[0-9]{5,10}" value="<%=Dat_Inactivas.getTelefono()%>">
                                    <input type="text" id="Email-Ciudadano" name="Email-Ciudadano"  pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%=Dat_Activas.getCorreo()%>">
                                </div>
                            </div>
                        </div>
                        <div class="Botones">
                            <button class="btn-Editar" name="btn-Editar" ><span class="fa fa-pencil"></span> Editar </button>
                            <button class="btn-Actualizar" name="btn-Actualizar" ><span class="fa fa-refresh"></span> Actualizar </button>
                            <button class="btn-Cancelar" name="btn-Cancelar" ><span class="fa fa-close"></span> Cancelar</button>
                            <button class="btn-Eliminar" name="btn-Eliminar" ><span class="fa fa-trash"></span> Eliminar </button>
                        </div>
                </div>
                <%}%>
                </div>
            </article>
        </main>
    </body>
</html>
