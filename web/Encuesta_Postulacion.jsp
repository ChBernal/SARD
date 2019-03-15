<%-- 
    Document   : Encuesta_Postulacion
    Created on : 14/03/2019, 11:21:44 AM
    Author     : User
--%>

<%@page import="Modelo.GS_Mascota"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Mascota_M"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="Estilos/CSS/Encuesta_Postulacion.css">
    <link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
    <title>MAppets</title>
</head>
<body>
    <div class="Barra">
        <a href="Menu-Ciudadano.jsp"><span class="fa fa-home"></span></a>
    </div>
    <!-- Article Adopcion Con Formulario para Postulacion -->

    <article id="Adopcion" class="Adopcion">

    <div class="Contenido-Modal">
        <div class="Header-Modal flex">
            <h2>Postulacion</h2>	
        </div>
        <div class="Body-Modal">
            <div class="Contenedor-Formulario">
                <form action="../Controlador/Encuesta-C.php" class="Formulario" method="POST" enctype="multipart/form-data" name="Formulario_Encuesta" >
                    <div class="Posicion-Postulacion">
                        <%
                            Mascota_M MM = new Mascota_M();  
                            GS_Mascota GSM = new GS_Mascota(1);
                            ArrayList<GS_Mascota> Tabla_mascota = new ArrayList<>();  
                            Tabla_mascota = MM.Uno_Mascota(GSM);

                            for (int i = 0; i < Tabla_mascota.size();i++){
                                GSM = Tabla_mascota.get(i);
                        %>
                        <div class="Lefth-Postulacion">
                            <div class="Mascota">
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
                        </div>
                        <%
                            }    
                        %>
                        <!-- Formulario Para realizar Postulacion -->

                        <div class="Rigth-Postulacion">
                            <div class="Seccion1">
                                <label class="Preguntas">¿Tienen todos los miembros de la familia conocimiento de la adopcion?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si1" name="Res1" value="Si">
                                        <label for="Si1">Si</label>
                                        <input type="radio" id="No1" name="Res1" value="No"> 
                                        <label for="No1">No</label>
                                </div>

                                <label class="Preguntas">¿Ha tenido mascotas anteriormente?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si2" name="Res2" value="Si">
                                        <label for="Si2">Si</label>
                                        <input type="radio" id="No2" name="Res2" value="No"> 
                                        <label for="No2">No</label>
                                </div>

                                <label class="Preguntas">¿En la actualidad tiene mascotas?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si3" name="Res3" value="Si">
                                        <label for="Si3">Si</label>
                                        <input type="radio" id="No3" name="Res3" value="No"> 
                                        <label for="No3">No</label>
                                </div>

                                <label class="Preguntas">¿Vive en casa propia?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si4" name="Res4" value="Si">
                                        <label for="Si4">Si</label>
                                        <input type="radio" id="No4" name="Res4" value="No"> 
                                        <label for="No4">No</label>
                                </div>

                                <label class="Preguntas">¿Su vivienda cuenta con el espacio suficiente para la mascota que desea adoptar?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si5" name="Res5" value="Si">
                                        <label for="Si5">Si</label>
                                        <input type="radio" id="No5" name="Res5" value="No"> 
                                        <label for="No5">No</label>
                                </div>
                            </div>
                            <div class="Siguiente1">
                                    Siguiente
                            </div>
                            <div class="Seccion2">
                                <label class="Preguntas">¿Cuenta con tiempo suficiente a diario para compartir con la mascota?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si6" name="Res6" value="Si">
                                        <label for="Si6">Si</label>
                                        <input type="radio" id="No6" name="Res6" value="No"> 
                                        <label for="No6">No</label>
                                </div>

                                <label class="Preguntas">¿En el núcleo familiar alguna persona es alérgica a los animales?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si7" name="Res7" value="Si">
                                        <label for="Si7">Si</label>
                                        <input type="radio" id="No7" name="Res7" value="No"> 
                                        <label for="No7">No</label>
                                </div>

                                <label class="Preguntas">¿Reconoce que en caso de mudarse de la propiedad actual, debe llevarse con usted a la mascota?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si8" name="Res8" value="Si">
                                        <label for="Si8">Si</label>
                                        <input type="radio" id="No8" name="Res8" value="No"> 
                                        <label for="No8">No</label>
                                </div>

                                <label class="Preguntas">¿Conoce los gastos económicos que implica tener una mascota?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si9" name="Res9" value="Si">
                                        <label for="Si9">Si</label>
                                        <input type="radio" id="No9" name="Res9" value="No"> 
                                        <label for="No9">No</label>
                                </div>

                                <label class="Preguntas">¿Esta dispuesto a recibir capacitación sobre la tenencia responsable de la mascota?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si10" name="Res10" value="Si">
                                        <label for="Si10">Si</label>
                                        <input type="radio" id="No10" name="Res10" value="No"> 
                                        <label for="No10">No</label>
                                </div>
                            </div>
                            <div class="Anterior1">
                                    Anterior
                            </div>
                            <div class="Siguiente2">
                                    Siguiente
                            </div>
                            <div class="Seccion3">
                                <label class="Preguntas">¿Comprende que la mascota tiene un periodo de adaptación y debe ser paciente mientras esto ocurre?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si11" name="Res11" value="Si">
                                        <label for="Si11">Si</label>
                                        <input type="radio" id="No11" name="Res11" value="No"> 
                                        <label for="No11">No</label>
                                </div>

                                <label class="Preguntas">¿Se compromete a garantizar el bienestar general de la mascota?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si12" name="Res12" value="Si">
                                        <label for="Si12">Si</label>
                                        <input type="radio" id="No12" name="Res12" value="No"> 
                                        <label for="No12">No</label>
                                </div>

                                <label class="Preguntas">¿Comprende que al sacar a su mascota a pasear debe recoger las excretas y disponerlas adecuadamente?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si13" name="Res13" value="Si">
                                        <label for="Si13">Si</label>
                                        <input type="radio" id="No13" name="Res13" value="No"> 
                                        <label for="No13">No</label>
                                </div>

                                <label class="Preguntas">¿Se compromete a tener un esquema de vacunación de la mascota actualizado?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si14" name="Res14" value="Si">
                                        <label for="Si14">Si</label>
                                        <input type="radio" id="No14" name="Res14" value="No"> 
                                        <label for="No14">No</label>
                                </div>

                                <label class="Preguntas">¿Se compromete a tener un esquema de desparacitacion de la mascota actualizado?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si15" name="Res15" value="Si">
                                        <label for="Si15">Si</label>
                                        <input type="radio" id="No15" name="Res15" value="No"> 
                                        <label for="No15">No</label>
                                </div>
                            </div>
                            <div class="Anterior2">
                                    Anterior
                            </div>
                            <div class="Siguiente3">
                                    Siguiente
                            </div>
                            <div class="Seccion4">
                                <label class="Preguntas">¿Comprende que mediante la Ley 1774 de 2016, se puede llegar a sancionar he incluso penalizar el maltrato animal?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si16" name="Res16" value="Si">
                                        <label for="Si16">Si</label>
                                        <input type="radio" id="No16" name="Res16" value="No"> 
                                        <label for="No16">No</label>
                                </div>

                                <label class="Preguntas">¿Comprende que la mascota que está despuesto a adoptar es una responsailidad que asume por el resto de la vida del animal?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si17" name="Res17" value="Si">
                                        <label for="Si17">Si</label>
                                        <input type="radio" id="No17" name="Res17" value="No"> 
                                        <label for="No17">No</label>
                                </div>

                                <label class="Preguntas">¿En caso de enfermarse la mascota esta dispuesto a brindar atención médica veterinaria y asumir los costos que esta requiera?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si18" name="Res18" value="Si">
                                        <label for="Si18">Si</label>
                                        <input type="radio" id="No18" name="Res18" value="No"> 
                                        <label for="No18">No</label>
                                </div>

                                <label class="Preguntas">¿Se compromete a mantener informada a la Secretaria de Ambiente y Desarrollo Agropecuario sobre cualquier novedad que se presente con la mascota?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si19" name="Res19" value="Si">
                                        <label for="Si19">Si</label>
                                        <input type="radio" id="No19" name="Res19" value="No"> 
                                        <label for="No19">No</label>
                                </div>

                                <label class="Preguntas">¿Se compromete a brindar amor y respeto a la mascota?</label>
                                <div class="Input-Group Radio">
                                        <input type="radio" id="Si20" name="Res20" value="Si">
                                        <label for="Si20">Si</label>
                                        <input type="radio" id="No20" name="Res20" value="No"> 
                                        <label for="No20">No</label>
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
                                    <input type="file" id="Cedula" name="Cedula" accept="application/pdf">
                                    <label class="label" for= "Cedula"><span class="fa fa-file"></span>Copia de su CC</label>
                                </div>
                                <div class="Input-Group">
                                    <input type="file" id="Recibo" name="Recibo" accept="application/pdf">
                                    <label class="label" for= "Recibo"><span class="fa fa-file"></span>Copia de Un recibo publico</label>
                                </div>
                            </div>
                            <div class="Anterior4">
                                    Anterior	
                            </div>
                            <button name="btn-Postulacion" class="btn-Postulacion">Postularme</button>
                        </div>

                        <!-- Finaliza Formulario Para realizar Postulacion -->
                            
                    </div>
                </form>
            </div>
        </div>
        <div class="Footer-Modal">

        </div>
    </div>
        <!-- Finaliza Ventana Modal Con Formulario para Postulacion -->
    </article>
    <script src="Estilos/JS/jquery.min.js"></script>
    <script src="Estilos/JS/Encuesta_Postulacion.js"></script>
</body>
</html>
