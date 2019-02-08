<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.GS_Mascota"%>
<%@page import="Modelo.Mascota_M"%>
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
                    <img src="<?=$_SESSION['Img']?>">
                </div>
            </div>
        </nav>
    </header>
    <div class="Contenedor-Perfil">
        <div class="Datos-Usuario">
            <a href="Perfil_Ciudadano.jsp"><span class="fa fa-user"></span>Perfil</a>
            <a href="Mascotas.jsp"><span class="fa fa-paw"></span>Mascotas</a>
            <a href="index.jsp"><span class="fa fa-times-circle-o"></span>Cerrar Session</a>
        </div>
    </div>                    
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
                <div class="Modal" id="Modal">
                    <div class="flex" id="flex">
                        <div class="Contenido-Modal">
                            <div class="Header-Modal flex">
                                <h2>Postulacion</h2>	
                                <span class="fa fa-times close" id="close"></span>	
                            </div>
                            <div class="Body-Modal">
                                <div class="Posicion-Postulacion">
                                    <div class="Lefth-Postulacion">
                                            <!-- espacio para hacer la consulta -->
                                        <div class="InfoMascota">
                                            <div class="Imagen-Mascota">
                                                <img src="Imagen">
                                            </div>
                                            <div class="Datos_Mascota">
                                                <h2>Nombre</h2>
                                                <label>Documento</label>
                                                <label>Fecha Nacimiento</label>
                                                <label>Tipo Mascota</label>
                                                <label>Genero</label>
                                                <label>Raza</label>
                                                <label>Color</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="Rigth-Postulacion">
                                        <div class="Contenedor-Formulario">
                                            <form action="<!-- Espacio para enviar al servlet -->" class="Formulario" method="POST" name="Formulario_Login">
                                                <datalist id="Opciones">
                                                    <option>Si</option>
                                                    <option>No</option>
                                                </datalist>
                                                <div class="Seccion1">
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res1" name="Res1" list="Opciones">
                                                        <label class="label" for="Res1">¿Tienen todos los miembros de la familia conocimiento de la adopcion?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res2" name="Res2" list="Opciones">
                                                        <label class="label" for="Res1">¿Ha tenido mascotas anteriormente?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" name="Res3" id="Res3" list="Opciones" ">
                                                        <label class="label" for="Res3">¿En la actualidad tiene mascotas?</label>
                                                    </div>	
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res4" name="Res4" list="Opciones">
                                                        <label class="label" for="Res4">¿Vive en casa propia?</label>
                                                    </div>
                                                </div>
                                                <div class="Siguiente1">
                                                        Siguiente
                                                </div>
                                                <div class="Seccion2">
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res5" name="Res5" list="Opciones">
                                                        <label class="label" for="Res5">¿Su vivienda cuenta con el espacio suficiente para la mascota que desea adoptar?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" name="Res6" id="Res6" list="Opciones" ">
                                                        <label class="label" for="Res6">¿Cuenta con tiempo suficiente a diario para compartir con la mascota?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res7" name="Res7" list="Opciones">
                                                        <label class="label" for="Res7">¿En el núcleo familiar alguna persona es alérgica a los animales?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res8" name="Res8" list="Opciones">
                                                        <label class="label" for="Res8">¿Reconoce que en caso de mudarse de la propiedad actual, debe llevarse con usted a la mascota?</label>
                                                    </div>
                                                </div>
                                                <div class="Anterior1">
                                                    Anterior
                                                </div>
                                                <div class="Siguiente2">
                                                    Siguiente
                                                </div>
                                                <div class="Seccion3">
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res9" name="Res9" list="Opciones">
                                                        <label class="label" for="Res9">¿Conoce los gastos económicos que implica tener una mascota?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" name="Res10" id="Res10" list="Opciones" ">
                                                        <label class="label" for="Res10">¿Esta dispuesto a recibir capacitación sobre la tenencia responsable de la mascota?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res11" name="Res11" list="Opciones">
                                                        <label class="label" for="Res11">¿Comprende que la mascota tiene un periodo de adaptación y debe ser paciente mientras esto ocurre?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res12" name="Res12" list="Opciones">
                                                        <label class="label" for="Res12">¿Se compromete a garantizar el bienestar general de la mascota?</label>
                                                    </div>
                                                </div>
                                                <div class="Anterior2">
                                                    Anterior
                                                </div>
                                                <div class="Siguiente3">
                                                    Siguiente
                                                </div>
                                                <div class="Seccion4">
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res13" name="Res13" list="Opciones">
                                                        <label class="label" for="Res13">¿Comprende que al sacar a su mascota a pasear debe recoger las excretas y disponerlas adecuadamente?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" name="Res14" id="Res14" list="Opciones" ">
                                                        <label class="label" for="Res14">¿Se compromete a tener un esquema de vacunación de la mascota actualizado?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res15" name="Res15" list="Opciones">
                                                        <label class="label" for="Res15">¿Se compromete a tener un esquema de desparacitacion de la mascota actualizado?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res16" name="Res16" list="Opciones">
                                                        <label class="label" for="Res16">¿Comprende que mediante la Ley 1774 de 2016, se puede llegar a sancionar he incluso penalizar el maltrato animal?</label>
                                                    </div>
                                                </div>
                                                <div class="Anterior3">
                                                    Anterior
                                                </div>
                                                <div class="Siguiente4">
                                                    Siguiente
                                                </div>
                                                <div class="Seccion5">
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res17" name="Res17" list="Opciones">
                                                        <label class="label" for="Res17">¿Comprende que la mascota que está despuesto a adoptar es una responsailidad que asume por el resto de la vida del animal?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" name="Res18" id="Res18" list="Opciones" ">
                                                        <label class="label" for="Res18">¿En caso de enfermarse la mascota esta dispuesto a brindar atención médica veterinaria y asumir los costos que esta requiera?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res19" name="Res19" list="Opciones">
                                                        <label class="label" for="Res19">¿Se compromete a mantener informada a la Secretaria de Ambiente y Desarrollo Agropecuario sobre cualquier novedad que se presente con la mascota?</label>
                                                    </div>
                                                    <div class="Input-Group">
                                                        <input type="text" id="Res20" name="Res20" list="Opciones">
                                                        <label class="label" for="Res20">¿Se compromete a brindar amor y respeto a la mascota?'</label>
                                                    </div>
                                                </div>
                                                <div class="Anterior4">
                                                        Anterior
                                                </div>
                                                <button name="btn-Postulacion" class="btn-Postulacion">Postularme</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="Footer-Modal">
                                <!-- Footer basio -->
                            </div>
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
    <script src="Estilos/JS/Menu-Ciudadano.js"></script>

</body>
</html>