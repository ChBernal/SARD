
<%@page import="Modelo.Ambiente_Salud_M"%>
<%@page import="Modelo.GS_Ambiente_Salud"%>
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
        <link rel="stylesheet" href="Estilos/CSS/Lista_SASS.css">
        <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
        <script src="Estilos/alertifyjs/alertify.js"></script>
        <script src="Estilos/JS/jquery.js"></script>
        <script src="Estilos/JS/E_Lista_SASS.js"></script>
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
            <article class="Lista_SASS">
                <div id="Cabezera" class="Cabezera">
                    <h1>Secretaria de Ambiente y Salud</h1>
                </div>
                <div class="Opciones_SASS">
                    <button class="Ambiente"><span class="fa fa-leaf"></span> Ambiente</button>
                    <button class="Salud"><span class="fa fa-heart"></span> Salud</button>
                </div>
                <div class="Scroll_Ambiente">
                 <%
                    ArrayList<GS_Ambiente_Salud> Dato_Ambiente = new ArrayList<>();
                    Ambiente_Salud_M M_Ambiente = new Ambiente_Salud_M();
                    Dato_Ambiente = M_Ambiente.Todo_Ambiente();
                    GS_Ambiente_Salud Dat_Ambiente = new GS_Ambiente_Salud();

                    for(int i=0; i<Dato_Ambiente.size(); i++){
                        Dat_Ambiente = Dato_Ambiente.get(i);
                %>
                
                <div class="Nombre_Ambiente">
                    <h1><%=Dat_Ambiente.getNombre()%></h1>
                </div>
                
                <div class="Datos_Ambiente">
                        <div>
                            <div class="Left_SASS">
                                <div id="Vista_Previa"> <img src="<%=Dat_Ambiente.getFoto()%>"></div>
                                <label  class="fa fa-camera">
                                <input  class="Foto" id="Foto" type="file" name="Foto"  value="" accept="image/jpg, image/jpeg, image/png">
                                </label>
                            </div> 
                            <div class="Rigth_SASS">
                                <div class="Datos1">
                                    <label><%=Dat_Ambiente.getDocumento()%><label>
                                    <input type="hidden" name="Documento-Ambiente" value="<%=Dat_Ambiente.getDocumento()%>">
                                    <label><%=Dat_Ambiente.getTipo_Documento()%><label>
                                    <label><%=Dat_Ambiente.getGenero()%><label>
                                    <label><%=Dat_Ambiente.getFecha_Nacimiento()%><label>
                                </div>
                                <div class="Datos2">
                                    <input class="input1" type="text" id="Direccion-Ambiente" placeholder="Direccion" name="Direccion-Ambiente" value="<%=Dat_Ambiente.getDireccion()%>">
                                    <input class="input2" type="text" id="Telefono-Ambiente"  placeholder="Telefono" name="Telefono-Ambiente" pattern="[0-9]{5,10}" value="<%=Dat_Ambiente.getTelefono()%>">
                                    <input class="input3" type="text" id="Email-Ambiente" placeholder="Correo" name="Email-Ambiente"  pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%=Dat_Ambiente.getCorreo()%>">
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
                
                <div class="Scroll_Salud">
                 <%
                    ArrayList<GS_Ambiente_Salud> Dato_Salud = new ArrayList<>();
                    Ambiente_Salud_M M_Salud = new Ambiente_Salud_M();
                    Dato_Salud = M_Salud.Todo_Salud();
                    GS_Ambiente_Salud Dat_Salud = new GS_Ambiente_Salud();
                    for(int i=0; i<Dato_Salud.size(); i++){
                        Dat_Salud = Dato_Salud.get(i);
                %>
                
                <div class="Nombre_Salud">
                    <h1><%=Dat_Salud.getNombre()%></h1>
                </div>
                
                <div class="Datos_Salud">
                        <div>
                            <div class="Left_SASS">
                                <div id="Vista_Previa"> <img src="<%=Dat_Salud.getFoto()%>"></div>
                                <label  class="fa fa-camera" id="fa-camera">
                                <input  class="Foto" id="Foto" type="file" name="Foto"  value="" accept="image/jpg, image/jpeg, image/png">
                                </label>
                            </div> 
                            <div class="Rigth_SASS">
                                <div class="Datos1">
                                    <label><%=Dat_Salud.getDocumento()%><label>
                                    <input type="hidden" name="Documento-Salud" value="<%=Dat_Salud.getDocumento()%>">
                                    <label><%=Dat_Salud.getTipo_Documento()%><label>
                                    <label><%=Dat_Salud.getGenero()%><label>
                                    <label><%=Dat_Salud.getFecha_Nacimiento()%><label>
                                </div>
                                <div class="Datos2">
                                    <input class="input4" type="text" id="Direccion-Salud" placeholder="Direccion" name="Direccion-Salud" value="<%=Dat_Salud.getDireccion()%>">
                                    <input class="input5" type="text" id="Telefono-Salud" placeholder="Telefono" name="Telefono-Salud" pattern="[0-9]{5,10}" value="<%=Dat_Salud.getDireccion()%>">
                                    <input class="input6" type="text" id="Email-Salud" placeholder="Correo" name="Email-Salud"  pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%=Dat_Salud.getCorreo()%>">
                                </div>
                            </div>
                        </div>
                        <div class="Botones">
                            <button class="btn-Editar" id="btn-Editar" name="btn-Editar" ><span class="fa fa-pencil"></span> Editar </button>
                            <button class="btn-Actualizar" id="btn-Actualizar" name="btn-Actualizar" ><span class="fa fa-refresh"></span> Actualizar </button>
                            <button class="btn-Cancelar" id="btn-Cancelar" name="btn-Cancelar" ><span class="fa fa-close"></span> Cancelar</button>
                            <button class="btn-Eliminar" id="btn-Eliminar" name="btn-Eliminar" ><span class="fa fa-trash"></span> Eliminar </button>
                        </div>
                </div>
                <%}%>
                </div>
            </article>
        </main>
    </body>
</html>
