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
            $(".Datos .Mo").css({'border-bottom':'1px solid rgb(39,174,96)'});
    });
    $(".btn-Cambiar").click( function (){
            $(".btn-Actualizar").hide();
            $(".btn-Cambiar").hide();
            $(".fa-camera").hide();
            $(".btn-Editar").show();
            $(".Datos .Mo").css({'border-bottom':''});
    });
    
    //ACTUALIZAR DATOS CIUDADANO
    /*
    $(".btn-Actualizar").click(function (){
        var Index = $(".btn-Actualizar").index(this);
        
        var Docu = $("#Documento").eq(Index);
        var Nom = $("#Nombre").eq(Index);
        var Dir = $("#Direccion").eq(Index);
        var Bar = $("#Barrio").eq(Index);
        var Tel1 = $("#Telefono1").eq(Index);
        var Tel2 = $("#Telefono2").eq(Index);
        var Corre  = $("#Correo").eq(Index);
        var Ocu = $("#Ocupacion").eq(Index);
        var Fot  = $("#Foto").eq(Index);
        
        var Documento = Docu.val();
        var Nombre = Nom.val();
        var Direccion = Dir.val();
        var Barrio = Bar.val();
        var Telefono1 = Tel1.val();
        var Telefono2 = Tel2.val();
        var Correo = Corre.val();
        var Ocupacion = Ocu.val();
        var Foto = Fot.val();
        
        var Btn = "Actualizar_Perfil";
        alert("llega a variables");
        $.ajax({
            url: "ServletUsuario",
            data: {
                Boton: Btn,
                Documento_C: Documento,
                Nombre_C: Nombre,
                Direccion_C: Direccion,
                Barrio_C: Barrio,
                Telefono1_C: Telefono1,
                Telefono2_C: Telefono2,
                Correo_C: Correo,
                Ocupacion_C: Ocupacion,
                Foto_C: Foto,
            },
            success: function( result ) {
              $( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
            }
        });
    }); */
});