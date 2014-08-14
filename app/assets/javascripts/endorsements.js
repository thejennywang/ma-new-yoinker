$(document).ready(function() {
	$('.endorsement-link ').on('click', function(event) {
		var endorsementCount = $(this).find('.endorsement_count')
		event.preventDefault();
		
		$.post(this.href, function(response) {
			endorsementCount.text(response.new_endorsement_count);
		});
	})
})