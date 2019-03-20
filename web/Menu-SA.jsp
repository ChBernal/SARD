<%@page import="Modelo.GS_Ambiente_Salud"%>
<%@page import="Modelo.Ambiente_Salud_M"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelo.GS_Ciudadano"%>
<%@page import="Modelo.Ciudadano_M"%>
<%@page import="Modelo.GS_Denuncia_Cliente"%>
<%@page import="Modelo.GS_Denuncias"%>
<%@page import="Modelo.GS_Denuncias"%>
<%@page import="Modelo.Denuncias_M"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession Dat = request.getSession();
    String Doc=(String)Dat.getAttribute("DocumentoSession");
%>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="Estilos/CSS/Menu-SA.css">
    <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
    <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
    <script src="Estilos/alertifyjs/alertify.js"></script>
<title>MAppets</title>
</head>
<body>
    <header id="header">
        <nav class="Menu">
            <div class="Enlaces">
                <a href="#"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a>
                <a href="#Mascotas"><i class="fa fa-paw" aria-hidden="true"></i> Mascotas</a>
                <a href="#Eventos"><i class="fa fa-newspaper-o" aria-hidden="true"></i> Eventos</a>
                <a href="#Tips"><i class="fa fa-tag" aria-hidden="true"></i> Tips</a>
                <a href="#Usuarios"><i class="fa fa-user" aria-hidden="true"></i> Usuarios</a>
            </div>
            <div class="Usuario">
                <a href="" class="btn-menu"><i class="icono fa fa-bars" aria-hidden="true"></i></a>
                <div class="Perfil">
                    <a href="#" class="Abrir" id="Abrir"><%=(String)Dat.getAttribute("NombreSession")%></a>
                    <%
                        Ambiente_Salud_M Ambiente = new Ambiente_Salud_M();
                        GS_Ambiente_Salud GS_SASS = new GS_Ambiente_Salud(Doc);
                        ArrayList<GS_Ambiente_Salud> datos = new ArrayList<>();
                        datos = Ambiente.Uno_Ambiente(GS_SASS);

                        for(int i=0; i<datos.size(); i++){
                            GS_SASS= datos.get(i);
                    %>
                    <img width="40px" height="40px" src="<%= GS_SASS.getFoto()%>">
                    <%
                        }
                    %>
                </div>
            </div>
        </nav>
    </header>
                    
    <!-- Espacio del Perfil -->

    <div class="Espacio-Perfil">
        <div class="PerfilUsuario" id="PerfilUsuario">
            <div class="Enlaces-Perfil">
                <a href="Perfil_Ambiente"><i class="fa fa-user-o"></i>Perfil</a>
                <a href="#">Notificaciones</a>
                <a href="#"><i class="fa fa-lock"></i>Cambio Contraseña</a>
                <hr>
                <button name="CerrarSesion"><i class='fa fa-sign-out'></i> Cerrar Sesion</button>
            </div>
        </div>	
    </div>

    <!-- Finaliza Perfil -->
    
    <main>
        <div id="Cabezera" class="Cabezera">
            <h1>Bienvenid@ <%=(String)Dat.getAttribute("NombreSession")%></h1>
        </div>

        <article id="Mascotas" class="Mascotas">
            <h1>Adopcion</h1>
            <hr>
            <div class="Contenido-Adopcion">
                <div class="Contenedor-Formulario-Adopcion">
                    <div class="Wrap-Adopcion">
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
                                    <div class="Input-Group-Adopcion">
                                        <input type="text" name="Color-Mascota">
                                        <label for="Color-Mascota" class="label-Mascota">Color</label>
                                    </div>
                                </div>
                                <div class="Rigth-Adopcion">
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
                                    <div class="Input-Group-Adopcion">
                                        <input type="text" name="Estado-Mascota" id="Estado-Mascota" list="Mascota-Estado">
                                        <label for="Estado-Mascota" class="label-Mascota">Estado de la mascota</label>
                                        <datalist id="Mascota-Estado">
                                            <option value="Disponible">Disponible</option>
                                            <option value="Con Propietario">Con Propietario</option>
                                            <option value="Adoptado">Adoptado</option>
                                            <option value="En Proceso">En Proceso</option>
                                        </datalist>
                                    </div>
                                    <div class="Input-Group-Adopcion Opcional">
                                        <input type="text" name="Documento-Duenno" list="Numero-Documento">
                                        <label for="Documento-Duenno" class="label-Mascota">Documento</label>
                                        <datalist id="Numero-Documento">
                                             <%
                                                ArrayList<GS_Ciudadano> Docu_Cliente = new ArrayList<>();
                                                Ciudadano_M M_Ciudadano = new Ciudadano_M();
                                                Docu_Cliente =  M_Ciudadano.Todo_Ciudadano();
                                                GS_Ciudadano GS_Ciudadano = new GS_Ciudadano();

                                                for(int i=0; i<Docu_Cliente.size(); i++){
                                                    GS_Ciudadano = Docu_Cliente.get(i);
                                            %>
                                            <option value="<%=GS_Ciudadano.getDocumento()%>"><%=GS_Ciudadano.getNombre()%> <%=GS_Ciudadano.getApellido()%></option>

                                           <%}%>
                                        </datalist>
                                    </div>
                                </div>
                            </div>
                            <input type="submit" name="Registro-Mascota" value="Registrar">
                        </form>
                    </div>
                </div>
            </div>
        </article>

        <article id="Eventos" class="Eventos">
            <h1>Eventos</h1>
            <hr>
            <div class="Contenedor-Formulario-Eventos">
                <div class="Wrap-Eventos">
                    <form action="Servlet_Eventos" class="Formulario" method="POST" name="Formulario_Eventos" enctype="multipart/form-data">
                        <div class="Posicion-Eventos">
                            <div class="Lefth-Eventos">
                                <div class="Input-Group-Eventos">
                                    <input type="text" id="NombreEvento" name="NombreEvento">
                                    <label for="NombreEvento" class="label-Eventos">Nombre del Evento</label>
                                </div>
                                <div class="Input-Group-Eventos">
                                    <input type="text" name="TipoEvento" list="Eventos_Tipo">
                                    <label for="Tipo_Evento" class="label-Eventos">Tipo de evento</label>
                                    <datalist id="Eventos_Tipo">
                                        <select>
                                            <option value="Vacunacion">Vacunacion</option>
                                            <option value="Adopcion">Adopcion</option>
                                        </select>
                                    </datalist>
                                </div>
                                <div class="Input-Group-Eventos">
                                    <input type="date" id="Fecha_Evento" name="Fecha_Evento">
                                    <label for="Fecha_Evento" class="label-Eventos">Fecha del Evento</label>
                                </div>
                                <div class="Input-Group-Eventos">
                                    <input type="text" id="Descripcion" name="Descripcion">
                                    <label for="Descripcion" class="label-Eventos">Descripcion del evento</label>
                                </div>
                            </div>
                            <div class="Rigth-Eventos">
                                <div class="Input-Group-Eventos">
                                    <input type="file" id="Imagen" name="Imagen">
                                    <label class="label-Eventos" for= "Imagen"><span class="fa fa-camera Img-Ciudadano"></span>Foto</label>
                                </div>
                            </div>
                        </div>
                        <input type="submit" name="Registro-Evento" value="Registrar">
                    </form>
                </div>
            </div>
        </article>

        <article id="Tips" class="Tips">
            <h1>Tips</h1>
            <hr>
            <div class="Contenedor-Formulario-Tips">
                <div class="Wrap-Tips">
                    <form action="Servlet_Eventos" class="Formulario" method="POST" name="Formulario_Tips" enctype="multipart/form-data">
                        <div class="Posicion-Tips">
                            <div class="Input-Group-Tips">
                                <input type="text" id="NombreTips" name="NombreTips">
                                <label for="NombreTips" class="label-Tips">Nombre del Evento</label>
                            </div>
                            <div class="Input-Group-Tips">
                                <input type="file" id="Imagen_Tips" name="Imagen_Tips">
                                <label for="Imagen_Tips" class="label-Eventos">Imagen de la Foto</label>
                            </div>
                            <div class="Input-Group-Tips">
                                <textarea id="Dato-Tip" name="Dato-Tip"></textarea>
                                <label for="Dato-Tip" class="label-Tips">Dato Informativo</label>
                            </div>
                        </div>
                        <input type="submit" name="Registro-Evento" value="Registrar">
                    </form>
                </div>
            </div>
        </article>

        <article id="Usuarios" class="Usuarios">
            <h1>Usuarios</h1>
            <hr>
            <div class="Ciudadanos">
                <h2>Ciudadano</h2>
            </div>
            <div class="Contenedor-Formulario-Usuarios">
                <div class="Wrap-Ciudadanos">
                    <form action="ServletUsuario" class="Formulario" method="POST" name="Formulario_Ciudadano" enctype="multipart/form-data">
                        <div class="Posicion-Usuarios">
                            <div class="Left-Usuarios">
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Documento-Ciudadano" name="Documento-Ciudadano" pattern="[0-9]{4,11}">
                                    <label for="Documento-Ciudadano" class="label-Usuarios">Numero de Documento</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="text" name="Tipo-Documento-Ciudadano" list="Tipo-Documento-Ciudadano">
                                    <label for="Tipo-Documento-Ciudadano" class="label-Usuarios">Tipo Documento</label>
                                    <datalist id="Tipo-Documento-Ciudadano">
                                        <select>
                                            <option value="Cedula de Ciudadania">Cedula de Ciudadania</option>
                                            <option value="Cedula de Extranjeria">Cedula de Extranjeria</option>
                                            <option value="Pasaporte">Pasaporte</option>
                                        </select>
                                    </datalist>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Expedicion-Ciudadano" name="Expedicion-Ciudadano" pattern="[A-Z,a-z ]{1,50}">
                                    <label for="Expedicion-Ciudadano" class="label-Usuarios">Lugar de expedicion</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Nombre-Ciudadano" name="Nombre-Ciudadano" pattern="[A-Z,a-z ]{1,50}">
                                    <label for="Nombre-Ciudadano" class="label-Usuarios">Nombre</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Apellido-Ciudadano" name="Apellido-Ciudadano" pattern="[A-Z,a-z ]{1,50}">
                                    <label for="Apellido-Ciudadano" class="label-Usuarios">Apellido</label>
                                </div>
                                <div class="Input-Group-Usuarios Radio">
                                    <input type="Radio" id="masculino" name="Genero-Ciudadano" value="Masculino">
                                    <label for="masculino">Masculino</label>
                                    <input type="Radio" id="femenino" name="Genero-Ciudadano" value="Femenino"> 
                                    <label for="femenino">Femenino</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="date" id="Nacimiento-Ciudadano" name="Nacimiento-Ciudadano">
                                    <label for="Nacimiento-Ciudadano" class="label-Usuarios">Fecha de nacimiento</label>
                                </div>
                            </div>
                            <div class="Rigth-Usuarios">
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Direccion-Ciudadano" name="Direccion-Ciudadano">
                                    <label for="Direccion-Ciudadano" class="label-Usuarios">Direccion de recidencia</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Barrio-Ciudadano" name="Barrio-Ciudadano" pattern="[A-Z,a-z ]{1,50}">
                                    <label for="Barrio-Ciudadano" class="label-Usuarios">Barrio</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Telefono-Ciudadano" name="Telefono-Ciudadano" pattern="[0-9]{5,10}">
                                    <label for="Telefono-Ciudadano" class="label-Usuarios">Telefono</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Celular-Ciudadano" name="Celular-Ciudadano" pattern="[0-9]{5,10}">
                                    <label for="Celular-Ciudadano" class="label-Usuarios">Celular</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Email-Ciudadano" name="Email-Ciudadano"  pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}">
                                    <label for="Email-Ciudadano" class="label-Usuarios">Email</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="text" id="Ocupacion-Ciudadano" name="Ocupacion-Ciudadano"pattern="[A-Z,a-z ]{1,50}">
                                    <label for="Ocupacion-Ciudadano" class="label-Usuarios">Ocupacion</label>
                                </div>
                                <div class="Input-Group-Usuarios">
                                    <input type="file" id="Foto-Ciudadano" name="Foto-Ciudadano">
                                    <label class="label-Usuarios" for= "Foto-Ciudadano"><span class="fa fa-camera Img-Ciudadano"></span>Foto</label>
                                </div>
                            </div>
                        </div>
                        <input type="submit" name="Registro-Ciudadano" value="Registrar">
                    </form>
                </div>
            </div>
        </article>
    </main>
                                            
                                            
                                            
    <div class="Footer-Button">
        <label>Creado por Mappets Software &copy 2019 | Todos los derechos reservados</label>
    </div>
             
                                            
    <script src="Estilos/JS/jquery.min.js"></script>
    <script src="Estilos/JS/headroom.min.js"></script>
    <script src="Estilos/JS/Menu-SA.js"></script>

</body>
</html>