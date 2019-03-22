<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link rel="stylesheet" href="Estilos/CSS/Registro_Veterinaria.css">
        <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
        <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
        <script src="Estilos/alertifyjs/alertify.js"></script>
        <title>Registro_Veterinaria</title>
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
                    <input type="hidden" name="Rol_Insercion" value="0">
                    <input type="submit" name="Registro-Veterinaria" value="Registrar">
                </form>
            </div>
        </div>
        
        <script src="Estilos/JS/jquery.min.js"></script>
        <script src="Estilos/JS/headroom.min.js"></script>
        <script src="Estilos/JS/Registro_Veterinaria.js"></script>
    </body>
</html>
