<%@page import="Modelo.GS_Denuncia_Cliente"%>
<%@page import="Modelo.Denuncias_M"%>
<%@page import="Modelo.GS_Denuncias"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
    HttpSession Dat = request.getSession();
%>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="Estilos/CSS/Notificaciones-A.css">
    <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
    <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
    <script src="Estilos/alertifyjs/alertify.js"></script>
    <title>MAppets</title>
</head>
<body>
    
    <header id="header">
        <nav class="Menu">
            <div class="Enlaces">
                <a href="Menu-Admin.jsp"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a>
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

    <div class="Espacio-Perfil">
        <div class="PerfilUsuario" id="PerfilUsuario">
            <div class="Enlaces-Perfil">
                <a href="Perfil-Admin.jsp"><i class="fa fa-user-o"></i>Perfil</a>
                <a href="#">
                    Notificaciones
                </a>
                <a href=""><i class="fa fa-lock"></i>Cambio Contraseña</a>
                <hr>
                <a name="CerrarSesion"><i class='fa fa-sign-out'></i> Cerrar Sesion</a>
            </div>
        </div>	
    </div>
	
    <div class="Modal-Contrasena" id="Modal-Contrasena">
        <div class="flex-Contrasena" id="flex-Contrasena">
            <div class="Contenido-Modal-Contrasena">
                <div class="Header-Modal-Contrasena flex">
                    <h2>Cambio Contraseña</h2>	
                </div>
                <div class="Body-Modal-Contrasena">
                    <div class="Contenedor-Formulario-Contrasena">
                        <form action="../Controlador/GestionContrasena-C.php" class="Formulario" method="POST" name="Formulario_Contrasena">
                            <div>
                                <input type="hidden" name="Documento" value="<?php echo $_SESSION['Usu'] ?>">
                                <div class="Input-Group-Contrasena">
                                    <input type="password" id="ClaveAntigua" name="ClaveAntigua" pattern="[A-Za-z0-9!|°¬#$%&/()=?¡¿¨+´-_.:;,}]{8,20}">
                                    <label class="label-Contrasena" for="ClaveAntigua">Contraseña Actual </label>
                                </div>
                                <div class="Input-Group-Contrasena">
                                    <input type="password" id="ClaveNueva" name="ClaveNueva" pattern="[A-Za-z0-9!|°¬#$%&/()=?¡¿¨+´-_.:;,}]{8,20}">
                                    <label class="label-Contrasena" for="ClaveNueva">Nueva Contraseña </label>
                                </div>
                                <div class="Input-Group-Contrasena">
                                    <input type="password" id="RepetirClave" name="RepetirClave" pattern="[A-Za-z0-9!|°¬#$%&/()=?¡¿¨+´-_.:;,}]{8,20}">
                                    <label class="label-Contrasena" for="RepetirClave">Repita la contraseña </label>
                                </div>
                                <input type="submit" class="btn-submit" id="btn-submit" name="CambiarContrasena" value="Cambiar">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="Footer-Modal-Contrasena">

                </div>
            </div>
        </div>
    </div>

    <main>
        <article class="Notificaciones">
            <div class="DenunciasNN">
                <div>Denuncias Anonimas </div>
                <div class="ContarDN">2</div>
            </div>
            <div class="DenunciasCiudadano">
                <div>Denuncias Usuarios </div>
                <div class="ContarDN">2</div>
            </div>
            <div class="PostulacionesCiudadano">
                <div>Postulaciones </div>
                <div class="ContarDN">2</div>
            </div>
        </article>
        
        

        <article class="DatosTodas">
            <div class="Anonimas">
                <%
                    ArrayList<GS_Denuncias> Dato_Anonima = new ArrayList<>();
                    Denuncias_M con = new Denuncias_M();
                    Dato_Anonima = con.Tabla_Denuncias();
                    GS_Denuncias Dat_Anonima = new GS_Denuncias();

                    for(int i=0; i<Dato_Anonima.size(); i++){
                        Dat_Anonima = Dato_Anonima.get(i);
                %>
                <div class="NombreDN">
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
                <div class="ModalAnonima">
                    <div class="Datos_DAnonima2">
                        <div class="HeaderAnonima">
                            <h1>Respuesta</h1>
                            <label class="fa fa-close cerrar_anonima"></label>
                        </div>
                        <div class="BodyAnonima">
                            <div class="Img-Denuncia">
                                <input type="hidden" class="Codigo_D" value="<%=Dat_Anonima.getCodigo()%>">
                                <img class="img-Denuncia_A1" src="<%=Dat_Anonima.getEvidencia()%>">
                            </div>
                            <div class="DatosDA">
                                <label class="dat">Fecha:</label>
                                <label><%=Dat_Anonima.getFecha()%></label>
                                <label class="dat">Dirección:</label>
                                <label><%=Dat_Anonima.getDireccion()%></label>
                                <label class="dat">Correo:</label>
                                <label><%=Dat_Anonima.getCorreo()%></label>
                            </div>  
                        </div>
                        <div class="Footer-BodyAnonima">
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
                        </div>
                        <input class="Enviar_Respuesta_Anonima" type="submit" name="Res_Anonima" value="Enviar">
                    </div>
                </div>
                  <%}%>
            </div>
            

            <div class="Ciudadano">
                <%
                    ArrayList<GS_Denuncia_Cliente> Dato_Cliente = new ArrayList<>();
                    Denuncias_M D_Cliente = new Denuncias_M();
                    Dato_Cliente = D_Cliente.Tabla_Denuncias2();
                    GS_Denuncia_Cliente Dat_Cliente = new GS_Denuncia_Cliente();

                    for(int i=0; i<Dato_Cliente.size(); i++){
                        Dat_Cliente = Dato_Cliente.get(i);
                %>
                <div class="NombreDC">
                    <div class="Fecha">
                        <label><%=Dat_Cliente.getFecha()%></label>
                    </div>
                    <div class="Direccion">
                        <label><%=Dat_Cliente.getDireccion()%></label>
                    </div>
                    <div class="Evidencia">
                        <img src="<%=Dat_Cliente.getEvidencia()%>">
                    </div>
                    <div class="icono-observar">
                            <label class=" fa fa-eye Prueba-Cliente"></label>
                    </div>
                </div>
                <div class="Datos_DCliente">
                    <div class="Datos_DCliente2">
                        <label class="fa fa-close cerrar_Cliente"></label>
                        <h1>Respuesta</h1>
                        <input type="hidden" class="Codigo_D" value="<%=Dat_Cliente.getCodigo()%>">
                        <img class="img-Denuncia_C1" src="<%=Dat_Cliente.getEvidencia()%>">
                            <div class="Datos">
                                <label class="dat">Fecha:</label>
                                <label><%=Dat_Cliente.getFecha()%></label>
                                <label class="dat">Dirección:</label>
                                <label><%=Dat_Cliente.getDireccion()%></label>
                            </div>  
                            <div class="Descrip">
                                <b><label class=""> Descripcion:</label></b>
                                <label><%=Dat_Cliente.getDescripcion()%></label>
                            </div>
                            <div class="respuestas">
                                <label><input type="radio" class="btn-Responder" name="Respuesta" value="Respuesta" />
                                Responder</label>
                                <label><input type="radio" class="btn-Predeterminada" name="Predeterminada" value="Respuesta" />
                                Predeterminada</label>
                            </div>
                            <textarea class="Respuesta_Cliente" name="Respuesta" ></textarea>
                            <input class="Enviar_Respuesta_Cliente" type="submit" name="Res_Anonima" value="Enviar">
                    </div>
                    <div class="img-Denuncia_C2">
                        <label class="fa fa-close Cerrar_img_Cliente"></label>
                        <img   src="<%=Dat_Cliente.getEvidencia()%>">
                    </div>
                </div>
                <%}%>
                
                
                
            </div>
                <div class="Postul">
                    <div class="Postulados">
                    </div>
                    <div class="DatosPostulados">
                    </div>
                </div>
        </article>
    </main>
			


    <!-- Importamos Todo JS -->

    <script src="Estilos/JS/jquery.min.js"></script>
    <script src="Estilos/JS/headroom.min.js"></script>
    <script src="Estilos/JS/Notificaciones-A.js"></script>

    <!-- Importamos Todo JS -->
	
</body>
</html>