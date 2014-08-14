// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.

$(document).ready( function() {

	$("a.add-review").on("click", function(event) {


		var url = $(this).attr('href');

		$.get(url, function(data) {
			var form = $(data).filter('form#new_review');

			$('body').append(form);
		});

	  event.preventDefault();
	  $(this).remove();
	});

	// $('form#new_review input').on("click", function () {

	// });
});
