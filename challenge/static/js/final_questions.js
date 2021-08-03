
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
const csrf4 = getCookie('csrftoken');

function final_questions(username, answer1, answer2) {
    $.ajax({
	type: "POST",
	url: "submit_challenge/",
	data: {csrfmiddlewaretoken: csrf4, username: username, answer1: answer1, answer2: answer2 },
	success: function(response) {
	}
    });
}
