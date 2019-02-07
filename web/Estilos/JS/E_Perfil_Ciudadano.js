$(document).ready(function (){
    document.getElementById("Foto").onchange = function(e){
        let Nombre = new FileReader();
        Nombre.readAsDataURL(e.target.files[0]);
        Nombre.onload = function(){
                let Vista_Previa = document.getElementById('Vista_Previa'),
                image = document.createElement('img');

                image.src =Nombre.result;
                Vista_Previa.innerHTML ='';
                Vista_Previa.append(image);
                $("#Vista_Previa img").css("width","150px");
        };
    };
    $(".btn-Actualizar").hide();
    $(".btn-Cambiar").hide();
    $(".fa-camera").hide();
    $(".btn-Editar").click(function(){
            $(".btn-Editar").hide();
            $(".btn-Actualizar").show();
            $(".btn-Cambiar").show();
            $(".fa-camera").show();
            $(".Datos .Mo").css("background","rgba( 39, 174, 96, 0.2)");
    });
});