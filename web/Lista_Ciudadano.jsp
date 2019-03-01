
<%@page import="javax.swing.JOptionPane"%>
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
                 
                <div class="Scroll_Lista">
                 <%
                    ArrayList<GS_Ciudadano> Dato_Ciudadano = new ArrayList<>();
                    Ciudadano_M con = new Ciudadano_M();
                    Dato_Ciudadano = con.Todo_Ciudadano();
                    GS_Ciudadano Dat_Ciudadano = new GS_Ciudadano();

                    for(int i=0; i<Dato_Ciudadano.size(); i++){
                        Dat_Ciudadano = Dato_Ciudadano.get(i);
                %>
                <form action="ServletUsuario" method="POST" enctype="multipart/form-data">
                <div class="Nombre">
                    <h1><%=Dat_Ciudadano.getNombre()+" "+Dat_Ciudadano.getApellido()%></h1>
                </div>
                
                <div class="Datos_Ciudadano">
                        <div>
                            <div class="Left_Ciudadano">
                                <div id="Vista_Previa"> <img src="<%=Dat_Ciudadano.getFoto()%>"></div>
                                <input type="hidden" name="Foto_Antigua" value="<%=Dat_Ciudadano.getFoto()%>">
                                <label  class="fa fa-camera">
                                    <input  class="Foto" id="Foto" type="file" name="Foto" value=""  accept="image/jpg, image/jpeg, image/png">
                                </label>
                            </div> 
                            <div class="Rigth_Ciudadano">
                                <div class="Datos1">
                                    <label><%=Dat_Ciudadano.getDocumento()%><label>
                                    <input type="hidden" name="Documento-Ciudadano" value="<%=Dat_Ciudadano.getDocumento()%>" >
                                    <input type="hidden" name="Nombre-Ciudadano" value="<%=Dat_Ciudadano.getNombre()%>" >
                                    <label><%=Dat_Ciudadano.getTipo_Documento()%><label>
                                    <label><%=Dat_Ciudadano.getExpedicion()%><label>
                                    <label><%=Dat_Ciudadano.getGenero()%><label>
                                    <label><%=Dat_Ciudadano.getNacimiento()%><label>
                                    <input  class="input1" type="text" id="Direccion-Ciudadano" name="Direccion-Ciudadano" placeholder="Direccion" value="<%=Dat_Ciudadano.getDireccion()%>">
                                </div>
                                <div class="Datos2">
                                    <input class="input2" type="text" id="Barrio-Ciudadano" name="Barrio-Ciudadano" placeholder="Barrio" pattern="[A-Z,a-z ]{1,50}" value="<%=Dat_Ciudadano.getBarrio()%>">
                                    <input class="input3" type="text" id="Telefono-Ciudadano" name="Telefono-Ciudadano" placeholder="Telefono" pattern="[0-9]{5,10}" value="<%=Dat_Ciudadano.getCelular()%>">
                                    <input class="input4" type="text" id="Celular-Ciudadano" name="Celular-Ciudadano" placeholder="Celular" pattern="[0-9]{5,10}" value="<%=Dat_Ciudadano.getFijo()%>">
                                    <input class="input5" type="text" id="Email-Ciudadano" name="Email-Ciudadano"  placeholder="Correo" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%=Dat_Ciudadano.getCorreo()%>">
                                    <input class="input6" type="text" id="Ocupacion-Ciudadano" name="Ocupacion-Ciudadano" placeholder="Ocupacion" pattern="[A-Z,a-z ]{1,50}" value="<%=Dat_Ciudadano.getOcupacion()%>">
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
