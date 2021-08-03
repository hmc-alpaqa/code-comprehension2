import sys


def format_code(filename: str) -> str:
    start_code = "//start code"
    end_code = "//end code"
    reading_code = False

    formatted = ""
    
    with open(filename, "r") as f:
    
        for line in f:

            #Check that code is between comment tags
            if reading_code:
                if end_code in line:
                    reading_code = False
            else:
                if start_code in line:
                    reading_code = True
                
            if not reading_code or start_code in line:
                continue
        

            preceding_spaces = 0
            space_types = [' ', '\t']
            for character in line:
                if character in space_types:

                    formatted = f"{formatted}&nbsp&nbsp"
                    if character == '\t':
                        formatted = f"{formatted}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"

                    preceding_spaces += 1

                else:
                    break
                    

            formatted = f"{formatted}{line[preceding_spaces:-1:]}<br>"

    return formatted
