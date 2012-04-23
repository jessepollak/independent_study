$(document).ready(function() {
	var response = $('.response-form');
	if ($('.response-form .alert-error').length != 0) response.slideDown('fast');
	$('#request-show .btn-success').on('click', function() {
		console.log("test");
		response.slideDown('slow');
	});
	$('.close').on('click', function() {
	response.slideUp('slow');
	});
	$('#loan').tooltip('show');
});
	