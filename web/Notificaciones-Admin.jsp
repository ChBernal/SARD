<%@page import="Modelo.Postulacion_M"%>
<%@page import="Modelo.GS_Postulacion"%>
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
                <a href="index.jsp" name="CerrarSesion"><i class='fa fa-sign-out'></i> Cerrar Sesion</a>
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
        
        <!-- Botones de Notificaciones -->
        
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
        
        <!-- Finaliza botones de notificaciones -->
        
        <!-- Ver postulaciones y denuncias -->

        <article class="DatosTodas">
            
            <!-- Datos de denuncias anonimas -->
            
            <div class="Anonimas">
                <%
                    ArrayList<GS_Denuncias> Dato_Anonima = new ArrayList<>();
                    Denuncias_M con = new Denuncias_M();
                    Dato_Anonima = con.Inicial_Denuncias();
                    GS_Denuncias Dat_Anonima = new GS_Denuncias();

                    for(int i=0; i<Dato_Anonima.size(); i++){
                        Dat_Anonima = Dato_Anonima.get(i);
                %>
                
                <!-- Info Denuncia anonima -->
                
                <div class="NombreDN">
                    <div class="Fecha">
                        <label><%=Dat_Anonima.getFecha()%></label>
                    </div>
                    <div class="Direccion">
                        <label><%=Dat_Anonima.getDireccion()%></label>
                    </div>
                    <div class="Correo">
                        <label><%=Dat_Anonima.getCorreo()%></label>
                    </div>
                    <div class="icono-observar">
                        <label class=" fa fa-eye Prueba-Anonima"></label>
                    </div>
                </div>
                    
                <!-- Finaliza Info Anonima -->
                    
                <!-- Ventanda modal con datos de denuncia -->
                    
                <div class="ModalAnonima">
                    <div class="Datos_DAnonima2">
                        <div class="HeaderAnonima">
                            <h1>Respuesta</h1>
                            <label class="fa fa-close cerrar_anonima"></label>
                        </div>
                        <form action="ServletDenuncias" method="Post">
                            <div class="BodyAnonima">
                                <div class="Img-Denuncia">
                                    <input type="hidden" name="Codigo_RA" class="Codigo_D" value="<%=Dat_Anonima.getCodigo()%>">
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
                                    <label class="btns-Respuestas Escrita">Responder</label>
                                    <input type="submit" class="btns-Respuestas" name="Predeterminada" value="Predeterminada">
                                </div>
                                <textarea class="Respuesta" name="Descripcion_RA" ></textarea>
                                <div class="btns">
                                    <input class="btns-Respuestas FinalizarA" type="submit" name="Finalizar" value="Responder y Finalizar">
                                    <input class="btns-Respuestas ContinuarA" type="submit" name="Continuacion" value="Responder y Continuar">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <%}%>
                  
                <!-- Finaliza Modal Anonima -->
                
            </div>
            
            <!-- Finaliza Denuncia Anonima -->
            
            <!-- Datos de denuncias anonimas -->
            
            <div class="Ciudadano">
                <%
                    ArrayList<GS_Denuncia_Cliente> Dato_Ciudadano = new ArrayList<>();
                    Dato_Ciudadano = con.Inicial_DenunciasC();
                    GS_Denuncia_Cliente Dat_Ciudadano = new GS_Denuncia_Cliente();

                    for(int i=0; i<Dato_Ciudadano.size(); i++){
                        Dat_Ciudadano = Dato_Ciudadano.get(i);
                %>
                
                <!-- Info Denuncia Ciudadano -->
                
                <div class="NombreDC">
                    <div class="Fecha">
                        <label><%=Dat_Ciudadano.getFecha()%></label>
                    </div>
                    <div class="Direccion">
                        <label><%=Dat_Ciudadano.getDireccion()%></label>
                    </div>
                    <div class="Correo">
                        <label><%=Dat_Ciudadano.getDocumento()%></label>
                    </div>
                    <div class="icono-observar">
                        <label class=" fa fa-eye Prueba-Cliente"></label>
                    </div>
                </div>
                    
                <!-- Finaliza Info Anonima -->
                    
                <!-- Ventanda modal con datos de denuncia -->
                    
                <div class="ModalCiudadano">
                    <div class="Datos_DCiudadano">
                        <div class="HeaderCiudadano">
                            <h1>Respuesta</h1>
                            <label class="fa fa-close cerrar_Ciudadano"></label>
                        </div>
                        <form action="ServletDenuncias" method="Post">
                            <div class="BodyCiudadano">
                                <div class="Img-Ciudadano">
                                    <input type="hidden" name="Codigo_RC" class="Codigo_C" value="<%=Dat_Ciudadano.getCodigo()%>">
                                    <img class="img-Ciudadano" src="<%=Dat_Ciudadano.getEvidencia()%>">
                                </div>
                                <div class="DatosDC">
                                    <label class="dat">Fecha:</label>
                                    <label><%=Dat_Ciudadano.getFecha()%></label>
                                    <label class="dat">Dirección:</label>
                                    <label><%=Dat_Ciudadano.getDireccion()%></label>
                                    <label class="dat">Correo:</label>
                                    <label><%=Dat_Ciudadano.getDocumento()%></label>
                                </div>  
                            </div>
                            <div class="Footer-BodyCiudadano">
                                <div class="Descrip">
                                    <b><label class=""> Descripcion:</label></b>
                                    <label><%=Dat_Ciudadano.getDescripcion()%></label>
                                </div>
                                <div class="respuestas">
                                    <label class="btns-Respuestas EscritaC">Responder</label>
                                    <input type="submit" class="btns-Respuestas" name="PredeterminadaC" value="Predeterminada">
                                </div>
                                <textarea class="Respuesta" name="Descripcion_RC" ></textarea>
                                <div class="btns">
                                    <input class="btns-Respuestas FinalizarC" type="submit" name="Finalizar" value="Responder y Finalizar">
                                    <input class="btns-Respuestas ContinuarC" type="submit" name="Continuacion" value="Responder y Continuar">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <%}%>
                  
                <!-- Finaliza Modal Ciduadano -->
                
            </div>
            
            <!-- Finaliza Denuncia Ciudadano -->
                
            <!-- Inicio Responder Postulaciones -->
                
            <div class="Postul">
            
                <%
                    ArrayList<GS_Postulacion> Dato_Postulacion = new ArrayList<>();
                    Postulacion_M ConsultaP = new Postulacion_M();
                    Dato_Postulacion = ConsultaP.VerPostulaciones();
                    GS_Postulacion GSP = new GS_Postulacion();

                    for(int i=0; i<Dato_Postulacion.size(); i++){
                        GSP = Dato_Postulacion.get(i);
                %>
                
                <!-- Datos de Postulacion Ciudadano -->
                
                <div class="NombreP">
                    <div class="Fecha">
                        <label><%=GSP.getFecha()%></label>
                    </div>
                    <div class="NombreM">
                        <label><%=GSP.getNombreMascota()%></label>
                    </div>
                    <div class="NombreC">
                        <label><%=GSP.getNombreP() %></label>
                    </div>
                    <div class="ApellidoP">
                        <label><%=GSP.getApellidoP() %></label>
                    </div>
                    <div class="icono-observar">
                            <label class=" fa fa-eye Prueba-Postulados"></label>
                    </div>
                </div>
                    
                    <%}%>
                    
                <!-- Finaliza Datos Postulacio-->
                
            </div>
                    
            <!-- finaliza Postulacion -->
            
        </article>
    </main>
			


    <!-- Importamos Todo JS -->

    <script src="Estilos/JS/jquery.min.js"></script>
    <script src="Estilos/JS/headroom.min.js"></script>
    <script src="Estilos/JS/Notificaciones-A.js"></script>

    <!-- Importamos Todo JS -->
	
</body>
</html>