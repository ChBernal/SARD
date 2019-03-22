<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelo.GS_Denuncia_Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Denuncias_M"%>
<!DOCTYPE html>
<%
    HttpSession Dat = request.getSession();
%>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="Estilos/CSS/Notificaciones-C.css">
    <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
    <link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
    <script src="Estilos/alertifyjs/alertify.js"></script>
    <title>MAppets</title>
</head>
<body>
    
    <header id="header">
        <nav class="Menu">
            <div class="Enlaces">
                <a href="Menu-Ciudadano.jsp"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a>
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
                <a href="Perfil_Ciudadano.jsp"><i class="fa fa-user-o"></i>Perfil</a>
                <a href="Notificaciones-Ciudadano.jsp"><i class="Notifi">2</i>Notificaciones</a>
                <a href="Mascotas_Ciudadano.jsp"><i class="fa fa-paw"></i>Mis Mascotas</a>
                <a href=""><i class="fa fa-lock"></i>Cambio Contraseña</a>
                <hr>
                <a href="index.jsp"><i class='fa fa-sign-out'></i> Cerrar Sesion</a>
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
        <article class="DatosTodas">            
            <div class="Denuncias">
            <%
                String Doc = (String)Dat.getAttribute("DocumentoSession");
                Denuncias_M DM = new Denuncias_M();
                ArrayList<GS_Denuncia_Cliente> Denuncia = new ArrayList<>();    
                GS_Denuncia_Cliente Mas = new GS_Denuncia_Cliente();
                Denuncia = DM.Ver_DenunciasC(Doc);

                for (int i = 0; i < Denuncia.size();i++){
                    Mas = Denuncia.get(i);
            %>
            </div>
            <div class="RespuestaDenuncia">
                <h2>Señor@ <%=(String)Dat.getAttribute("NombreSession")%></h2>
                <div class="DatosRespuesta">
                    <div class="imgRespuesta">
                        <img src="<%= Mas.getEvidencia() %>">
                    </div>
                    <div class="NombresDC">
                        <label>Con respescto a su denuncia:</label>
                        <label><%=Mas.getDescripcion()%> Generada el dia <%=Mas.getFecha()%></label>
                        <label>Se a generado la siguiente respuesta:</label>
                        <label><%=Mas.getDescripcionR()%></label>
                        <label>el dia <%=Mas.getFechaR()%></label>
                    </div>
                </div>
            </div>
            <%}%>
            <div class="Postulados">
                
            </div>
            <div class="DatosPostulados">
                
            </div>
            
        </article>
    </main>
			


    <!-- Importamos Todo JS -->

    <script src="Estilos/JS/jquery.min.js"></script>
    <script src="Estilos/JS/headroom.min.js"></script>
    <script src="Estilos/JS/Notificaciones-C.js"></script>

    <!-- Importamos Todo JS -->
	
</body>
</html>