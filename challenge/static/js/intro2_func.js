var default_text = "";

window.onload = function() {
    default_text = document.getElementById('textarea').textContent;
}

function func_one(input) {
    let string_result = "1 ";

    if(input.length < 1) {
	string_result += "2 ";
	return string_result;
    }

    if(input.charAt(0) === "c") {
	string_result += "3 ";

    } else {
	string_result += "4 ";
    }
    return string_result;
}
    
function clickEvaluateButton() {
    var values = document.getElementById('textarea').value;
    var lines = values.split("\n");
    
    var output = "";
    for(let i = 0; i < lines.length; i++) {
	let line = lines[i].trim();

	if(line.length == 0) {
	    if(i + 1 != lines.length) {
		output += "Line " + i.toString() + " was empty\n";
	    }
	    
	} else {
	    if(line.charAt(0) == "\"" && line.charAt(line.length-1) == "\"") {
		let stripped_line = line.substring(1, line.length-1);
		output += line + " produced output: " + func_one(stripped_line) + "\n";
		
	    } else {
		output += line + " is not surrounded by quotation marks (\")\n";
	    }
	}
    }
    
    document.getElementById('outputs').value = output;
}
    
function clickResetButton() {
    document.getElementById('textarea').value = default_text;
}
