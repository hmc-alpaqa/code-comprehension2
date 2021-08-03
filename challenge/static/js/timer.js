var seconds = 0;
var minutes = 0;

window.onload = function() {
    var start_string = document.getElementById('timer').textContent;
    var clock_sections = start_string.split(":");

    var seconds = parseInt(clock_sections[1]);
    var minutes = parseInt(clock_sections[0]);
    
    var interval = setInterval(function() {
	seconds--;
	if (seconds == -1) {
            minutes--;
            seconds = 59;
	}
	
	var seperator = ":";
	if(seconds < 10) {
            seperator = ":0";
	}
	
	$('.timer').text(minutes + seperator + seconds);
	if (minutes === 0 && seconds == 0) {
            clearInterval(interval);
	}
    }, 1000);
}
