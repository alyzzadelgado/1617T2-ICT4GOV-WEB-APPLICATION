$(function() {

	$('#nav > li').on('click', function(e) {
		e.preventDefault();
		var	target = $(this);
		if(!(target.hasClass('active'))) {
			$('.tab-' + $('.active').index()).hide();
			$('.active').removeClass('active');

			target.addClass('active');
			$('.tab-' + target.index()).show();
		}
 	});

 	$('#app-datepicker').datetimepicker({
 		format: "YYYY-MM-DD",
 		minDate: moment().add(14, 'd')
 	});

 	$('#app-timepicker').datetimepicker({
 		format: "HH:mm:ss",
 	});

 	$('#venue-form').validate();

});

