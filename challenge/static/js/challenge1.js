
function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
const csrf10 = getCookie('csrftoken');

function submit_challenge(username, factor, time, responses) {
    $.ajax({
	type: "POST",
	url: "submit_challenge1/",
	data: { csrfmiddlewaretoken: csrf10, username: username, factor: factor, time: time, responses: responses },
	success: function(response) {

	}
    });
}

