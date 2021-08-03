var default_text = "";

window.onload = function() {
    default_text = document.getElementById('textarea').textContent;
}

function func_one(input) {
    var string_result = "1 ";
    
    if(input > 5) {
	string_result += "2 ";
    } else {
	string_result += "3 ";
    }

    return string_result;
}
    
function clickEvaluateButton() {
    var values = document.getElementById('textarea').value;
    var lines = values.split("\n");
    
    var output = "";
    for(let i = 0; i < lines.length; i++) {
	let line = lines[i].trim();
	let int_val = parseInt(lines[i]);

	if(line.length == 0) {
	    if(i + 1 != lines.length) {
		output += "Line " + i.toString() + " was empty\n";
	    }
	    
	} else if(isNaN(int_val)) {
	    output += line + " on line " + i.toString() + " is not an integer\n";
	} else {
	    let output_line = func_one(int_val);
	    output += line + " produced output: " + output_line + "\n";
	}
    }
    
    document.getElementById('outputs').value = output;
}
    
function clickResetButton() {
    document.getElementById('textarea').value = default_text;
}
