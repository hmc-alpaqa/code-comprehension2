from format_code import format_code
import sys

c_file = sys.argv[1]
c_code = format_code(c_file)

insert_tag = "insert code here"
html_file = sys.argv[2]
with open(html_file, "r") as f:
    html_code = f.read()
    html_code = html_code.replace(insert_tag, c_code)

print(html_code)
