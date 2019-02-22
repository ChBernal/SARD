$(document).ready(function(){
    
    $(".Scroll_Activas").hide();
    $(".Scroll_Inactivas").hide();
    
    $(".Activas").click(function (){
        $(".Scroll_Activas").show();
        $(".Datos_Activas").hide();
        $(".Scroll_Inactivas").hide();
    });
    $(".Inactivas").click(function (){
        $(".Scroll_Inactivas").show();
        $(".Datos_Inactivas").hide();
        $(".Scroll_Activas").hide();
    });
    $(".Nombre_Activas").click(function (){
        var Index = $(".Nombre_Activas").index(this);
        var Datos = $(".Datos_Activas").eq(Index);
        Datos.slideToggle();
    });
    $(".Nombre_Inactivas").click(function (){
        var Index = $(".Nombre_Inactivas").index(this);
        var Datos = $(".Datos_Inactivas").eq(Index);
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