$(document).ready(function(){
    $(".Datos_Administrador").hide();
    
    $(".Nombre").click(function (){
        var Index = $(".Nombre").index(this);
        var Datos = $(".Datos_Administrador").eq(Index);
        var Nombre = $(".Nombre").eq(Index);
        Datos.slideToggle();
        Nombre.show();
    });
    
 
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
            Datos2.css("border-bottom","1px solid black");
            Datos3.css("border-bottom","1px solid black");
            Datos4.css("border-bottom","1px solid black");
            Datos5.css("border-bottom","1px solid black");
            Datos6.css("border-bottom","1px solid black");
            
        $(".btn-Actualizar").eq(Index).show();
        $(".btn-Cancelar").eq(Index).show();
        $(".fa-camera").eq(Index).show();
        $(".btn-Editar").eq(Index).hide();
        $(".btn-Eliminar").eq(Index).hide();
        });
        
    });
    
       $(".btn-Actualizar").hide();
    $(".btn-Cancelar").hide();
    $(".fa-camera").hide();
    
    $(".btn-Actualizar").click(function (){
        $(".Datos2 input").css("border-bottom","transparent");
        $(".Datos1 input").css("border-bottom","transparent");
        $(".btn-Cancelar").show();
    });
    $(".btn-Cancelar").click(function (){
        $(".Datos2 input").css("border-bottom","transparent");
        $(".Datos1 input").css("border-bottom","transparent");
        $(".btn-Cancelar").hide();
        $(".btn-Actualizar").hide();
        $(".fa-camera").hide();
        $(".btn-Editar").show();
        $(".btn-Eliminar").show();
    });
});