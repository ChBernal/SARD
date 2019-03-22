<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link rel="stylesheet" href="Estilos/CSS/Registro_Ciudadano.css">
        <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
        <script src="Estilos/alertifyjs/alertify.js"></script>
        <title>Registro_Ciudadano</title>
    </head>
    <body>
        <header id="header">
            <nav class="Menu">
                <div class="Enlaces">
                    <a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a>
                </div>
                <div class="Usuario">
                    <a href="#" class="btn-menu"><i class="icono fa fa-bars" aria-hidden="true"></i></a>
                    <a href="#" class="Abrir" id="Abrir"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Iniciar Sesion</a>
                </div>
            </nav>
        </header>
        
        <div class="Modal" id="Modal">
            <div class="flex" id="flex">
                <div class="Contenido-Modal">
                    <div class="Header-Modal flex">
                        <h2>Iniciar Sesion</h2>	
                        <span class="fa fa-times close" id="close"></span>	
                    </div>
                    <div class="Body-Modal">
                        <div class="Contenedor-Formulario">
                            <form action="ServletLogin" class="Formulario" method="POST" name="Formulario_Login">
                                <div>
                                    <div class="Input-Group">
                                        <input type="text" id="Usuario" name="Usuario" pattern="[0-9]{4,12}">
                                        <label class="label" for="Usuario">Usuario: </label>
                                    </div>
                                    <div class="Input-Group">
                                        <input type="password" id="Clave" name="Clave" pattern="[A-Za-z0-9!|°¬#$%&/()=?¡¿¨+´-_.:;,}]{8,20}">
                                        <label class="label" for="Clave">Clave: </label>
                                    </div>
                                    <div class="Input-Group Checkbox">
                                        <input type="Checkbox" name="Recuerdame" id="Recuerdame" value="true">
                                        <label for="Recuerdame">Recuerdame</label>
                                    </div>
                                    <input type="submit" class="btn-submit" id="btn-submit" name="Ingresar" value="Ingresar">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="Footer-Modal">
                        <a>Olvide la contraseña</a>
                        <BR>
                        <a href="Registro_Ciudadano.jsp">Registrate</a>
                    <br>
                    <label>Para registrar tu veterinaria has <a href="Registro_Veterinaria.jsp">click aqui</a></label>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="Contenido-Ciudadano">
            <div class="Contenedor-Formulario-Usuarios">
                <div class="Wrap-Ciudadano">
                    <form action="ServletUsuario" class="Formulario" method="POST" name="Formulario_Registro" enctype="multipart/form-data">
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
                        <input type="submit" name="Registrarme" value="Registrarme">
                    </form>
                </div>	
            </div>
        </div>
        
        <script src="Estilos/JS/jquery.min.js"></script>
        <script src="Estilos/JS/headroom.min.js"></script>
        <script src="Estilos/JS/Registro_Ciudadano.js"></script>
    </body>
</html>
