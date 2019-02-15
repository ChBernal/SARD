<%-- 
    Document   : Mascotas
    Created on : 8/02/2019, 12:12:04 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession Dat = request.getSession();
%>
<html>
    <head lang="en">
        <meta charset="UTF-8">
        <title>MAppets</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
	<link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/CSS/Mascota_Ciudadano.css">
        <script type="text/javascript" src="Estilos/JS/jquery.js"></script>
        <script type="text/javascript" src="Estilos/JS/"></script>
    </head>
    <body>
        <div class="Barra">
            <a href="Menu-Ciudadano.jsp"><span class="fa fa-home"></span></a>
        </div>
        <div class="Contenedor-Mascotas">
            <div class="Contenido-Adopcion">
                <div class="Contenedor-Formulario-Adopcion">
                    <div class="Wrap-Adopcion">
                                <h1>Resgistra tu mascota</h1>
                        <form action="Servlet_Mascota" class="Formulario" name="Formulario_Adopcion" method="POST" enctype="multipart/form-data">
                            <div class="Posicion-Adopcion">
                                <div class="Left-Adopcion">
                                    <div class="Input-Group-Adopcion">
                                        <input type="text" name="Tipo-Mascota" list="Mascota-Tipo">
                                        <label for="Tipo-Mascota" class="label-Mascota">Tipo de Mascota</label>
                                        <datalist id="Mascota-Tipo">
                                            <option>Perro</option>
                                            <option>Gato</option>
                                            <option>Pajaro</option>
                                         </datalist>
                                    </div>
                                    <div class="Input-Group-Adopcion">
                                        <input type="text" name="Nombre-Mascota">
                                        <label for="Nombre-Mascota" class="label-Mascota">Nombre</label>
                                    </div>
                                    <div class="Input-Group-Adopcion">
                                        <input type="date" name="Nacimiento-Mascota">
                                        <label for="Nacimiento-Mascota" class="label-Mascota">Fecha de nacimiento</label>
                                    </div>
                                </div>
                                <div class="Rigth-Adopcion">
                                    <div class="Input-Group-Adopcion">
                                        <input type="text" name="Color-Mascota">
                                        <label for="Color-Mascota" class="label-Mascota">Color</label>
                                    </div>
                                    <div class="Input-Group-Adopcion">
                                        <input type="text" name="Raza-Mascota" list="Mascota-Raza" pattern="[A-Za-z ]{3-20}">
                                        <label for="Raza-Mascota" class="label-Mascota">Raza</label>
                                        <datalist id="Mascota-Raza">
                                            <option></option>
                                            <option></option>
                                            <option></option>
                                            <option></option>
                                            <option></option>
                                            <option></option>
                                        </datalist>
                                    </div>
                                    <div class="Input-Group-Adopcion Radio">
                                        <input type="radio" id="Macho" name="Genero-Mascota" value="Macho">
                                        <label for="Macho">Macho</label>
                                        <input type="radio" id="Hembra" name="Genero-Mascota" value="Hembra">
                                        <label for="Hembra">Hembra</label>
                                    </div>
                                    <div class="Input-Group-Adopcion">
                                        <input type="file" id="Foto-Mascota" name="Foto-Mascota">
                                        <label class="label-Mascota" for= "Foto-Mascota"><span class="fa fa-camera Img-Mascota"></span>Foto</label>
                                    </div>
                                    <% String Documento=(String)Dat.getAttribute("DocumentoSession"); %>
                                    <input type="hidden" name="Documento-Duenno" value="<%=Documento%>">
                                </div>
                            </div>
                            <input type="submit" name="Registro-Mascota-C" value="Registrar">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
