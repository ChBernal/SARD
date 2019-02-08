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

}());

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

//Finalizacion de menu

//Todas las opciones del contenido modal

$(document).ready(function(){
    $(".InfoMascota").click(function(){
        alertify.alert ("Recuerda que para realizar adopciones debes estar registrado y haber iniciado secion");
        var Pos = $(".Imagen_Mascota").index(this);
        var Asi = $(".Datos-Mascota").eq(Pos);
        modal.style.display = 'block'; 
    });
});

let modal = document.getElementById('Modal');
let flex = document.getElementById('flex');
let Abrir = document.getElementById('Abrir');
let Cerrar = document.getElementById('close');

Abrir.addEventListener('click',function(){
	modal.style.display = 'block';
});

Cerrar.addEventListener('click',function(){
	modal.style.display = 'none';
});

window.addEventListener('click',function(e){
	if (e.target == flex) {
		modal.style.display = 'none';
	}
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

//Eventos

//Finaliza Eventos

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