$(document).ready(function(){
	$(window).scroll(function(){
		var Barra = $(window).scrollTop();
		var posicion = Barra * 0.30;

		$('body').css({
			'background-position': '0 -' + posicion +'px'
		});
	});
});