$(document).ready(function(){
    $(".Datos_Ciudadano").hide();
    
    $(".Nombre").click(function (){
        var Index = $(".Nombre").index(this);
        var Datos = $(".Datos_Ciudadano").eq(Index);
        var Nombre = $(".Nombre").eq(Index);
        Datos.slideToggle();
        Nombre.show();
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
        $(".btn-Editar").show();
        $(".btn-Eliminar").show();
    });
});