
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
        <title>Lista Ciudadano</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link rel="stylesheet" href="Estilos/CSS/Lista_Administrador.css">
        <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
        <script src="Estilos/alertifyjs/alertify.js"></script>
        <script src="Estilos/JS/jquery.js"></script>
        <script src="Estilos/JS/E_Lista_Administrador.js"></script>
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
            <article class="Lista_Administrador">
                <div id="Cabezera" class="Cabezera">
                    <h1>Lista Administradores</h1>
                </div>
                <div class="Scroll_Lista">
                 <%
                    HttpSession Doc2=request.getSession();
                    String Documento=(String)Doc2.getAttribute("DocumentoSession");
                    ArrayList<GS_Administrador> Dato_Administrador = new ArrayList<>();
                    Administrador_M con = new Administrador_M();
                    GS_Administrador Doc = new GS_Administrador(Documento);
                    Dato_Administrador = con.Tabla_Admin(Doc);
                    GS_Administrador Dat_Administrador = new GS_Administrador();

                    for(int i=0; i<Dato_Administrador.size(); i++){
                        Dat_Administrador = Dato_Administrador.get(i);
                %>
                <form action="Servlet_Administrador" method="POST" enctype="multipart/form-data">
                <div class="Nombre">
                    <h1><%=Dat_Administrador.getNombre()+" "+Dat_Administrador.getApellido()%></h1>
                </div>
                
                <div class="Datos_Administrador">
                        <div>
                            <div class="Left_Administrador">
                                <div id="Vista_Previa"> <img src="<%=Dat_Administrador.getFoto()%>"></div>
                                <input type="hidden" name="Foto_Antigua" value="<%=Dat_Administrador.getFoto()%>">
                                <label  class="fa fa-camera">
                                <input  class="Foto" id="Foto" type="file" name="Foto-Administrador"  value="" accept="image/jpg, image/jpeg, image/png">
                                </label>
                            </div> 
                            <div class="Rigth_Administrador">
                                <div class="Datos1">
                                    <input type="hidden" name="Documento-Administrador" value="<%=Dat_Administrador.getDocumento()%>">
                                    <input type="hidden" name="Nombre-Administrador" value="<%=Dat_Administrador.getNombre()%>">
                                    <label><%=Dat_Administrador.getDocumento()%><label>
                                    <label><%=Dat_Administrador.getTipo_Documento()%><label>
                                    <label><%=Dat_Administrador.getGenero()%><label>
                                    <label><%=Dat_Administrador.getFecha_Nacimiento()%><label>
                                </div>
                                <div class="Datos2">
                                    <input class="input1" type="text" id="Direccion-Administrador" placeholder="Direccion" name="Direccion-Administrador" value="<%=Dat_Administrador.getDireccion()%>">
                                    <input class="input2" type="text" id="Telefono-Administrador" placeholder="Telefono" name="Telefono-Administrador" pattern="[0-9]{5,10}" value="<%=Dat_Administrador.getTelefono()%>">
                                    <input class="input3" type="text" id="Email-Administrador" placeholder="Correo" name="Email-Administrador"  pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%=Dat_Administrador.getCorreo()%>">
                                </div>
                            </div>
                        </div>
                        <div class="Botones">
                            <label class="btn-Editar" name="btn-Editar" ><span class="fa fa-pencil"></span> Editar </label>
                            <button class="btn-Actualizar" name="btn-Actualizar" ><span class="fa fa-refresh"></span> Actualizar </button>
                            <label class="btn-Cancelar" name="btn-Cancelar" ><span class="fa fa-close"></span> Cancelar</label>
                            <button class="btn-Eliminar" name="btn-Eliminar" ><span class="fa fa-trash"></span> Eliminar </button>
                        </div>
                </form>
                </div>
                <%}%>
                </div>
            </article>
        </main>
    </body>
</html>
