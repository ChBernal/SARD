//Efecto Parallax

$(document).ready(function(){
	$(window).scroll(function(){
		var Barra = $(window).scrollTop();
		var posicion = Barra * 0.07;

		$('body').css({
			'background-position': '0 -' + posicion +'px'
		});
	});
});

//finalizacion efecto parallax

//Todas las opciones del menu

$(function(){
	var header = document.getElementById('header');
	var headroom = new Headroom(header);
	headroom.init();

	var ancho = $(window).width(),
		enlaces = $('.Enlaces'),
		btnMenu = $('.btn-menu'),
		icono = $('.btn-menu .icono');

	if (ancho < 990) {
		enlaces.hide();
		icono.addClass('fa-bars');
	}

	btnMenu.on('click', function(e){
		enlaces.slideToggle();
		icono.toggleClass('fa-bars');
		icono.toggleClass('fa-times');
	});

	$(window).on('resize', function(){
		if($(this).width() > 990){
			enlaces.show();
			icono.addClass('fa-times');
			icono.removeClass('fa-bars');
		}else {
			enlaces.hide();
			icono.addClass('fa-bars');
			icono.removeClass('fa-times');
		}
	});

});
$(".Contenedor-Perfil .Datos-Usuario").hide();
$(".Usuario").click(function (){
        $(".Contenedor-Perfil .Datos-Usuario").animate({width:'toggle',opacity:'toggle'});
});

//Finalizacion de menu
// Acordeon Denuncias 
$(".Denuncias").hide();
$(".Datos_Denuncia_Anonima").hide();
$(".Datos_Denuncia_Cliente").hide();

$(".Denuncia_Anonima").click(function (){
    $(".Datos_Denuncia_Anonima").slideToggle();
    $(".Denuncia_Cliente").slideToggle(); 
});

$(".Denuncia_Cliente").click(function (){
    $(".Datos_Denuncia_Cliente").slideToggle();
    $(".Denuncia_Anonima").slideToggle(); 
});

// Modal denuncias anonimas
$(".Datos_DAnonima").hide();
$(".Prueba-Anonima").click(function (){
    var Index = $(".Prueba-Anonima").index(this);
    var Cod = $(".Datos_DAnonima").eq(Index);
    Cod.show();
});
$(".Datos_DCliente").hide();
$(".Prueba-Cliente").click(function (){
    var Index = $(".Prueba-Cliente").index(this);
    var Cod = $(".Datos_DCliente").eq(Index);
    Cod.show();
});

$(".cerrar_anonima").click(function (){
    $(".Datos_DAnonima").hide();
    $(".Respuesta").val("");
    $(".Respuesta").hide();
});
$(".cerrar_Cliente").click(function (){
    $(".Datos_DCliente").hide();
    $(".Respuesta_Cliente").val("");
    $(".Respuesta_Cliente").hide();
});
// opcion respuesta
$(".img-Denuncia_A1").mouseenter(function (){
    $(".img-Denuncia_A1").css("cursor","zoom-in");
});
$(".img-Denuncia_C1").mouseenter(function (){
    $(".img-Denuncia_C1").css("cursor","zoom-in");
});
$(".img-Denuncia_A2").hide();
$(".img-Denuncia_A1").click(function (){
    $(".Datos_DAnonima2").hide();
    $(".img-Denuncia_A2").show();
});
$(".img-Denuncia_C2").hide();
$(".img-Denuncia_C1").click(function (){
    $(".Datos_DCliente2").hide();
    $(".img-Denuncia_C2").show();
});
$(".Cerrar_img_Anonima").click(function (){
     $(".img-Denuncia_A2").hide();
     $(".Datos_DAnonima2").show();
});
$(".Cerrar_img_Cliente").click(function (){
     $(".img-Denuncia_C2").hide();
     $(".Datos_DCliente2").show();
});
document.querySelectorAll('[name=Respuesta]').forEach((x) => x.checked = false);
document.querySelectorAll('[name=Predeterminada]').forEach((x) => x.checked = false);

$(".Respuesta").hide();
$(".Respuesta_Cliente").hide();

$(".btn-Responder").click(function (){
    $(".Respuesta").show();
    $(".Respuesta_Cliente").show();
    document.querySelectorAll('[name=Predeterminada]').forEach((x) => x.checked = false);
});

$(".btn-Predeterminada").click(function (){
    document.querySelectorAll('[name=Respuesta]').forEach((x) => x.checked = false);
    $(".Respuesta").hide();
    $(".Respuesta_Cliente").hide();
    $(".Respuesta").val("");
    $(".Respuesta_Cliente").val("");
});

// envio de respuesta denuncia anonima 
$(".Enviar_Respuesta_Anonima").click(function (){
        var Index = $(".Enviar_Respuesta_Anonima").index(this);
        var Cod = $(".Codigo_D").eq(Index);
        var Des = $(".Respuesta").eq(Index);
        var Codigo = Cod.val();
        var Descripcion = Des.val();
        var btn = "Anonima";
        
        $.ajax({
            url: "ServletDenuncias",
            data: {
              Boton : btn,
              Codigo_RA: Codigo,
              Descripcion_RA: Descripcion
            },
            success: function( result ) {
              $( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
            }
          });
    });
 // envio de respuesta denuncia Cliente
$(".Enviar_Respuesta_Cliente").click(function (){
        var Index = $(".Enviar_Respuesta_Cliente").index(this);
        var Cod = $(".Codigo_D").eq(Index);
        var Des = $(".Respuesta_Cliente").eq(Index);
        var Codigo = Cod.val();
        var Descripcion = Des.val();
        var btn = "Cliente";
        $.ajax({
            url: "ServletDenuncias",
            data: {
              Boton : btn,
              Codigo_RC: Codigo,
              Descripcion_RC: Descripcion
            },
            success: function( result ) {
              $( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
            }
          });
    });

//Opciones de acordeon

$(document).ready(function(){
	$(".Wrap-Ciudadanos").hide();
	$(".Wrap-Veterinaria").hide();
	$(".Wrap-SASS").hide();
	$(".Wrap-Administrador").hide();
	$(".Wrap-Listas").hide();

//Acordeon Ciudadano

	$(".Ciudadanos").click(function(){
		$(".Wrap-Ciudadanos").slideToggle();
		$(".Wrap-Veterinaria").slideUp();
		$(".Wrap-SASS").slideUp();
		$(".Wrap-Administrador").slideUp();
		$(".Wrap-Listas").slideUp();
		$(".Veterinarias").slideToggle();
		$(".SASS").slideToggle();
		$(".Administrador").slideToggle();
		$(".Listas").slideToggle();
	}); 

//Finalza Ciudadano

//Acordeon Veterinaria

	$(".Veterinarias").click(function(){
		$(".Wrap-Veterinaria").slideToggle();
		$(".Wrap-Ciudadanos").slideUp();
		$(".Wrap-SASS").slideUp();
		$(".Wrap-Administrador").slideUp();
		$(".Wrap-Listas").slideUp();
		$(".Ciudadanos").slideToggle();
		$(".SASS").slideToggle();
		$(".Administrador").slideToggle();
		$(".Listas").slideToggle();
	}); 

//Finalza Veterinaria

//Acordeon SASS

	$(".SASS").click(function(){
		$(".Wrap-SASS").slideToggle();
		$(".Wrap-Ciudadanos").slideUp();
		$(".Wrap-Veterinaria").slideUp();
		$(".Wrap-Administrador").slideUp();
		$(".Wrap-Listas").slideUp();
		$(".Ciudadanos").slideToggle();
		$(".Veterinarias").slideToggle();
		$(".Administrador").slideToggle();
		$(".Listas").slideToggle();
	}); 

//Finalza SASS

//Acordeon Administrador

	$(".Administrador").click(function(){
		$(".Wrap-Administrador").slideToggle();
		$(".Wrap-Ciudadanos").slideUp();
		$(".Wrap-Veterinaria").slideUp();
		$(".Wrap-SASS").slideUp();
		$(".Wrap-Listas").slideUp();
		$(".Ciudadanos").slideToggle();
		$(".Veterinarias").slideToggle();
		$(".SASS").slideToggle();
		$(".Listas").slideToggle();
	}); 

//Finalza Administrador

//Acordeon Listas

	$(".Listas").click(function(){
		$(".Wrap-Listas").slideToggle();
		$(".Wrap-Ciudadanos").slideUp();
		$(".Wrap-Veterinaria").slideUp();
		$(".Wrap-SASS").slideUp();
		$(".Wrap-Administrador").slideUp();
		$(".Ciudadanos").slideToggle();
		$(".Veterinarias").slideToggle();
		$(".SASS").slideToggle();
		$(".Administrador").slideToggle();
	}); 

//Finalza Listas

});

//Finaliza acordeon

//Todos los formularios

//Todo formulario Mascota

(function(){
	var formulario = document.Formulario_Adopcion,
		elementos = formulario.elements;

	//Funciones

	$("#Estado-Mascota").change(function(){
		var Uno = "Adoptado";
		var Dos = "Con Propietario";
		var Tres = "Disponible";
		var valor =$("#Estado-Mascota").val();
		if (valor == Dos || valor == Uno){
			$(".Opcional").css("display", "flex");
		}else if (valor = "Disponible") {
			$(".Opcional").css("display", "none");
			$(".Opcional").css("width", "0px");
			$(".Opcional").css("height", "0px");
			$(".Opcional").text("0");
		}else if (valor = "En Proceso") {
			$(".Opcional").css("display", "none");
			$(".Opcional").css("width", "0px");
			$(".Opcional").css("height", "0px");
			$(".Opcional").text("1");	
		}
	});

	var ValidarInputs = function(){
		for (var i = 0; i < elementos.length; i++) {
			if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date" ) {
				if (elementos[i].value == 0) {
					console.log('El Campo ' + elementos[i].name + ' esta incompleto');
					elementos[i].className = elementos[i].className + " error";
					return false;
				} else {
					elementos[i].className = elementos[i].className.replace(" error", "");
				}
			}
		}

		return true;
	};

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Genero-Mascota'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Genero-Mascota") {
				for (var j = 0; j < opciones.length; j++) {
					if (opciones[j].checked){
						resultado = true;
						break;
					}
				}

				if (resultado == false){
					elementos[i].parentNode.className = elementos[i].parentNode.className + " error";
					console.log('El campo radio esta incompleto');
					return false;
				}else {
					elementos[i].parentNode.className = elementos[i].parentNode.className.replace (" error", "");
					return true;
				}
			}
		}

	};

	var enviar = function(e){
		if (!ValidarInputs()) {
			console.log('Falto validar los Input');
			e.preventDefault();
		}else if (!ValidarRadio()) {
			console.log('Falto validar los Radio');
			e.preventDefault();
		}else {
			console.log('Envia correctamente');
			//e.preventDefault();
		}
	};

	//Funciones blur y focus

	var focusInputs = function(){
		this.parentElement.children[1].className = "label-Mascota active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Mascota";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

	for (var i = 0; i < elementos.length; i++) {
		if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date") {
			elementos[i].addEventListener("focus", focusInputs);
			elementos[i].addEventListener("blur", blurInputs);
		}
	}

}());

//Finalizacion de Mascota

//Todo formulario Eventos

(function(){
	var formulario = document.Formulario_Eventos,
		elementos = formulario.elements;

	//Funciones

	var ValidarInputs = function(){
		for (var i = 0; i < elementos.length; i++) {
			if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date" ) {
				if (elementos[i].value == 0) {
					console.log('El Campo ' + elementos[i].name + ' esta incompleto');
					elementos[i].className = elementos[i].className + " error";
					return false;
				} else {
					elementos[i].className = elementos[i].className.replace(" error", "");
				}
			}
		}

		return true;
	};

	var enviar = function(e){
		if (!ValidarInputs()) {
			console.log('Falto validar los Input');
			e.preventDefault();
		}else {
			console.log('Envia correctamente');
			//e.preventDefault();
		}
	};

	//Funciones blur y focus

	var focusInputs = function(){
		this.parentElement.children[1].className = "label-Eventos active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Eventos";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

	for (var i = 0; i < elementos.length; i++) {
		if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date") {
			elementos[i].addEventListener("focus", focusInputs);
			elementos[i].addEventListener("blur", blurInputs);
		}
	}

}());

//Finalizacion de Eventos

//Todo formulario Ciudadano

(function(){
	var formulario = document.Formulario_Ciudadano,
		elementos = formulario.elements;

	//Funciones

	var ValidarInputs = function(){
		for (var i = 0; i < elementos.length; i++) {
			if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date" ) {
				if (elementos[i].value == 0) {
					console.log('El Campo ' + elementos[i].name + ' esta incompleto');
					elementos[i].className = elementos[i].className + " error";
					return false;
				} else {
					elementos[i].className = elementos[i].className.replace(" error", "");
				}
			}
		}

		return true;
	};

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Genero-Ciudadano'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Genero-Ciudadano") {
				for (var j = 0; j < opciones.length; j++) {
					if (opciones[j].checked){
						resultado = true;
						break;
					}
				}

				if (resultado == false){
					elementos[i].parentNode.className = elementos[i].parentNode.className + " error";
					console.log('El campo radio esta incompleto');
					return false;
				}else {
					elementos[i].parentNode.className = elementos[i].parentNode.className.replace (" error", "");
					return true;
				}
			}
		}

	};

	var enviar = function(e){
		if (!ValidarInputs()) {
			console.log('Falto validar los Input');
			e.preventDefault();
		}else if (!ValidarRadio()) {
			console.log('Falto validar los Radio');
			e.preventDefault();
		}else {
			console.log('Envia correctamente');
			//e.preventDefault();
		}
	};

	//Funciones blur y focus

	var focusInputs = function(){
		this.parentElement.children[1].className = "label-Usuarios active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Usuarios";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

	for (var i = 0; i < elementos.length; i++) {
		if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date") {
			elementos[i].addEventListener("focus", focusInputs);
			elementos[i].addEventListener("blur", blurInputs);
		}
	}

}());

//Finalizacion de Ciudadano

//Formulario Veterinaria

(function(){
	var formulario = document.Formulario_Veterinaria,
		elementos = formulario.elements;

	//Funciones

	var ValidarInputs = function(){
		for (var i = 0; i < elementos.length; i++) {
			if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date" ) {
				if (elementos[i].value == 0) {
					console.log('El Campo ' + elementos[i].name + ' esta incompleto');
					elementos[i].className = elementos[i].className + " error";
					return false;
				} else {
					elementos[i].className = elementos[i].className.replace(" error", "");
				}
			}
		}

		return true;
	};

	var enviar = function(e){
		if (!ValidarInputs()) {
			console.log('Falto validar los Input');
			//e.preventDefault();
		}else {
			console.log('Envia correctamente');
			//e.preventDefault();
		}
	};

	//Funciones blur y focus

	var focusInputs = function(){
		this.parentElement.children[1].className = "label-Usuarios active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Usuarios";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

	for (var i = 0; i < elementos.length; i++) {
		if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date") {
			elementos[i].addEventListener("focus", focusInputs);
			elementos[i].addEventListener("blur", blurInputs);
		}
	}

}());

//Finalizacion de Veterinaria

//Formulario SASS

(function(){
	var formulario = document.Formulario_SASS,
		elementos = formulario.elements;

	//Funciones

	var ValidarInputs = function(){
		for (var i = 0; i < elementos.length; i++) {
			if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date" ) {
				if (elementos[i].value == 0) {
					console.log('El Campo ' + elementos[i].name + ' esta incompleto');
					elementos[i].className = elementos[i].className + " error";
					return false;
				} else {
					elementos[i].className = elementos[i].className.replace(" error", "");
				}
			}
		}

		return true;
	};

	var ValidarRadio = function(){
		var opciones = document.getElementsByName("Genero-SASS");
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Genero-SASS") {
				for (var j = 0; j < opciones.length; j++) {
					if (opciones[j].checked){
						resultado = true;
						break;
					}
				}

				if (resultado == false){
					elementos[i].parentNode.className = elementos[i].parentNode.className + " error";
					console.log('El campo radio esta incompleto');
					return false;
				}else {
					elementos[i].parentNode.className = elementos[i].parentNode.className.replace (" error", "");
					return true;
				}
			}
		}

	};

	var enviar = function(e){
		if (!ValidarInputs()) {
			console.log('Falto validar los Input');
			e.preventDefault();
		}else if (!ValidarRadio()) {
			console.log('Falto validar los Radio');
			e.preventDefault();
		}else {
			console.log('Envia correctamente');
			//e.preventDefault();
		}
	};

	//Funciones blur y focus

	var focusInputs = function(){
		this.parentElement.children[1].className = "label-Usuarios active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Usuarios";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

	for (var i = 0; i < elementos.length; i++) {
		if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date") {
			elementos[i].addEventListener("focus", focusInputs);
			elementos[i].addEventListener("blur", blurInputs);
		}
	}

}());

//Finalizacion de SASS

//Formulario Administrador

(function(){
	var formulario = document.Formulario_Administrador,
		elementos = formulario.elements;

	//Funciones

	var ValidarInputs = function(){
		for (var i = 0; i < elementos.length; i++) {
			if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date" ) {
				if (elementos[i].value == 0) {
					console.log('El Campo ' + elementos[i].name + ' esta incompleto');
					elementos[i].className = elementos[i].className + " error";
					return false;
				} else {
					elementos[i].className = elementos[i].className.replace(" error", "");
				}
			}
		}

		return true;
	};

	var ValidarRadio = function(){
		var opciones = document.getElementsByName("Genero-Administrador");
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Genero-Administrador") {
				for (var j = 0; j < opciones.length; j++) {
					if (opciones[j].checked){
						resultado = true;
						break;
					}
				}

				if (resultado == false){
					elementos[i].parentNode.className = elementos[i].parentNode.className + " error";
					console.log('El campo radio esta incompleto');
					return false;
				}else {
					elementos[i].parentNode.className = elementos[i].parentNode.className.replace (" error", "");
					return true;
				}
			}
		}

	};

	var enviar = function(e){
		if (!ValidarInputs()) {
			console.log('Falto validar los Input');
			e.preventDefault();
		}else if (!ValidarRadio()) {
			console.log('Falto validar los Radio');
			e.preventDefault();
		}else {
			console.log('Envia correctamente');
			//e.preventDefault();
		}
	};

	//Funciones blur y focus

	var focusInputs = function(){
		this.parentElement.children[1].className = "label-Usuarios active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Usuarios";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

	for (var i = 0; i < elementos.length; i++) {
		if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password" || elementos[i].type == "date") {
			elementos[i].addEventListener("focus", focusInputs);
			elementos[i].addEventListener("blur", blurInputs);
		}
	}

}());

//Finalizacion de Administrador

//Formulario Listas

(function(){
	var formulario = document.Formulario_Listas,
		elementos = formulario.elements;

	//Funciones

	var ValidarRadio = function(){
		var opciones = document.getElementsByName("Listas-Usuarios");
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Listas-Usuarios") {
				for (var j = 0; j < opciones.length; j++) {
					if (opciones[j].checked){
						resultado = true;
						break;
					}
				}

				if (resultado == false){
					elementos[i].parentNode.className = elementos[i].parentNode.className + " error";
					console.log('El campo radio esta incompleto');
					return false;
				}else {
					elementos[i].parentNode.className = elementos[i].parentNode.className.replace (" error", "");
					return true;
				}
			}
		}

	};

	var enviar = function(e){
		if (!ValidarRadio()) {
			console.log('Falto validar los Radio');
			e.preventDefault();
		}else {
			console.log('Envia correctamente');
			//e.preventDefault();
		}
	};

	//Funciones blur y focus

	var focusInputs = function(){
		this.parentElement.children[1].className = "label-Usuarios active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Usuarios";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

}());

//Finalizacion de Listas


//Finaliza formularios