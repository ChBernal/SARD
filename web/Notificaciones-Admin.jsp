<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
	<link rel="stylesheet" href="Estilos/CSS/Notificaciones-A.css">
	<link rel="stylesheet" href="Estilos/Iconos/css/font-awesome.min.css">
	<link rel="stylesheet" href="Estilos/alertifyjs/css/alertify.css">
	<script src="../Estilos/alertifyjs/alertify.js"></script>
	<title>MAppets</title>
    </head>
    <body>
        
        <header id="header">
		<nav class="Menu">
			<div class="Enlaces">
				<a href="../Vista/Menu-Admin.php"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a>
			</div>
			<div class="Usuario">
				<a href="#" class="btn-menu"><i class="icono fa fa-bars" aria-hidden="true"></i></a>
				<div class="Perfil">
					<a href="#" class="Abrir" id="Abrir"></a>
					<img src="../Uploads/<?=$_SESSION['Img']?>">
				</div>
				
			</div>
		</nav>
	</header>

	<div class="Espacio-Perfil">
		<div class="PerfilUsuario" id="PerfilUsuario">
			<div class="Enlaces-Perfil">
				<a href=""><i class="fa fa-user-o"></i>Perfil</a>
				<a href="#">
				<!--	
                                    <?php 
					if ($DatosN <= 0){
						echo "<i class='fa fa-sticky-note'></i>";
					}else {
						echo $DatosN;
					}
					?>
                                -->
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
						<form action="" class="Formulario" method="POST" name="Formulario_Contrasena">
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
				<!-- Aca poner la imprecion -->
				</div>
			</div>
		</div>
	</div>

	<main>
		<article class="Notificaciones">
			<div class="DenunciasNN">
				<div>Denuncias Anonimas</div>
			</div>
			<div class="DenunciasCiudadano">
				<div>Denuncias Usuarios</div>
			</div>
			<div class="PostulacionesCiudadano">
				<div>Postulaciones</div>
			</div>
		</article>
		<article class="Denuncias">
			<div class="Anonimas">
				
                                <!-- consulta de las anonimas -->
                            
				<div >
					
				</div>
				<div class="DatosDenunciaA">
					
				</div>
				
			</div>
			<div class="Ciudadano">
				
                                <!-- consulta de ususarios -->
                            
				<div >
					
				</div>
				<div class="DatosDenunciaA">
					
				</div>
				
			</div>
		</article>
		<article class="Postulaciones">
                            
                        <!-- consulta de Postulaciones -->
                    
			<div class="Postulados">
				
			</div>
			<div class="DatosDenunciaA">
				
			</div>
			
		</article>
	</main>

	<!-- Importamos Todo JS -->

	<script src="../Estilos/JS/jquery.min.js"></script>
	<script src="../Estilos/JS/headroom.min.js"></script>
	<script src="../Estilos/JS/Notificaciones-A.js"></script>

	<!-- Importamos Todo JS -->
	
        
    </body>
</html>