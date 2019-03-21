$(document).ready(function(){
    $(".Respuesta_Visita").hide();
    
    $(".Datos_Visita").click(function (){
        var Index = $(".Datos_Visita").index(this);
        var Datos = $(".Respuesta_Visita").eq(Index);
        Datos.slideToggle();
    });

    
    
});