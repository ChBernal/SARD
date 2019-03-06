//Todas las opciones del menu

$(function(){
	var header = document.getElementById('header');
	var headroom = new Headroom(header);
	headroom.init();

	var ancho = $(window).width(),
		enlaces = $('.Enlaces'),
		btnMenu = $('.btn-menu'),
		icono = $('.btn-menu .icono');
		perfil = $('.Perfil');
		Espacio = $('.Espacio-Perfil');

		Espacio.hide();

	if (ancho < 990) {
		enlaces.hide();
		icono.addClass('fa-bars');
		
	}

	btnMenu.on('click', function(e){
		enlaces.slideToggle();
		icono.toggleClass('fa-bars');
		icono.toggleClass('fa-times');
	});

	perfil.on('click',function(e){
		Espacio.slideToggle();
	});

	$(window).on('resize', function(){
		if($(this).width() > 990){
			enlaces.show();
			icono.addClass('fa-times');
			icono.removeClass('fa-bars');
		}else {
			enlaces.hide();
			icono.addClass('fa-bars');
			icono.removeClass('fa-times');
		}
	});

});

//Finalizacion de menu

//Inicio de Opciones Perfil

$(function(){
	var Opci = document.getElementById('PerfilUsuario');
	var headroom = new Headroom(Opci);
	headroom.init();
});

//Fin de opciones Pefil

//Acordeon de Notificaciones

$(function(){
	$(".NombreDN").hide();
	$(".DatosDenunciaA").hide();
	$(".DatosDenunciaC").hide();
	$(".DatosPostulados").hide();
	$(".NombreDC").hide();
	$(".Postulados").hide();

	$(".PostulacionesCiudadano").click(function(){
		$(".Postulados").slideToggle();
		$(".NombreDN").hide();
		$(".NombreDC").hide();
		$(".DatosDenunciaA").hide();
		$(".DatosDenunciaC").hide();
		$(".DatosPostulados").hide();
	});

	$(".DenunciasNN").click(function(){
		$(".NombreDN").slideToggle();
		$(".Postulados").hide();
		$(".NombreDC").hide();
		$(".DatosDenunciaA").hide();
		$(".DatosDenunciaC").hide();
		$(".DatosPostulados").hide();
	});

	$(".DenunciasCiudadano").click(function(){
		$(".NombreDC").slideToggle();
		$(".Postulados").hide();
		$(".NombreDN").hide();
		$(".DatosDenunciaA").hide();
		$(".DatosDenunciaC").hide();
		$(".DatosPostulados").hide();
	});

	$(".NombreDN").click(function(){
		var Pos = $(".NombreDN").index(this);
		var asig = $(".DatosDenunciaA").eq(Pos);
		asig.slideToggle();
		$(".DatosDenunciaC").hide();
		$(".DatosPostulados").hide();
	})

});

//Finaliza Acordeon


