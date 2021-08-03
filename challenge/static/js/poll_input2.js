var prob = "Contains_Substring";
var last_text1 = "";
var last_text2 = ""

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
const csrf5 = getCookie('csrftoken');

var time_passed = 0;
var poll_function = setInterval(function() {
    var cur_text1 = $("textarea#textarea1").val();

    if(cur_text1 !== last_text1) {

	$.ajax({
	    type: "POST",
	    url: "take_snapshot/",
	    data: { csrfmiddlewaretoken: csrf5, prob: prob, input_snapshot: cur_text1, time: time_passed, which_box: "1" },
	    success: function(response) {
		console.log(response);
	    }
	});
	
	last_text1 = cur_text1;
    }

    var cur_text2 = $("textarea#textarea2").val();

    if(cur_text2 !== last_text2) {

	$.ajax({
	    type: "POST",
	    url: "take_snapshot/",
	    data: { csrfmiddlewaretoken: csrf5, prob: prob, input_snapshot: cur_text2, time: time_passed, which_box: "2"},
	    success: function(response) {
		console.log(response);
	    }
	});
	
	last_text2 = cur_text2;
    } 

    console.log(time_passed);
    time_passed += 2;
}, 2000);
