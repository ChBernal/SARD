//Efecto Parallax

$(document).ready(function(){
	$(window).scroll(function(){
		var Barra = $(window).scrollTop();
		var posicion = Barra * 0.30;

		$('body').css({
			'background-position': '0 -' + posicion +'px'
		});
	});
});

//finalizacion efecto parallax

// Todas la opnciones del formulario de login

(function(){
	var formulario = document.Formulario_Login,
		elementos = formulario.elements;

	//Funciones

	var ValidarInputs = function(){
		for (var i = 0; i < elementos.length; i++) {
			if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password") {
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
		}
	};

	//Funciones blur y focus

	var focusInputs = function(){
		this.parentElement.children[1].className = "label active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

	for (var i = 0; i < elementos.length; i++) {
		if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password") {
			elementos[i].addEventListener("focus", focusInputs);
			elementos[i].addEventListener("blur", blurInputs);
		}
	}

});

//Finalizacion de formulario login

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

//Todas las opciones del contenido modal

$(document).ready(function(){
    $(".Modal").hide();
    $(".InfoMascota").click(function(){
        var Pos = $(".Imagen_Mascota").index(this);
        var x = $(".InfoMascota").index(this);
        var Asi = $(".Datos-Mascota").eq(Pos);
        var Modal = $(".Modal").eq(x);
        Modal.show();
    });
    $(".close").click(function(){
        $(".Modal").hide();
    });
});

$(document).ready(function(){
	$(".Seccion2").hide();
	$(".Siguiente2").hide();
	$(".Anterior1").hide();
	$(".Seccion3").hide();
	$(".Siguiente3").hide();
	$(".Anterior2").hide();
	$(".Seccion4").hide();
	$(".Siguiente4").hide();
	$(".Anterior3").hide();
	$(".Seccion5").hide();
	$(".btn-Postulacion").hide();
	$(".Anterior4").hide();

	$(".Siguiente1").click(function(){
		$(".Seccion1").hide(0);
		$(".Siguiente1").hide(0);
		$(".Seccion2").slideToggle(0);
		$(".Siguiente2").slideToggle(0);
		$(".Anterior1").slideToggle(0);
	});

	$(".Anterior1").click(function(){
		$(".Seccion1").slideToggle(0);
		$(".Siguiente1").slideToggle(0);
		$(".Seccion2").hide(0);
		$(".Siguiente2").hide(0);
		$(".Anterior1").hide(0);
	});

	$(".Siguiente2").click(function(){
		$(".Seccion3").slideToggle(0);
		$(".Siguiente3").slideToggle(0);
		$(".Anterior2").slideToggle(0);
		$(".Seccion2").hide(0);
		$(".Siguiente2").hide(0);
		$(".Anterior1").hide(0);
	});


	$(".Anterior2").click(function(){
		$(".Seccion2").slideToggle(0);
		$(".Siguiente2").slideToggle(0);
		$(".Anterior1").slideToggle(0);
		$(".Seccion3").hide(0);
		$(".Siguiente3").hide(0);
		$(".Anterior2").hide(0);
	});

	$(".Siguiente3").click(function(){
		$(".Seccion4").slideToggle(0);
		$(".Siguiente4").slideToggle(0);
		$(".Anterior3").slideToggle(0);
		$(".Seccion3").hide(0);
		$(".Siguiente3").hide(0);
		$(".Anterior2").hide(0);
	});

	$(".Anterior3").click(function(){
		$(".Seccion3").slideToggle(0);
		$(".Siguiente3").slideToggle(0);
		$(".Anterior2").slideToggle(0);
		$(".Seccion4").hide(0);
		$(".Siguiente4").hide(0);
		$(".Anterior3").hide(0);
	});

	$(".Siguiente4").click(function(){
		$(".Seccion5").slideToggle(0);
		$(".btn-Postulacion").slideToggle(0);
		$(".Anterior4").slideToggle(0);
		$(".Seccion4").hide(0);
		$(".Siguiente4").hide(0);
		$(".Anterior3").hide(0);
	});

	$(".Anterior4").click(function(){
		$(".Seccion4").slideToggle(0);
		$(".Siguiente4").slideToggle(0);
		$(".Anterior3").slideToggle(0);
		$(".Seccion5").hide(0);
		$(".btn-Postulacion").hide(0);
		$(".Anterior4").hide(0);
	});
	
});

//Finalizacion de contenido modal

//Todas las opciones del formulario denuncias

(function(){
	var formulario = document.Formulario_Denuncias,
		elementos = formulario.elements;

	//Funciones

	var ValidarInputs = function(){
		for (var i = 0; i < elementos.length; i++) {
			if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password") {
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
		this.parentElement.children[1].className = "label-Denuncia active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Denuncia";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

	for (var i = 0; i < elementos.length; i++) {
		if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password") {
			elementos[i].addEventListener("focus", focusInputs);
			elementos[i].addEventListener("blur", blurInputs);
		}
	}

}());

//Finalizacion de denuncias

//Todas las opciones del formulario Contactenos

(function(){
	var formulario = document.Formulario_Contactenos,
		elementos = formulario.elements;

	//Funciones

	var ValidarInputs = function(){
		for (var i = 0; i < elementos.length; i++) {
			if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password") {
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
		this.parentElement.children[1].className = "label-Contactenos active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Contactenos";
			this.parentElement.children[0].className = this.parentElement.children[0].className + " error";
		}
	};

	//Eventos
	formulario.addEventListener("submit", enviar);

	for (var i = 0; i < elementos.length; i++) {
		if (elementos[i].type == "text" || elementos[i].type == "email" || elementos[i].type == "password") {
			elementos[i].addEventListener("focus", focusInputs);
			elementos[i].addEventListener("blur", blurInputs);
		}
	}

}());

//Finalizacion de contactenos