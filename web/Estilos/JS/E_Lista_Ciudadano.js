$(document).ready(function(){
    $(".Datos_Ciudadano").hide();
    
    $(".Nombre").click(function (){
        var Index = $(".Nombre").index(this);
        var Datos = $(".Datos_Ciudadano").eq(Index);
        var Nombre = $(".Nombre").eq(Index);
        Datos.slideToggle();
        
        
        $(".Nombre").slideToggle();
        Nombre.show();
    });
    
});