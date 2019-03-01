<%@page import="Modelo.GS_Tips"%>
<%@page import="Modelo.Tips_M"%>
<%@page import="Modelo.GS_Eventos"%>
<%@page import="Modelo.Eventos_M"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelo.GS_Mascota"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Mascota_M"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="Estilos/CSS/Index.css">
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
                <a href="#Adopcion"><i class="fa fa-paw" aria-hidden="true"></i> Adopcion</a>
                <a href="#Eventos"><i class="fa fa-newspaper-o" aria-hidden="true"></i> Eventos</a>
                <a href="#Tips"><i class="fa fa-tag" aria-hidden="true"></i> Tips</a>
                <a href="#Contactenos"><i class="fa fa-map-o" aria-hidden="true"></i> Contactanos</a>
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
                </div>
            </div>
        </div>
    </div>
	
    <div class="Contenedor">
        <main>
            <div id="Inicio" class="Inicio">

            </div>

            <div id="Cabezera" class="Cabezera">
                <h1>Bienvenidos a MAppets</h1>
            </div>

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
                                <div class="Input-Group-Denuncia">
                                    <input type="email" id="Email" name="Email">
                                    <label class="label-Denuncia" for="Email">Email</label>
                                </div>
                                <input type="submit" name="DenunciaNN" value="Denunciar">
                            </form>
                        </div>	
                    </div>
                    <div class="Informacion">
                        <div class="Tipo-Maltrato">
                            <h2>5Libertades</h2>
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
                                        <img src="Uploads/Denuncia.jpg">
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
                                        <h2><%= GST.getNombre() %></h2>
                                    </div>                                   
                                    <div class="Datos_Tips">
                                        <label></label>
                                        <label>Tipo: <%= GST.getTip() %></label>
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
            <label>Creado por Christian Bernal &copy 2019 | Todos los derechos reservados</label>
        </div>
    </div>
    <script src="Estilos/JS/jquery.min.js"></script>
    <script src="Estilos/JS/headroom.min.js"></script>
    <script src="Estilos/JS/Index.js"></script>

</body>
</html>