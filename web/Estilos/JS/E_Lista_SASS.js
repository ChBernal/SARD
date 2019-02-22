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
    $(".Nombre_Salud").click(function (){
        var Index = $(".Nombre_Salud").index(this);
        var Datos = $(".Datos_Salud").eq(Index);
        Datos.slideToggle();
    });
    
    $(".btn-Actualizar").hide();
    $(".btn-Cancelar").hide();
    $(".fa-camera").hide();
    
    $(".btn-Editar").click(function (){
        $(".Datos2 input").css("border-bottom","1px solid black");
        $(".Datos1 input").css("border-bottom","1px solid black");
        $(".btn-Actualizar").show();
        $(".btn-Cancelar").show();
        $(".fa-camera").show();
        $(".btn-Editar").hide();
        $(".btn-Eliminar").hide();
    });
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