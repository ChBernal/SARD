<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro_Ciudadano</title>
    </head>
    <body>
        <div class="Contenido-Ciudadano">
            <div class="Contenedor-Formulario-Ciudadano">
                <div class="Wrap-Ciudadano">
                    <form action="ServletCiudadano" class="Formulario" method="POST" name="Formulario_Registro" enctype="multipart/form-data">
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
                        <input type="submit" name="Registro-Ciudadano" value="Registrarme">
                    </form>
                </div>	
            </div>
        </div>
    </body>
</html>
