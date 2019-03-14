$(document).ready(function(){
    
    $(".Foto").click(function (){
        var Index = $(".Foto").index(this);
        
        document.getElementById("Foto").onchange = function(e){
            let Nombre = new FileReader();
            Nombre.readAsDataURL(e.target.files[0]);
            Nombre.onload = function(){
                    let Vista_Previa = document.getElementById('Vista_Previa'),
                    image = document.createElement('img');

                    image.src =Nombre.result;
                    Vista_Previa.innerHTML ='';
                    Vista_Previa.append(image);
            };
        };
    });
        
    $(".Datos_Ciudadano").hide();
    $(".Foto").val("");
   
    
    
    $(".Nombre").click(function (){
        var Index = $(".Nombre").index(this);
        var Datos = $(".Datos_Ciudadano").eq(Index);
        Datos.slideToggle();
    });
    
    $(".btn-Actualizar").hide();
    $(".btn-Cancelar").hide();
    $(".fa-camera").hide();
    
    $(".Datos1 input").attr("readonly","readonly");
    $(".Datos2 input").attr("readonly","readonly");
    
    $(".Nombre").click(function (){
        var Index = $(".Nombre").index(this);
        var btn_Editar = $(".btn-Editar").eq(Index);
        
        btn_Editar.click(function(){
            
            var Datos1 = $(".input1").eq(Index);
            var Datos2 = $(".input2").eq(Index);
            var Datos3 = $(".input3").eq(Index);
            var Datos4 = $(".input4").eq(Index);
            var Datos5 = $(".input5").eq(Index);
            var Datos6 = $(".input6").eq(Index);
            
            Datos1.css("border-bottom","1px solid black");
            Datos1.removeAttr("readonly");
            Datos2.css("border-bottom","1px solid black");
            Datos2.removeAttr("readonly");
            Datos3.css("border-bottom","1px solid black");
            Datos3.removeAttr("readonly");
            Datos4.css("border-bottom","1px solid black");
            Datos4.removeAttr("readonly");
            Datos5.css("border-bottom","1px solid black");
            Datos5.removeAttr("readonly");
            Datos6.css("border-bottom","1px solid black");
            Datos6.removeAttr("readonly");
            
        $(".btn-Actualizar").eq(Index).show();
        $(".btn-Cancelar").eq(Index).show();
        $(".fa-camera").eq(Index).show();
        $(".btn-Editar").eq(Index).hide();
        $(".btn-Eliminar").eq(Index).hide();
        });
        
    });

       
    
    $(".Nombre").click(function (){
        var Index = $(".Nombre").index(this);
        var btn_Cancelar = $(".btn-Cancelar").eq(Index);
        
        btn_Cancelar.click(function(){
            
            var Datos1 = $(".input1").eq(Index);
            var Datos2 = $(".input2").eq(Index);
            var Datos3 = $(".input3").eq(Index);
            var Datos4 = $(".input4").eq(Index);
            var Datos5 = $(".input5").eq(Index);
            var Datos6 = $(".input6").eq(Index);
            
            Datos1.css("border-bottom","transparent");
            Datos1.attr("readonly","readonly");
            Datos2.css("border-bottom","transparent");
            Datos2.attr("readonly","readonly");
            Datos3.css("border-bottom","transparent");
            Datos3.attr("readonly","readonly");
            Datos4.css("border-bottom","transparent");
            Datos4.attr("readonly","readonly");
            Datos5.css("border-bottom","transparent");
            Datos5.attr("readonly","readonly");
            Datos6.css("border-bottom","transparent");
            Datos6.attr("readonly","readonly");
            
            $(".btn-Cancelar").eq(Index).hide();
            $(".btn-Actualizar").eq(Index).hide();
            $(".fa-camera").eq(Index).hide();
            $(".btn-Editar").eq(Index).show();
            $(".btn-Eliminar").eq(Index).show();
        });
        
    });
   
});