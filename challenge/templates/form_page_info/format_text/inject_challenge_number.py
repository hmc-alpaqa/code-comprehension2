import sys

filename = sys.argv[1]
challenge_number = sys.argv[2]

pattern = "<challenge_number>"

with open(filename, "r") as f:
    filetext = f.read()
    filetext = filetext.replace(pattern, challenge_number)
    print(filetext)
