//Todas las opciones del contenido modal

let modal = document.getElementById('Modal');
let flex = document.getElementById('flex');
let Cerrar = document.getElementById('close');
$(document).ready(function(){

	var Post = $(".Left-Postulacion");
	Post.hide();
	var Docu;
    $(".InfoMascota").click(function(){ 
    	Pos = $(".InfoMascota").index(this);
    	modal.style.display = 'block';
    	var asi = Post.eq(Pos);
    	var Doc = $(".DocumentM").eq(Pos);
    	Docu = $(Doc).val();
    	asi.show();
    	$("div#Doc").html(Docu);

    });
    
    Cerrar.addEventListener('click',function(){
		modal.style.display = 'none';
		Post.hide();
	});

    window.addEventListener('click',function(e){
		if (e.target == flex) {
			modal.style.display = 'none';
			Post.hide();
		}
	});

    $(".InfoMascota").click(function(){
    	Pos = $(".InfoMascota").index(this);
    	var Dato = document.getElementById('Doc').innerHTML;
    	$("#Docu").val(Dato);
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
	$(".Anterior3").hide();
	$(".btn-Postulacion").hide();

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
                $(".btn-Postulacion").slideToggle(0);
		$(".Seccion3").hide(0);
		$(".Siguiente3").hide(0);
		$(".Anterior2").hide(0);
	});

	$(".Anterior3").click(function(){
		$(".Seccion3").slideToggle(0);
		$(".Siguiente3").slideToggle(0);
		$(".Anterior2").slideToggle(0);
		$(".Seccion4").hide(0);
                $(".btn-Postulacion").hide(0);
		$(".Siguiente4").hide(0);
		$(".Anterior3").hide(0);
	});
});

//Finalizacion de contenido modal

// Todas la opnciones del formulario de Encuesta

(function(){
	var formulario = document.Formulario_Encuesta,
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


	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res1'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res1") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res2'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res2") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res3'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res3") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res4'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res4") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res5'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res5") {
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

	var ValidarRadio = function(){
	
		var opciones = document.getElementsByName('Res6'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res6") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res7'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res7") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res8'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res8") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res9'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res9") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res10'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res10") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res11'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res11") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res12'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res12") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res13'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res13") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res14'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res14") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res15'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res15") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res16'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res16") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res17'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res17") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res18'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res18") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res19'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res19") {
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

	var ValidarRadio = function(){
		var opciones = document.getElementsByName('Res20'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Res20") {
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

//Finalizacion de formulario Encuesta
