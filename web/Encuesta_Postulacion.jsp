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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                            <%
                                Mascota_M MM = new Mascota_M();
                                ArrayList<GS_Mascota> Tabla_mascota = new ArrayList<>();    
                                GS_Mascota GSM = new GS_Mascota();
                                Tabla_mascota = MM.Mascota_Disponible();

                                for (int i = 0; i < Tabla_mascota.size();i++){
                                    GSM = Tabla_mascota.get(i);
                            %>
                                <img src="<%= GSM.getFoto() %>">
                                <div class="Datos_Mascota">
                                    <h2><%= GSM.getNombre()%></h2>
                                    <label><%= GSM.getTipo_Mascota()%></label>
                                    <label><%= GSM.getGenero()%></label>
                                    <label><%= GSM.getFecha_Nacimiento()%></label>
                                    <label>0<%= GSM.getDocumento()%></label>
                                    <label><%= GSM.getRaza()%></label>
                                </div>
                            <%
                                }    
                            %>
                            </div>
                            <div class="Rigth-Postulacion">
                                <div class="Contenedor-Formulario">
                                    <form action="Servlet_Postulacion" class="Formulario" method="POST" name="Formulario_Login">
                                        <datalist id="Opciones">
                                            <option>Si</option>
                                            <option>No</option>
                                        </datalist>
                                        <div class="Seccion1">
                                            <div class="Input-Group">
                                                <input type="text" id="Res1" name="Res1" list="Opciones" required>
                                                <label class="label active" for="Res1">¿Tienen todos los miembros de la familia conocimiento de la adopcion?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" id="Res2" name="Res2" list="Opciones" required>
                                                <label class="label active" for="Res2">¿Ha tenido mascotas anteriormente?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" name="Res3" id="Res3" list="Opciones" required>
                                                <label class="label active" for="Res3">¿En la actualidad tiene mascotas?</label>
                                            </div>	
                                            <div class="Input-Group">
                                                <input type="text" id="Res4" name="Res4" list="Opciones" required>
                                                <label class="label active" for="Res4">¿Vive en casa propia?</label>
                                            </div>
                                        </div>
                                        <div class="Siguiente1">
                                                Siguiente
                                        </div>
                                        <div class="Seccion2">
                                            <div class="Input-Group">
                                                <input type="text" id="Res5" name="Res5" list="Opciones" required>
                                                <label class="label active" for="Res5">¿Su vivienda cuenta con el espacio suficiente para la mascota que desea adoptar?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" name="Res6" id="Res6" list="Opciones" required>
                                                <label class="label active" for="Res6">¿Cuenta con tiempo suficiente a diario para compartir con la mascota?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" id="Res7" name="Res7" list="Opciones" required>
                                                <label class="label active" for="Res7">¿En el núcleo familiar alguna persona es alérgica a los animales?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" id="Res8" name="Res8" list="Opciones" required>
                                                <label class="label active" for="Res8">¿Reconoce que en caso de mudarse de la propiedad actual, debe llevarse con usted a la mascota?</label>
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
                                                <input type="text" id="Res9" name="Res9" list="Opciones" required>
                                                <label class="label active" for="Res9">¿Conoce los gastos económicos que implica tener una mascota?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" name="Res10" id="Res10" list="Opciones" required>
                                                <label class="label active" for="Res10">¿Esta dispuesto a recibir capacitación sobre la tenencia responsable de la mascota?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" id="Res11" name="Res11" list="Opciones" required>
                                                <label class="label active" for="Res11">¿Comprende que la mascota tiene un periodo de adaptación y debe ser paciente mientras esto ocurre?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" id="Res12" name="Res12" list="Opciones" required>
                                                <label class="label active" for="Res12">¿Se compromete a garantizar el bienestar general de la mascota?</label>
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
                                                <input type="text" id="Res13" name="Res13" list="Opciones" required>
                                                <label class="label active" for="Res13">¿Comprende que al sacar a su mascota a pasear debe recoger las excretas y disponerlas adecuadamente?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" name="Res14" id="Res14" list="Opciones" required>
                                                <label class="label active" for="Res14">¿Se compromete a tener un esquema de vacunación de la mascota actualizado?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" id="Res15" name="Res15" list="Opciones" required>
                                                <label class="label active" for="Res15">¿Se compromete a tener un esquema de desparacitacion de la mascota actualizado?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" id="Res16" name="Res16" list="Opciones" required>
                                                <label class="label active" for="Res16">¿Comprende que mediante la Ley 1774 de 2016, se puede llegar a sancionar he incluso penalizar el maltrato animal?</label>
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
                                                <input type="text" id="Res17" name="Res17" list="Opciones" required>
                                                <label class="label active" for="Res17">¿Comprende que la mascota que está despuesto a adoptar es una responsailidad que asume por el resto de la vida del animal?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" name="Res18" id="Res18" list="Opciones" required>
                                                <label class="label active" for="Res18">¿En caso de enfermarse la mascota esta dispuesto a brindar atención médica veterinaria y asumir los costos que esta requiera?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" id="Res19" name="Res19" list="Opciones" required>
                                                <label class="label active" for="Res19">¿Se compromete a mantener informada a la Secretaria de Ambiente y Desarrollo Agropecuario sobre cualquier novedad que se presente con la mascota?</label>
                                            </div>
                                            <div class="Input-Group">
                                                <input type="text" id="Res20" name="Res20" list="Opciones" required>
                                                <label class="label active" for="Res20">¿Se compromete a brindar amor y respeto a la mascota?'</label>
                                            </div>
                                        </div>
                                        <div class="Anterior4">
                                                Anterior
                                        </div>
                                        <input type="hidden" name="Documento" value="<%= Doc%>"> 
                                        <input type="hidden" name="Codigo" value="<%= GSM.getDocumento()%>"> 
                                        <button name="btn-Postulacion" class="btn-Postulacion">Siguiente</button>
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
    </body>
</html>
