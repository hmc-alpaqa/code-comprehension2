#!/bin/zsh

python format_text/inject_code.py code_samples/current_samples/intro/intro1.c frames/intro1_frame.html > temp.txt

python format_text/inject_text.py text_samples/intro1.txt temp.txt > ../intro1.html





python format_text/inject_code.py code_samples/current_samples/intro/intro2.c frames/intro2_frame.html > temp.txt

python format_text/inject_text.py text_samples/intro2.txt temp.txt > ../intro2.html





python format_text/inject_code.py code_samples/current_samples/intro/intro3.c frames/intro3_frame.html > temp.txt

python format_text/inject_text.py text_samples/intro3.txt temp.txt > ../intro3.html





python format_text/inject_text.py text_samples/intro4.txt frames/intro4_frame.html > ../intro4.html





python format_text/inject_text.py text_samples/rest_page.txt frames/rest_page_frame.html > ../rest_page.html





python format_text/inject_text.py text_samples/h_index.txt frames/h_index_frame.html > temp.txt

python format_text/inject_challenge_number.py temp.txt 1 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/h_index/factor1.c temp2.txt > ../h_index1.html

python format_text/inject_challenge_number.py temp.txt 2 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/h_index/factor2.c temp2.txt > ../h_index2.html



python format_text/inject_text.py text_samples/contains_substring.txt frames/contains_substring_frame.html > temp.txt

python format_text/inject_challenge_number.py temp.txt 1 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/contains_substring/factor1.c temp2.txt > ../contains_substring1.html

python format_text/inject_challenge_number.py temp.txt 2 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/contains_substring/factor2.c temp2.txt > ../contains_substring2.html

python format_text/inject_challenge_number.py temp.txt 3 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/contains_substring/factor3.c temp2.txt > ../contains_substring3.html

python format_text/inject_challenge_number.py temp.txt 4 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/contains_substring/factor4.c temp2.txt > ../contains_substring4.html



python format_text/inject_text.py text_samples/contains_loop.txt frames/contains_loop_frame.html > temp.txt

python format_text/inject_challenge_number.py temp.txt 1 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/contains_loop/factor1.c temp2.txt > ../contains_loop1.html

python format_text/inject_challenge_number.py temp.txt 2 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/contains_loop/factor2.c temp2.txt > ../contains_loop2.html

python format_text/inject_challenge_number.py temp.txt 3 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/contains_loop/factor3.c temp2.txt > ../contains_loop3.html

python format_text/inject_challenge_number.py temp.txt 4 > temp2.txt

python format_text/inject_code.py code_samples/current_samples/contains_loop/factor4.c temp2.txt > ../contains_loop4.html
