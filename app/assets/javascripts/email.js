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