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
    $(".Datos1 input").attr("readonly","readonly");
    $(".Datos2 input").attr("readonly","readonly");
    $(".input11").hide();
    $(".input12").hide();
    $(".Nombre_Activas").click(function (){
        var Index = $(".Nombre_Activas").index(this);
        var btn_Editar = $(".btn-Editar").eq(Index);
        
        btn_Editar.click(function(){
            var Datos1 = $(".input1").eq(Index);
            var Datos2 = $(".input2").eq(Index);
            var Datos3 = $(".input3").eq(Index);
            var Datos4 = $(".input4").eq(Index);
            var Datos5 = $(".input5").eq(Index);
            
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
            
        $(".btn-Actualizar").eq(Index).show();
        $(".btn-Cancelar").eq(Index).show();
        $(".fa-camera").eq(Index).show();
        $(".btn-Editar").eq(Index).hide();
        $(".btn-Eliminar").eq(Index).hide();
        });
    });
    $(".Nombre_Activas").click(function (){
        var Index = $(".Nombre_Activas").index(this);
        var btn_Cancelar = $(".btn-Cancelar").eq(Index);
        
        btn_Cancelar.click(function(){
            var Datos1 = $(".input1").eq(Index);
            var Datos2 = $(".input2").eq(Index);
            var Datos3 = $(".input3").eq(Index);
            var Datos4 = $(".input4").eq(Index);
            var Datos5 = $(".input5").eq(Index);
            
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
            
            $(".btn-Cancelar").eq(Index).hide();
            $(".btn-Actualizar").eq(Index).hide();
            $(".fa-camera").eq(Index).hide();
            $(".btn-Editar").eq(Index).show();
            $(".btn-Eliminar").eq(Index).show();
        });
    });
    
    
    $(".Nombre_Inactivas").click(function (){
        var Index = $(".Nombre_Inactivas").index(this);
        var Datos = $(".Datos_Inactivas").eq(Index);
        Datos.slideToggle();
    });
    
    $(".Nombre_Inactivas").click(function (){
        var Index = $(".Nombre_Inactivas").index(this);
        var btn_Editar = $(".btn-Editar2").eq(Index);
        
        btn_Editar.click(function(){
            
            var Datos1 = $(".input6").eq(Index);
            var Datos2 = $(".input7").eq(Index);
            var Datos3 = $(".input8").eq(Index);
            var Datos4 = $(".input9").eq(Index);
            var Datos5 = $(".input10").eq(Index);
            var Datos6 = $(".input11").eq(Index);
            var Datos7 = $(".input12").eq(Index);
            
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
            Datos6.show();
            Datos7.show();
            
        $(".btn-Actualizar2").eq(Index).show();
        $(".btn-Cancelar2").eq(Index).show();
        $(".fa-camera-retro").eq(Index).show();
        $(".btn-Editar2").eq(Index).hide();
        $(".btn-Eliminar2").eq(Index).hide();
        });
    });
    
    $(".Nombre_Inactivas").click(function (){
        var Index = $(".Nombre_Inactivas").index(this);
        var btn_Cancelar = $(".btn-Cancelar2").eq(Index);
        
        btn_Cancelar.click(function(){
            var Datos1 = $(".input6").eq(Index);
            var Datos2 = $(".input7").eq(Index);
            var Datos3 = $(".input8").eq(Index);
            var Datos4 = $(".input9").eq(Index);
            var Datos5 = $(".input10").eq(Index);
            var Datos6 = $(".input11").eq(Index);
            var Datos7 = $(".input12").eq(Index);
            
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
            Datos6.hide();
            Datos7.hide();
            
            $(".btn-Cancelar2").eq(Index).hide();
            $(".btn-Actualizar2").eq(Index).hide();
            $(".fa-camera-retro").eq(Index).hide();
            $(".btn-Editar2").eq(Index).show();
            $(".btn-Eliminar2").eq(Index).show();
        });
    });
    
    $(".btn-Actualizar").hide();
    $(".btn-Cancelar").hide();
    $(".fa-camera").hide();
    $(".btn-Actualizar2").hide();
    $(".btn-Cancelar2").hide();
    $(".fa-camera-retro").hide();
    
 
    
    
});