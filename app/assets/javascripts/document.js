$( document ).ready(function() {
    $('#app-area').on('click', '.email-information', function (event) {
    	event.preventDefault();
    	var url = $(this).data().link
    	viewEmail(url)
    	
    })
});

function fetchEmail(url) {
	var requestEmailPromise = $.ajax({url:url, method:"GET"});
	return requestEmailPromise
}

function viewEmail(url) {
	var emailAjaxPromise = fetchEmail(url);


	emailAjaxPromise.done(function(emailData) {
		showEmail(emailData)
	})
	
}

function showEmail(emailData) {
	$('#email-area').replaceWith(emailData)
}