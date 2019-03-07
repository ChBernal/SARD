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
%>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="Estilos/CSS/Menu-Admin.css">
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
                    <img src="">
                </div>
            </div>
        </nav>
    </header>
    <div class="Espacio-Perfil">
        <div class="PerfilUsuario" id="PerfilUsuario">
            <div class="Enlaces-Perfil">
                <a href="#"><i class="fa fa-user-o"></i>Perfil</a>
                <a href="#">Notificaciones</a>
                <a href=""><i class="fa fa-lock"></i>Cambio Contraseña</a>
                <hr>
                <button name="CerrarSesion"><i class='fa fa-sign-out'></i> Cerrar Sesion</button>
            </div>
        </div>	
    </div>
    <div class="Contenedor">
        <main>
            <div id="Cabezera" class="Cabezera">
                <h1>Bienvenido Administrador <%=(String)Dat.getAttribute("NombreSession")%></h1>
            </div>

                <article id="Mascotas" class="Adopcion">
                    <h1>Registro de Mascotas</h1>
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
                    <h1> Registro de Eventos</h1>
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
                    <h1> Registro de Tips</h1>
                    <hr>
                    <div class="Contenedor-Formulario-Tips">
                        <div class="Wrap-Tips">
                            <form action="Servlet_Tips" class="Formulario" method="POST" name="Formulario_Tips" enctype="multipart/form-data">
                                <div class="Posicion-Tips">
                                    <div class="Lefth-Tips">
                                        <div class="Input-Group-Tips">
                                            <input type="text" id="TituloTip" name="Titulo-Tip">
                                            <label for="TituloTip" class="label-Tip">Titulo del Tip</label>
                                        </div>
                                        <div class="Input-Group-Tips">
                                            <input type="text" id="Descripcion-Tip" name="Descripcion-Tip">
                                            <label for="Descripcion-Tip" class="label-Tip">Descripcion del Tip</label>
                                        </div>
                                    </div>
                                    <div class="Rigth-Tips">
                                        <div class="Input-Group-Tips">
                                            <div id="Vista_Previa"> <img src=""></div>
                                            <input type="file" id="Imagen-Tip" name="Imagen-Tip">
                                            <label class="label-Tip" for= "Imagen"><span class="fa fa-camera Img-Tips"></span>Imagen</label>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" name="Registro-Tip" value="Registrar">
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

                    <div class="Veterinarias">
                        <h2>Veterinaria</h2>
                    </div>
                    <div class="Contenedor-Formulario-Usuarios">
                        <div class="Wrap-Veterinaria">
                            <form action="Servlet_Veterinaria" class="Formulario" method="POST" name="Formulario_Veterinaria" enctype="multipart/form-data">
                                <div class="Posicion-Usuarios">
                                    <div class="Left-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Nit" name="Nit" pattern="[0-9]{4,15}">
                                            <label for="Nit" class="label-Usuarios">NIT</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Nombre-Veterinaria" name="Nombre-Veterinaria"  pattern="[A-Z,a-z ]{1,50}">
                                            <label for="Nombre-Veterinaria" class="label-Usuarios">Nombre de la veterinaria</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                                <input type="text" id="Representante-Veterinaria" name="Representante-Veterinaria"  pattern="[A-Z,a-z ]{1,50}">
                                            <label for="Representante-Veterinaria" class="label-Usuarios">Representante legal</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" name="Tipo-Veterinaria" list="Veterinaria-Tipo">
                                            <label for="Tipo-Veterinaria" class="label-Usuarios">Tipo de Veterinaria</label>
                                            <datalist id="Veterinaria-Tipo">
                                                    <select>
                                                            <option value="Pet Shop">Pet Shop</option>
                                                            <option value="Clinica">Clinica</option>
                                                            <option value="Veterinaria">Veterinaria</option>
                                                    </select>
                                            </datalist>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="date" id="Fecha-Fundacion" name="Fecha-Fundacion">
                                            <label for="Fecha-Fundacion" class="label-Usuarios">Fecha de Fundacion</label>
                                        </div>
                                    </div>
                                    <div class="Rigth-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Direccion-Veterinaria" name="Direccion-Veterinaria">
                                            <label for="Direccion-Veterinaria" class="label-Usuarios">Direccion de la veterinaria</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Barrio-Veterinaria" name="Barrio-Veterinaria"  pattern="[A-Z,a-z ]{1,50}">
                                            <label for="Barrio-Veterinaria" class="label-Usuarios">Barrio</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Telefono-Veterinaria" name="Telefono-Veterinaria" pattern="[0-9]{4,15}">
                                            <label for="Telefono-Veterinaria" class="label-Usuarios">Telefono</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Email-Veterinaria" name="Email-Veterinaria"  pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}">
                                            <label for="Email-Veterinaria" class="label-Usuarios">Email</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" name="Estado-Veterinaria" list="Veterinaria-Estado">
                                            <label for="Estado-Veterinaria" class="label-Usuarios">Estado de Veterinaria</label>
                                            <datalist id="Veterinaria-Estado">
                                                    <select>
                                                            <option value="Activo">Activo</option>
                                                            <option value="Inactivo">Inactivo</option>
                                                    </select>
                                            </datalist>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="file" id="Foto-Veterinaria" name="Foto-Veterinaria">
                                            <label class="label-Usuarios" for= "Foto-Veterinaria"><span class="fa fa-camera Img-Ciudadano"></span>Foto</label>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" name="Registro-Veterinaria" value="Registrar">
                            </form>
                        </div>
                    </div>
                    <div class="SASS">
                            <h2>Colaboradores de Secretaria de ambiente y salud</h2>
                    </div>
                    <div class="Contenedor-Formulario-Usuarios">
                        <div class="Wrap-SASS">
                            <form action="Servlet_Ambiente_Salud" class="Formulario" method="POST" name="Formulario_SASS" enctype="multipart/form-data">
                                <div class="Posicion-Usuarios">
                                    <div class="Left-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Documento-SASS" name="Documento-SASS" pattern="[0-9]{4,15}">
                                            <label for="Documento-SASS" class="label-Usuarios">Numero de Documento</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" name="Tipo-Documento-SASS" list="Tipo-Documento-SASS">
                                            <label for="Tipo-Documento-SASS" class="label-Usuarios">Tipo Documento</label>
                                            <datalist id="Tipo-Documento-SASS">
                                                <select>
                                                    <option value="Cedula de Ciudadania">Cedula de Ciudadania</option>
                                                    <option value="Cedula de Extranjeria">Cedula de Extranjeria</option>
                                                    <option value="Pasaporte">Pasaporte</option>
                                                </select>
                                            </datalist>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Nombre-SASS" name="Nombre-SASS" pattern="[A-Z,a-z ]{1,50}">
                                            <label for="Nombre-SASS" class="label-Usuarios">Nombre</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Apellido-SASS" name="Apellido-SASS" pattern="[A-Z,a-z ]{1,50}">
                                            <label for="Apellido-SASS" class="label-Usuarios">Apellido</label>
                                        </div>
                                        <div class="Input-Group-Usuarios Radio">
                                            <input type="Radio" id="masculino-SASS" name="Genero-SASS" value="Masculino">
                                            <label for="masculino-SASS">Masculino</label>
                                            <input type="Radio" id="femenino-SASS" name="Genero-SASS" value="Femenino"> 
                                            <label for="femenino-SASS">Femenino</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="date" id="Nacimiento-SASS" name="Nacimiento-SASS">
                                            <label for="Nacimiento-SASS" class="label-Usuarios">Fecha de nacimiento</label>
                                        </div>
                                    </div>
                                    <div class="Rigth-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Direccion-SASS" name="Direccion-SASS">
                                            <label for="Direccion-SASS" class="label-Usuarios">Direccion de recidencia</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Telefono-SASS" name="Telefono-SASS" pattern="[0-9]{4,15}">
                                            <label for="Telefono-SASS" class="label-Usuarios">Telefono</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Email-SASS" name="Email-SASS" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}">
                                            <label for="Email-SASS" class="label-Usuarios">Email</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" name="Rol-SASS" id="Rol-SASS" list="Lista-Rol-SASS">
                                            <label for="Rol-SASS" class="label-Usuarios">Perteneces a:</label>
                                            <datalist id="Lista-Rol-SASS">
                                                    <select>
                                                            <option value="Secretaria de Ambiente">Secretaria de Ambiente</option>
                                                            <option value="Secretaria de Salud">Secretaria de Salud</option>
                                                    </select>
                                            </datalist>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="file" id="Foto-SASS" name="Foto-SASS">
                                            <label class="label-Usuarios" for= "Foto-SASS"><span class="fa fa-camera Img-Ciudadano"></span>Foto</label>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" name="Registro-SASS" value="Registrar">
                            </form>
                        </div>
                    </div>
                    <div class="Administrador">
                            <h2>Administrador</h2>
                    </div>
                    <div class="Contenedor-Formulario-Usuarios">
                        <div class="Wrap-Administrador">
                            <form action="Servlet_Administrador" class="Formulario" method="POST" name="Formulario_Administrador" enctype="multipart/form-data">
                                <div class="Posicion-Usuarios">
                                    <div class="Left-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Documento-Administrador" name="Documento-Administrador" pattern="[0-9]{4,15}">
                                            <label for="Documento-Administrador" class="label-Usuarios">Numero de Documento</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" name="Tipo-Documento-Administrador" list="Tipo-Documento-Administrador">
                                            <label for="Tipo-Documento-Administrador" class="label-Usuarios">Tipo de documento</label>
                                            <datalist id="Tipo-Documento-Administrador">
                                                <select>
                                                    <option value="Cedula de Ciudadania">Cedula de Ciudadania</option>
                                                    <option value="Cedula de Extranjeria">Cedula de Extranjeria</option>
                                                    <option value="Pasaporte">Pasaporte</option>
                                                </select>
                                            </datalist>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Nombre-Administrador" name="Nombre-Administrador" pattern="[A-Z,a-z ]{1,50}">
                                            <label for="Nombre-Administrador" class="label-Usuarios">Nombre</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Apellido-Administrador" name="Apellido-Administrador" pattern="[A-Z,a-z ]{1,50}">
                                            <label for="Apellido-Administrador" class="label-Usuarios">Apellido</label>
                                        </div>
                                        <div class="Input-Group-Usuarios Radio">
                                            <input type="Radio" id="masculino-Administrador" name="Genero-Administrador" value="Masculino">
                                            <label for="masculino-Administrador">Masculino</label>
                                            <input type="Radio" id="femenino-Administrador" name="Genero-Administrador" value="Femenino"> 
                                            <label for="femenino-Administrador">Femenino</label>
                                        </div>
                                    </div>
                                    <div class="Rigth-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="date" id="Nacimiento-Administrador" name="Nacimiento-Administrador" >
                                            <label for="Nacimiento-Administrador" class="label-Usuarios">Fecha de nacimiento</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Direccion-Administrador" name="Direccion-Administrador">
                                            <label for="Direccion-Administrador" class="label-Usuarios">Direccion de recidencia</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Telefono-Administrador" name="Telefono-Administrador" pattern="[0-9]{4,15}">
                                            <label for="Telefono-Administrador" class="label-Usuarios">Telefono</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Email-Administrador" name="Email-Administrador" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}">
                                            <label for="Email-Administrador" class="label-Usuarios">Email</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="file" id="Foto-Administrador" name="Foto-Administrador">
                                            <label class="label-Usuarios" for= "Foto-Administrador"><span class="fa fa-camera Img-Ciudadano"></span>Foto</label>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" name="Registro-Administrador" value="Registrar">
                            </form>
                        </div>
                    </div>
                    <div class="Listas">
                            <h2>Lista</h2>
                    </div>
                    <div class="Contenedor-Formulario-Usuarios">
                        <div class="Wrap-Listas">
                            <form action="Servlet_Administrador" class="Formulario" method="POST" name="Formulario_Listas" enctype="multipart/form-data">
                                <div class="Input-Group-Usuarios Radio">
                                    <input type="Radio" id="Ciudadanos" name="Listas-Usuarios" value="ciudadanos">
                                    <label for="Ciudadanos">Ciudadanos</label>
                                    <input type="Radio" id="Veterinaria" name="Listas-Usuarios" value="veterinaria"> 
                                    <label for="Veterinaria">Veterinaria</label>
                                    <input type="Radio" id="SASS" name="Listas-Usuarios" value="sass"> 
                                    <label for="SASS">Secretaria de Ambiente y Salud</label>
                                    <input type="Radio" id="Administradores" name="Listas-Usuarios" value="administradores"> 
                                    <label for="Administradores">Administradores</label>
                                </div>
                                <input type="submit" name="Consultar" value="Listar">
                            </form>
                        </div>
                    </div>
                </article>
            </main>
            <div class="Footer-Button">
                <label>Creado por Mappets Software &copy 2019 | Todos los derechos reservados</label>
            </div>
    </div>
    <script src="Estilos/JS/jquery.min.js"></script>
    <script src="Estilos/JS/headroom.min.js"></script>
    <script src="Estilos/JS/Menu-Admin.js"></script>

</body>
</html>