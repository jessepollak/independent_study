$(document).ready(function() {
	var response = $('.response-form');
	$('#request-show .btn-success').on('click', function() {
		console.log("test");
		response.slideDown('slow');
	});
});