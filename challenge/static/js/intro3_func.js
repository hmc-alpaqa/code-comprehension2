var default_text1 = "";
var default_text2 = "";

window.onload = function() {
    default_text1 = document.getElementById('textarea1').textContent;
    default_text2 = document.getElementById('textarea2').textContent;
}

function func_one(input1, input2) {
    let string_result = "";

    if(input1.length < 3 || input2.length < 3) {
	string_result += "1 ";
	return string_result;
    }

    if(input1[2] == input2[2]) {
	string_result += "2 ";

    } else {
	string_result += "3 ";
    }
    
    return string_result;
}
    
function clickEvaluateButton() {
    var values1 = document.getElementById('textarea1').value;
    var values2 = document.getElementById('textarea2').value;
    var lines1 = values1.split("\n");
    var lines2 = values2.split("\n");
    var end1 = lines1.length;
    var end2 = lines2.length;

    while(end1 > 0 && lines1[end1-1].trim().length == 0) {
	end1--;
    }
    while(end2 > 0 && lines2[end2-1].trim().length == 0) {
	end2--;
    }
    
    var output = "";
    if(end1 != end2) {
	output = "The two text areas should have the same number of input lines. " +
	    "Text area 1 has " + end1.toString() + " lines and text area 2 has " +
	    end2.toString() + " lines.\n";
    } else {
	
	for(let i = 0; i < end1; i++) {
	    let line1 = lines1[i].trim();
	    let line2 = lines2[i].trim();
	    if(line1.charAt(0) != "[" || line1.charAt(line1.length-1) != "]") {
		output += line1 + " should be surrounded by square brackets ([])\n";
	    } else if(line2.charAt(0) != "[" || line2.charAt(line2.length-1) != "]") {
		output += line2 + " should be surrounded by square brackets ([])\n";
	    } else {

		line1 = line1.substring(1, line1.length-1);
		line2 = line2.substring(1, line2.length-1);
		
		let invalid_textarea = -1;
		let int_arr1 = [];

		if(line1.trim().length != 0) {
		    let str_arr1 = line1.split(",");
		    for(let i = 0; i < str_arr1.length && invalid_textarea == -1; i++) {
			let int_at_i = parseInt(str_arr1[i]);
			if(isNaN(int_at_i)) {
			    invalid_textarea = 1;
			} else {
			    int_arr1[i] = int_at_i;
			}
		    }
		}

		let int_arr2 = [];

		if(line2.trim().length != 0) {
		    let str_arr2 = line2.split(",");
		    for(let i = 0; i < str_arr2.length && invalid_textarea == -1; i++) {
			let int_at_i = parseInt(str_arr2[i]);
			if(isNaN(int_at_i)) {
			    invalid_textarea = 2;
			} else {
			    int_arr2[i] = int_at_i;
			}
		    }
		}
		
		if(invalid_textarea != -1) {
		    let invalid_input = invalid_textarea == 1 ? "input_one": "input_two";
		    output += "The textarea for " + invalid_input + " had a non-integer value. " +
			"(Make sure there is a number between each pair of commas, and that the " +
			"first number is not preceded by a comma and the last number is not " +
			"followed by a comma.\n";
		} else {
		    output += lines1[i] + " and " + lines2[i] +
			" had output: " + func_one(int_arr1, int_arr2) + "\n";
		}
	    }
	}
    }
    
    document.getElementById('outputs').value = output;
}
    
function clickResetButton() {
    document.getElementById('textarea1').value = default_text1;
    document.getElementById('textarea2').value = default_text2;
}
