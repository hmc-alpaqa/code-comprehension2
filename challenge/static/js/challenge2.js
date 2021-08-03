
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
const csrf2 = getCookie('csrftoken');

function submit_challenge(username, factor, time, responses1, responses2) {
    $.ajax({
	type: "POST",
	url: "submit_challenge2/",
	data: { csrfmiddlewaretoken: csrf2, username: username, factor: factor, time: time, responses1: responses1, responses2: responses2 },
	success: function(response) {
	}
    });
}

