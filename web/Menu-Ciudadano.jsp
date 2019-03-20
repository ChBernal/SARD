<%@page import="Modelo.GS_Login"%>
<%@page import="Modelo.Login_M"%>
<%@page import="Modelo.GS_Tips"%>
<%@page import="Modelo.Tips_M"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelo.Ciudadano_M"%>
<%@page import="Modelo.GS_Ciudadano"%>
<%@page import="Modelo.GS_Denuncia_Cliente"%>
<%@page import="Modelo.GS_Eventos"%>
<%@page import="Modelo.Eventos_M"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.GS_Mascota"%>
<%@page import="Modelo.Mascota_M"%>
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
    <link rel="stylesheet" href="Estilos/CSS/Menu-Ciudadano.css">
    <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
    <title>MAppets</title>
</head>
<body>
    <header id="header">
        <nav class="Menu">
            <div class="Enlaces">
                <a href="#"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a>
                <a href="#Denuncias"><i class="fa fa-gavel" aria-hidden="true"></i> Denuncias</a>
                <a href="#Adopcion"><i class="fa fa-paw" aria-hidden="true"></i> Adopcion</a>
                <a href="#Eventos"><i class="fa fa-newspaper-o" aria-hidden="true"></i> Eventos</a>
                <a href="#Tips"><i class="fa fa-tag" aria-hidden="true"></i> Tips</a>
                <a href="#Contactenos"><i class="fa fa-map-o" aria-hidden="true"></i> Contactanos</a>
            </div>
            <div class="Usuario">
                <a href="#" class="btn-menu"><i class="icono fa fa-bars" aria-hidden="true"></i></a>
                <div class="Perfil">
                    <a href="#" class="Abrir" id="Abrir"><%=(String)Dat.getAttribute("NombreSession")%></a>
                    <%
                        Ciudadano_M con = new Ciudadano_M();
                        GS_Ciudadano Dato = new GS_Ciudadano(Doc);
                        ArrayList<GS_Ciudadano> datos = new ArrayList<>();
                        datos = con.Uno_Ciudadano(Dato);

                        for(int i=0; i<datos.size(); i++){
                            Dato= datos.get(i);
                    %>
                    <img width="40px" height="40px" src="<%= Dato.getFoto()%>">
                    <%
                        }
                    %>
                </div>
            </div>
        </nav>
    </header>   
                
    <!-- Espacio Del Perfil -->

    <div class="Espacio-Perfil">
        <div class="PerfilUsuario" id="PerfilUsuario">
            <div class="Enlaces-Perfil">
                <a href="Perfil_Ciudadano.jsp"><i class="fa fa-user-o"></i>Perfil</a>
                <a href=""><i class="Notifi">2</i>Notificaciones</a>
                <a href="Mascotas_Ciudadano.jsp"><i class="fa fa-paw"></i>Mis Mascotas</a>
                <a href=""><i class="fa fa-lock"></i>Cambio Contraseña</a>
                <hr>
                <a href="index.jsp"><i class='fa fa-sign-out'></i> Cerrar Sesion</a>
            </div>
        </div>	
    </div>	

    <!-- Fianliza Espacio Del Perfil -->
                
    <div class="Contenedor">
        <main>
            <div id="Inicio" class="Inicio">
                <!-- Espacio vacio para ver la imagen -->
            </div>

            <div id="Cabezera" class="Cabezera">
                <div id="Cabezera" class="Cabezera">
                    <h1>Bienvenid@ <%=(String)Dat.getAttribute("NombreSession")%></h1>
                </div>
            </div>
            <!-- Validacion primer ingreso -->
            <div>
                <%
                    Login_M Login = new Login_M();
                    ArrayList<GS_Login> Estado = new ArrayList<>();
                    Estado = Login.Uno_Usuario(Doc);
                    GS_Login GSL = new GS_Login();

                    for(int i=0; i<Estado.size(); i++){
                        GSL= Estado.get(i);
                %>
                <input type="hidden" name="PrimerIngreso" id="PrimerIngreso" value="<%=GSL.getEstado()%>" >    
                <% 
                }
                %>
            </div>
            
            <!-- termina validacion primer ingreso --!>
            <!-- Ventana Modal Con Formulario de Contraseña -->
            
            <div class="Modal-Contrasena" id="Modal-Contrasena">
		<div class="flex-Contrasena" id="flex-Contrasena">
                    <div class="Contenido-Modal-Contrasena">
                        <div class="Header-Modal-Contrasena flex-Con">
                            <h2>Cambio Contraseña</h2>	
                        </div>
                        <div class="Body-Modal-Contrasena">
                            <div class="Contenedor-Formulario-Contrasena">
                                <form action="ServletLogin" class="Formulario" method="POST" name="Formulario_Contrasena">
                                    <div>
                                        <input type="hidden" name="Documento" value="<%=Doc%>">
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
                                        <input type="hidden" name="Rol" value="5">
                                        <input type="submit" class="btn-submit" id="btn-submit" name="UsuarioContrasena" value="Cambiar">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="Footer-Modal-Contrasena">
                        </div>
                    </div>
		</div> 
            </div>
            	
            <!-- Finaliza Ventana Modal y Formulario de Contraseña -->
            
            
            <article id="Denuncias" class="Denuncias">
                <h1>Denuncias</h1>
                <div class="Contenido-Denuncias">
                    <div class="Contenedor-Formulario-Denuncia">
                        <div class="Wrap-Denuncia">
                            <form action="ServletDenuncias" class="Formulario" method="POST" name="Formulario_Denuncias" enctype="multipart/form-data">
                                <div class="Input-Group-Denuncia">
                                    <input type="text" id="Direccion" name="Direccion">
                                    <label class="label-Denuncia" for="Direccion">Direccion donde se evidencio el maltrato</label>
                                </div>
                                <div class="Input-Group-Denuncia">
                                    <input type="text" id="Descripcion" name="Descripcion">
                                    <label class="label-Denuncia" for="Descripcion">Describa brevemente el maltrato evidenciado</label>
                                </div>
                                <div class="Input-Group-Denuncia">
                                    <input type="file" id="Evidencia" name="Evidencia" accept="image/jpeg, image/png, image/gif">
                                    <label class="label-Denuncia" for="Evidencia"><span class="fa fa-camera Evidencia-Denuncia"></span> Adjunte evidencia (en caso de poseerla)</label>
                                </div>
                                <% String Documento=(String)Dat.getAttribute("DocumentoSession"); %>
                                <input type="hidden" name="Documento" value="<%=Documento%>">
                                <input type="submit" name="DenunciaCC" value="Denunciar">
                            </form>
                        </div>	
                    </div>
                        <div class="Informacion">
                            <div class="Tipo-Maltrato">
                                <h2>5 Libertades</h2>
                                <p>Recuerda que para que tu denuncia sea tomada en cuenta la mascota debe ser carente de alguno de
                                sus 5 libertades:</p>
                                <p>Libre de sed, hambre y malnutricion.</p>
                                <p>Libre de disconfort.</p>
                                <p>Libre de dolor y enfermedad.</p>
                                <p>Libre de expresarse.</p>
                                <p>Libre de miedo y estres.</p>
                                <p>si deseas saber mas <a href="">has click aqui.</a></p>
                            </div>
                            <div class="Consulta">
                                <h3>Consulta de denuncias</h3>
                                <div class="Contenedor-Formulario-Denuncia">
                                    <form action="" class="Formulario" method="POST" name="Formulario_Consulta">
                                        <div class="Input-Group-Denuncia">
                                            <input type="text" name="Codigo">
                                            <label class="label-Denuncia" for="Codigo">Indique el codigo de la denuncia</label>
                                        </div>
                                        <input type="submit" name="Consultar" value="Consultar">
                                    </form>
                                </div>
                            </div>
                        </div>
                </div>
            </article>

            <article id="Adopcion" class="Adopcion">
                    <h1>Adopcion</h1>
                    <hr>
                    <div class="Contenido-Adopcion">
                    <div class="Contenedor-Formulario-Adopcion">
                        <div class="Wrap-Adopcion">
                            
                            <div class="Posicion-Adopcion">
                            <%
                                Mascota_M MM = new Mascota_M();
                                ArrayList<GS_Mascota> Tabla_mascota = new ArrayList<>();    
                                GS_Mascota GSM = new GS_Mascota();
                                Tabla_mascota = MM.Mascota_Disponible();

                                for (int i = 0; i < Tabla_mascota.size();i++){
                                    GSM = Tabla_mascota.get(i);
                            %>
                                <div class="InfoMascota" name="InfoMascota">
                                    <div class="Imagen-Mascota">
                                        <img src="<%= GSM.getFoto() %>">
                                    </div>
                                    <div class="Datos_Mascota" >
                                        <h1><%=GSM.getNombre()%></h1>
                                        <label><%= GSM.getFecha_Nacimiento() %></label>
                                        <label><%= GSM.getGenero() %></label>
                                        <label><%= GSM.getRaza() %></label>
                                        <label><%= GSM.getColor() %></label>
                                    </div>
                                </div>
                                    <div class="Modal2">
                                        <div class="Contendio-Modal2">
                                            <label>Desea Postularce a <%= GSM.getNombre()%>?</label>
                                            <form action="Encuesta_Postulacion.jsp" method="post">
                                                <input type="hidden" name="Codigo" value="<%= GSM.getDocumento()%>">
                                                <input type="submit" name="btn-" value="Si">
                                            </form>
                                                <input type="submit" class="oculta" name="btn--" value="No">
                                        </div>
                                    </div>
                            <%
                                }    
                            %>
                            </div>
                        </div>
                    </div>
                </div>
                
            </article>

            <article id="Eventos" class="Eventos">
                <h1>Eventos</h1>
                <hr>
                <div class="Contenido-Eventos">
                    <div class="Contenedor-Formulario-Eventos">
                        <div class="Wrap-Eventos">
                            <div class="Posicion-Eventos">
                                <%
                                Eventos_M EM = new Eventos_M();
                                ArrayList<GS_Eventos> Datos_Eventos = new ArrayList<>();
                                GS_Eventos GSE = new GS_Eventos();
                                Datos_Eventos = EM.Tres_Eventos();

                                if (Datos_Eventos.size()>0){
                                    for (int i=0; i < Datos_Eventos.size(); i++){
                                        GSE = Datos_Eventos.get(i);
                                    
                                %>
                                <div class="CuadroEventos">
                                    <div>
                                        <label><%= GSE.getNombre() %></label>
                                        <img src="<%= GSE.getImagen()%>">
                                    </div>
                                </div>
                                <%
                                    }
                                }
                                %>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </article>

            <article id="Tips" class="Tips">
                <h1>Tips</h1>
                <hr>
                 <div class="Contenido-Tips">
                    <div class="Contenedor-Formulario-Tips">
                        <div class="Wrap-Tips">
                            <div class="Posicion-Tips">
                                <%
                                    Tips_M TM = new Tips_M();
                                    ArrayList<GS_Tips> Todo_Tips = new ArrayList<>();    
                                    GS_Tips GST = new GS_Tips();
                                    Todo_Tips = TM.Todo_Tips();

                                    for (int i = 0; i < Todo_Tips.size();i++){
                                        GST = Todo_Tips.get(i);
                                %>
                                <div class="CuadroTips">
                                    <div class="Nombre_Tips">
                                        <h2><%= GST.getTitulo()%></h2>
                                    </div>
                                    <div class="Imagen_Tips">
                                        <img src="<%= GST.getImagen()%>">
                                    </div>
                                    <div class="Datos_Tips">
                                        <label></label>
                                        <textarea> <%= GST.getDescripcion()%></textarea>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </article>

            <article id="Contactenos" class="Contactenos">
                <h1>Contactenos</h1>
                <hr>
                <div class="Contenido-Contactenos">
                    <div class="Contenedor-Formulario-Contactenos">
                        <div class="Wrap-Contactenos">
                            <form action="" method="POST" class="Formulario" name="Formulario_Contactenos">
                                <div class="Input-Group-Contactenos">
                                    <input type="text" id="Nombre" name="Nombre">
                                    <label class="label-Contactenos" for="Nombre">Nombre</label>
                                </div>
                                <div class="Input-Group-Contactenos">
                                    <input type="text" id="Apellido" name="Apellido">
                                    <label class="label-Contactenos" for="Apellido">Apellido</label>
                                </div>
                                <div class="Input-Group-Contactenos">
                                    <input type="email" id="Correo" name="Correo">
                                    <label class="label-Contactenos" for="Correo">Correo</label>
                                </div>
                                <div class="Input-Group-Contactenos">
                                    <input type="text" id="Informacion" name="Informacion">
                                    <label class="label-Contactenos" for="Informacion">Escribanos</label>
                                </div>
                                <input type="submit">	
                            </form>
                        </div>
                    </div>
                    <div>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3976.3749676726!2d-74.23259194017673!3d4.704753616071702!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f77f734f7e66d%3A0x83ab485e3ef33fdb!2sSecretaria+de+Ambiente%2C+Mosquera%2C+Cundinamarca!5e0!3m2!1ses!2sco!4v1547605521158" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                </div>
            </article>
        </main>

        <div class="Footer-Button">
            <label>Creado por SARD &copy 2019 | Todos los derechos reservados</label>
        </div>
    </div>
    <script src="Estilos/JS/jquery.min.js"></script>
    <script src="Estilos/JS/headroom.min.js"></script>
    <script src="Estilos/JS/Menu-Ciudadano.js"></script>

</body>
</html>