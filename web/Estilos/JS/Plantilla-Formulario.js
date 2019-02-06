(function(){
	var formulario = document.Formulario_Ciudadano,
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

		if (elementos.Clave.value !== elementos.Clave2.value){
			elementos.Clave = "";
			elementos.Clave2 = "";
			elementos.Clave.className = elementos.Clave.className + " error"; 
			elementos.Clave2.className = elementos.Clave2.className + " error"; 
		}else {
			elementos.Clave.className = elementos.Clave.className.replace (" error", ""); 
			elementos.Clave2.className = elementos.Clave2.className.replace (" error", "");
		}

		return true;
	};

	var ValidarRadio = function(){
		var opciones = document.getElementsByName("");
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "") {
				for (var j = 0; i < opciones.length; i++) {
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

	var ValidarCheckbox = function(){
		var opciones = document.getElementsByName("Recuerdame");
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "checbox") {
				for (var j = 0; i < opciones.length; i++) {
					if (opciones[j].checked){
						resultado = true;
						break;
					}
				}

				if (resultado == false){
					elementos[i].parentNode.className = elementos[i].parentNode.className + " error";
					console.log('El campo Checkbox esta incompleto');
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
			//e.preventDefault();
		}else if (!ValidarRadio()) {
			console.log('Falto validar los Radio');
			//e.preventDefault();
		}else if (!ValidarCheckbox()) {
			console.log('Falto validar los Checkbox');
			//e.preventDefault();
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