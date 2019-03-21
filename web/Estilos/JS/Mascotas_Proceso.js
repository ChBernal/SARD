$(document).ready(function(){
    $(".Container-Oculto").hide();
    $(".Mascotas").click(function(){
        var x = $(".Mascotas").index(this);
        var modal= $(".Container-Oculto").eq(x);
        modal.show();
    });
    $(".btn-M").click(function(){
        $(".Container-Oculto").hide();
    });
});