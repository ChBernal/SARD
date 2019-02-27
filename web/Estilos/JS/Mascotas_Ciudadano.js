$(document).ready(function(){
    $(".Modal").hide();
    $(".Contenido-Adopcion").hide();
    
    $(".Mascotas").click(function(){
        var x = $(".Mascotas").index(this);
        var modal= $(".Modal").eq(x);
        modal.show();
    });
    $(".fa-close").click(function(){
        $(".Modal").hide();
    });
    
    $(".btn").click(function(){
        $(".Contenido-Adopcion").fadeIn(1000);
        $(".Contenido-Mascotas").hide();
    });
    $(".fa-close").click(function(){
        $(".Contenido-Mascotas").fadeIn(1000);
        $(".Contenido-Adopcion").hide();
    });
    document.getElementById("Foto").onchange = function(e){
        let Nombre = new FileReader();
        Nombre.readAsDataURL(e.target.files[0]);
        Nombre.onload = function(){
                let Vista_Previa = document.getElementById('Vista_Previa'),
                image = document.createElement('img');

                image.src =Nombre.result;
                Vista_Previa.innerHTML ='';
                Vista_Previa.append(image);
                $("#Vista_Previa img").css("width","130px");
        };
    };
});


//Todo formulario Mascota

(function(){
	var formulario = document.Formulario_Adopcion,
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
		var opciones = document.getElementsByName('Genero-Adopcion'),
		resultado = false;

		for (var i = 0; i < elementos.length; i++){
			if (elementos[i].type == "radio" && elementos[i].name == "Genero-Adopcion") {
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
		this.parentElement.children[1].className = "label-Adopcion active";
		this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "");
	};

	var blurInputs = function(){
		if (this.value <= 0) {
			this.parentElement.children[1].className = "label-Adopcion";
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