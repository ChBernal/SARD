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