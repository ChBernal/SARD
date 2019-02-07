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
                <a href="#Denuncias"><i class="fa fa-gavel" aria-hidden="true"></i> Denuncias</a>
                <a href="#Mascotas"><i class="fa fa-paw" aria-hidden="true"></i> Mascotas</a>
                <a href="#Eventos"><i class="fa fa-newspaper-o" aria-hidden="true"></i> Eventos</a>
                <a href="#Tips"><i class="fa fa-tag" aria-hidden="true"></i> Tips</a>
                <a href="#Usuarios"><i class="fa fa-user" aria-hidden="true"></i> Usuarios</a>
            </div>
            <div class="Usuario">
                <a href="#" class="btn-menu"><i class="icono fa fa-bars" aria-hidden="true"></i></a>
                <div class="Perfil">
                    <a href="#" class="Abrir" id="Abrir"><%=(String)Dat.getAttribute("NombreSession")%></a>
                    <img src="">
                </div>
            </div>
        </nav>
    </header>
	
    <div class="Contenedor">
        <main>
            <div id="Cabezera" class="Cabezera">
                <h1>Bienvenido Administrador <%=(String)Dat.getAttribute("NombreSession")%></h1>
            </div>
            <article id="Denuncias" class="Denuncias">
                <h1>Denuncias</h1>
                <div class="Denuncia_Anonima">
                    <h1>Anonimas</h1>
                </div>
                <div class="Datos_Denuncia_Anonima">
                     <%
                        ArrayList<GS_Denuncias> Dato_Anonima = new ArrayList<>();
                        Denuncias_M con = new Denuncias_M();
                        Dato_Anonima = con.Tabla_Denuncias();
                        GS_Denuncias Dat_Anonima = new GS_Denuncias();

                        for(int i=0; i<Dato_Anonima.size(); i++){
                            Dat_Anonima = Dato_Anonima.get(i);
                    %>
                    <div class="Datos_Anonima">
                        <div class="Fecha">
                                <label><%=Dat_Anonima.getFecha()%></label>
                        </div>
                        <div class="Direccion">
                                <label><%=Dat_Anonima.getDireccion()%></label>
                        </div>
                        <div class="Evidencia">
                            <img src="<%=Dat_Anonima.getEvidencia()%>">
                        </div>
                        <div class="Correo">
                                <label><%=Dat_Anonima.getCorreo()%></label>
                        </div>
                        <div class="icono-observar">
                                <label class=" fa fa-eye Prueba-Anonima"></label>
                        </div>
                    </div>
                    <div class="Datos_DAnonima">
                        <div class="Datos_DAnonima2">
                            <label class="fa fa-close cerrar_anonima"></label>
                            <h1>Respuesta</h1>
                            <input type="hidden" class="Codigo_D" value="<%=Dat_Anonima.getCodigo()%>">
                            <img class="img-Denuncia_A1" src="<%=Dat_Anonima.getEvidencia()%>">
                                <div class="Datos">
                                    <label class="dat">Fecha:</label>
                                    <label><%=Dat_Anonima.getFecha()%></label>
                                    <label class="dat">Dirección:</label>
                                    <label><%=Dat_Anonima.getDireccion()%></label>
                                    <label class="dat">Correo:</label>
                                    <label><%=Dat_Anonima.getCorreo()%></label>
                                </div>  
                                <div class="Descrip">
                                    <b><label class=""> Descripcion:</label></b>
                                    <label><%=Dat_Anonima.getDescripcion()%></label>
                                </div>
                                <div class="respuestas">
                                    <label><input type="radio" class="btn-Responder" name="Respuesta" value="Respuesta" />
                                    Responder</label>
                                    <label><input type="radio" class="btn-Predeterminada" name="Predeterminada" value="Respuesta" />
                                    Predeterminada</label>
                                </div>
                                <textarea class="Respuesta" name="Respuesta" ></textarea>
                                <input class="Res_Anonima" type="submit" name="Res_Anonima" value="Enviar">
                        </div>
                        <div class="img-Denuncia_A2">
                            <label class="fa fa-close Cerrar_img_Anonima"></label>
                            <img   src="<%=Dat_Anonima.getEvidencia()%>">
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="Denuncia_Cliente">
                    <h1>Cliente</h1>
                </div>
                <div class="Datos_Denuncia_Cliente">
                     <%
                        ArrayList<GS_Denuncia_Cliente> Dato_Cliente = new ArrayList<>();
                        Denuncias_M D_Cliente = new Denuncias_M();
                        Dato_Cliente = D_Cliente.Tabla_Denuncias2();
                        GS_Denuncia_Cliente Dat_Cliente = new GS_Denuncia_Cliente();

                        for(int i=0; i<Dato_Cliente.size(); i++){
                            Dat_Cliente = Dato_Cliente.get(i);
                    %>
                    <div class="Datos_Anonima">
                        <div class="Fecha">
                                <label><%=Dat_Cliente.getFecha()%></label>
                        </div>
                        <div class="Direccion">
                                <label><%=Dat_Cliente.getDireccion()%></label>
                        </div>
                        <div class="Evidencia">
                            <img src="<%=Datt.getEvidencia()%>">
                        </div>
                        <div class="Correo">
                                <label><%=Datt.getCorreo()%></label>
                        </div>
                        <div class="icono-observar">
                                <label class=" fa fa-eye Prueba-Anonima"></label>
                        </div>
                    </div>
                    <div class="Datos_DAnonima">
                        <div class="Datos_DAnonima2">
                            <label class="fa fa-close cerrar_anonima"></label>
                            <h1>Respuesta</h1>
                            <input type="hidden" class="Codigo_D" value="<%=Datt.getCodigo()%>">
                            <img class="img-Denuncia_A1" src="<%=Datt.getEvidencia()%>">
                                <div class="Datos">
                                    <label class="dat">Fecha:</label>
                                    <label><%=Datt.getFecha()%></label>
                                    <label class="dat">Dirección:</label>
                                    <label><%=Datt.getDireccion()%></label>
                                    <label class="dat">Correo:</label>
                                    <label><%=Datt.getCorreo()%></label>
                                </div>  
                                <div class="Descrip">
                                    <b><label class=""> Descripcion:</label></b>
                                    <label><%=Datt.getDescripcion()%></label>
                                </div>
                                <div class="respuestas">
                                    <label><input type="radio" class="btn-Responder" name="Respuesta" value="Respuesta" />
                                    Responder</label>
                                    <label><input type="radio" class="btn-Predeterminada" name="Predeterminada" value="Respuesta" />
                                    Predeterminada</label>
                                </div>
                                <textarea class="Respuesta" name="Respuesta" ></textarea>
                                <input class="Res_Anonima" type="submit" name="Res_Anonima" value="Enviar">
                        </div>
                        <div class="img-Denuncia_A2">
                            <label class="fa fa-close Cerrar_img_Anonima"></label>
                            <img   src="<%=Datt.getEvidencia()%>">
                        </div>
                    </div>
                    <%}%>
                </div>
                
            </article>

                <article id="Mascotas" class="Adopcion">
                    <h1>Adopcion</h1>
                    <hr>
                    <div class="Contenido-Adopcion">
                        <div class="Contenedor-Formulario-Adopcion">
                            <div class="Wrap-Adopcion">
                                <form action="../Controlador/Mascota-C.php" class="Formulario" name="Formulario_Adopcion" method="POST" enctype="multipart/form-data">
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
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium deserunt necessitatibus atque placeat veniam iusto sed, quae voluptas, impedit unde quo suscipit neque tenetur pariatur harum repudiandae esse earum quod?</p>
                </article>

                <article id="Tips" class="Tips">

                </article>

                <article id="Usuarios" class="Usuarios">
                    <h1>Usuarios</h1>
                    <hr>
                    <div class="Ciudadanos">
                        <h2>Ciudadano</h2>
                    </div>
                    <div class="Contenedor-Formulario-Usuarios">
                        <div class="Wrap-Ciudadanos">
                            <form action="../Controlador/Ciudadano-C.php" class="Formulario" method="POST" name="Formulario_Ciudadano" enctype="multipart/form-data">
                                <div class="Posicion-Usuarios">
                                    <div class="Left-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Documento-Ciudadano" name="Documento-Ciudadano">
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
                                            <input type="text" id="Expedicion-Ciudadano" name="Expedicion-Ciudadano">
                                            <label for="Expedicion-Ciudadano" class="label-Usuarios">Lugar de expedicion</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Nombre-Ciudadano" name="Nombre-Ciudadano">
                                            <label for="Nombre-Ciudadano" class="label-Usuarios">Nombre</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Apellido-Ciudadano" name="Apellido-Ciudadano">
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
                                            <input type="text" id="Barrio-Ciudadano" name="Barrio-Ciudadano">
                                            <label for="Barrio-Ciudadano" class="label-Usuarios">Barrio</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Telefono-Ciudadano" name="Telefono-Ciudadano">
                                            <label for="Telefono-Ciudadano" class="label-Usuarios">Telefono</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Celular-Ciudadano" name="Celular-Ciudadano">
                                            <label for="Celular-Ciudadano" class="label-Usuarios">Celular</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Email-Ciudadano" name="Email-Ciudadano">
                                            <label for="Email-Ciudadano" class="label-Usuarios">Email</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Ocupacion-Ciudadano" name="Ocupacion-Ciudadano">
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
                            <form action="../Controlador/Veterinaria-C.php" class="Formulario" method="POST" name="Formulario_Veterinaria" enctype="multipart/form-data">
                                <div class="Posicion-Usuarios">
                                    <div class="Left-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Nit" name="Nit">
                                            <label for="Nit" class="label-Usuarios">NIT</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Nombre-Veterinaria" name="Nombre-Veterinaria">
                                            <label for="Nombre-Veterinaria" class="label-Usuarios">Nombre de la veterinaria</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Representante-Veterinaria" name="Representante-Veterinaria">
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
                                            <input type="text" id="Barrio-Veterinaria" name="Barrio-Veterinaria">
                                            <label for="Barrio-Veterinaria" class="label-Usuarios">Barrio</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Telefono-Veterinaria" name="Telefono-Veterinaria">
                                            <label for="Telefono-Veterinaria" class="label-Usuarios">Telefono</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Email-Veterinaria" name="Email-Veterinaria">
                                            <label for="Email-Veterinaria" class="label-Usuarios">Email</label>
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
                            <form action="../Controlador/SASS-C.php" class="Formulario" method="POST" name="Formulario_SASS" enctype="multipart/form-data">
                                <div class="Posicion-Usuarios">
                                    <div class="Left-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Documento-SASS" name="Documento-SASS">
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
                                            <input type="text" id="Nombre-SASS" name="Nombre-SASS">
                                            <label for="Nombre-SASS" class="label-Usuarios">Nombre</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Apellido-SASS" name="Apellido-SASS">
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
                                            <input type="text" id="Telefono-SASS" name="Telefono-SASS">
                                            <label for="Telefono-SASS" class="label-Usuarios">Telefono</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Email-SASS" name="Email-SASS">
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
                            <form action="../Controlador/Administrador-C.php" class="Formulario" method="POST" name="Formulario_Administrador" enctype="multipart/form-data">
                                <div class="Posicion-Usuarios">
                                    <div class="Left-Usuarios">
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Documento-Administrador" name="Documento-Administrador">
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
                                            <input type="text" id="Nombre-Administrador" name="Nombre-Administrador">
                                            <label for="Nombre-Administrador" class="label-Usuarios">Nombre</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Apellido-Administrador" name="Apellido-Administrador">
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
                                            <input type="date" id="Nacimiento-Administrador" name="Nacimiento-Administrador">
                                            <label for="Nacimiento-Administrador" class="label-Usuarios">Fecha de nacimiento</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Direccion-Administrador" name="Direccion-Administrador">
                                            <label for="Direccion-Administrador" class="label-Usuarios">Direccion de recidencia</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Telefono-Administrador" name="Telefono-Administrador">
                                            <label for="Telefono-Administrador" class="label-Usuarios">Telefono</label>
                                        </div>
                                        <div class="Input-Group-Usuarios">
                                            <input type="text" id="Email-Administrador" name="Email-Administrador">
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
                            <form action="" class="Formulario" method="POST" name="Formulario_Listas" enctype="multipart/form-data">
                                <div class="Input-Group-Usuarios Radio">
                                    <input type="Radio" id="Ciudadanos" name="Listas-Usuarios" value="ciudadanos">
                                    <label for="Lista-Usuarios">Ciudadanos</label>
                                    <input type="Radio" id="Veterinaria" name="Listas-Usuarios" value="veterinaria"> 
                                    <label for="Listas-Usuarios">Veterinaria</label>
                                    <input type="Radio" id="SASS" name="Listas-Usuarios" value="sass"> 
                                    <label for="Listas-Usuarios">Secretaria de Ambiente y Salud</label>
                                    <input type="Radio" id="Administradores" name="Listas-Usuarios" value="administradores"> 
                                    <label for="Listas-Usuarios">Administradores</label>
                                </div>
                                <input type="submit" name="Consultar" value="Listar">
                            </form>
                        </div>
                    </div>
                </article>
            </main>
            <div class="Footer-Button">
                <label>Creado por Christian Bernal &copy 2019 | Todos los derechos reservados</label>
            </div>
    </div>
    <script src="Estilos/JS/jquery.min.js"></script>
    <script src="Estilos/JS/headroom.min.js"></script>
    <script src="Estilos/JS/Menu-Admin.js"></script>

</body>
</html>