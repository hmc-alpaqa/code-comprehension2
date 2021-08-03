import re
import sys

def process_plaintext(filename: str) -> dict[str, str]:
    tags_and_values = {}
    
    with open(filename, "r") as f:
        filetext = f.read()
        
        tag_pattern = r"(<.*?>)"
        match_start = re.search(tag_pattern, filetext)

        while match_start:
            tag = filetext[match_start.start(1):match_start.end(1)]
            filetext = filetext[match_start.end(1)::]
            match_end = re.search(f"({tag})", filetext)

            if match_end:
                tag_value = filetext[:match_end.start(1):]
                tags_and_values[tag] = tag_value
                filetext = filetext[match_end.end(1)::]
                match_start = re.search(tag_pattern, filetext)
                
            else:
                print(f"{tag} had no matching end tag")
                match_start = None


            
    return tags_and_values



text_file = sys.argv[1]
html_file = sys.argv[2]

tags_and_values = process_plaintext(text_file)

with open(html_file, "r") as f:
    html_text = f.read()

    for tag_and_value in tags_and_values.items():
        html_text = html_text.replace(tag_and_value[0], tag_and_value[1])

    print(html_text)
