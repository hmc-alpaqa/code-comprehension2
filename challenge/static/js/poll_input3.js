var prob = "Contains_Loop";
var last_text = "";

var page_url = window.location.search;


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
const csrf6 = getCookie('csrftoken');

var time_passed = 0;
var poll_function = setInterval(function() {
    var cur_text = $("textarea#textarea").val();

    if(cur_text !== last_text) {

	$.ajax({
	    type: "POST",
	    url: "take_snapshot/",
	    data: { csrfmiddlewaretoken: csrf6, prob: prob, input_snapshot: cur_text, time: time_passed, which_box: "1" },
	    success: function(response) {
		console.log(response);
	    }
	});
	
	last_text = cur_text;
    }

    console.log(time_passed);
    time_passed += 2;
}, 2000);
