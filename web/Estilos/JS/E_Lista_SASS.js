$(document).ready(function(){
    
    $(".Scroll_Ambiente").hide();
    $(".Scroll_Salud").hide();
    
    $(".Ambiente").click(function (){
        $(".Scroll_Ambiente").show();
        $(".Datos_Ambiente").hide();
        $(".Scroll_Salud").hide();
    });
    $(".Salud").click(function (){
        $(".Scroll_Salud").show();
        $(".Datos_Salud").hide();
        $(".Scroll_Ambiente").hide();
    });
    $(".Nombre_Ambiente").click(function (){
        var Index = $(".Nombre_Ambiente").index(this);
        var Datos = $(".Datos_Ambiente").eq(Index);
        Datos.slideToggle();
    });
    
     $(".Nombre_Ambiente").click(function (){
        var Index = $(".Nombre_Ambiente").index(this);
        var btn_Editar = $(".btn-Editar").eq(Index);
        
        btn_Editar.click(function(){
            var Datos1 = $(".input1").eq(Index);
            var Datos2 = $(".input2").eq(Index);
            var Datos3 = $(".input3").eq(Index);;
            
            Datos1.css("border-bottom","1px solid black");
            Datos2.css("border-bottom","1px solid black");
            Datos3.css("border-bottom","1px solid black");
            
        $(".btn-Actualizar").eq(Index).show();
        $(".btn-Cancelar").eq(Index).show();
        $(".fa-camera").eq(Index).show();
        $(".btn-Editar").eq(Index).hide();
        $(".btn-Eliminar").eq(Index).hide();
        });
    });
    
    
    $(".Nombre_Salud").click(function (){
        var Index = $(".Nombre_Salud").index(this);
        var Datos = $(".Datos_Salud").eq(Index);
        Datos.slideToggle();
    });
    
    $(".Nombre_Salud").click(function (){
        var Index = $(".Nombre_Salud").index(this);
        var btn_Editar = $("#btn-Editar").eq(Index);
        
        btn_Editar.click(function(){
            
            var Datos1 = $(".input4").eq(Index);
            var Datos2 = $(".input5").eq(Index);
            var Datos3 = $(".input6").eq(Index);
            
            Datos1.css("border-bottom","1px solid black");
            Datos2.css("border-bottom","1px solid black");
            Datos3.css("border-bottom","1px solid black");
            
        $("#btn-Actualizar").eq(Index).show();
        $("#btn-Cancelar").eq(Index).show();
        $("#fa-camera").eq(Index).show();
        $("#btn-Editar").eq(Index).hide();
        $("#btn-Eliminar").eq(Index).hide();
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