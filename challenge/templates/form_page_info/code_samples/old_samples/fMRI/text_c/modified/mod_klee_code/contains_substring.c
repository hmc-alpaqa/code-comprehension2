#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "klee/klee.h"

int compute(char string1[], char string2[]);
int my_strlen(char string[], int max_len);

int compute(char string1[], char string2[]) {
  int max_len = 3;
  
  int len1 = my_strlen(string1, max_len);
  int len2 = my_strlen(string2, max_len);
  int res = 0;
  
  if(len1 > max_len || len2 > max_len) {
    return res;
  }

  for(int i = 0; i < len1; i++) {
    for(int j = 0; j < len2; j++) {
      if(i + j >= len1)
	break;
      if(string1[i + j] != string2[j]) {
	break;
      } else {
	if(j == len2 - 1) {
	  res = 1;
	  break;
	}
      }
    }
  }

  return res;
}

int my_strlen(char string[], int max_len) {
  int len = 0;
  while(string[len] != '\0' && len <= max_len) {
    len++;
  }
  return len;
}


int main(int argc, char* argv[]) {

  int max_size = 10;
  char input_1[max_size];
  char input_2[max_size];

  klee_make_symbolic(input_1, sizeof(input_1), "input_1");
  klee_assume(input_1[max_size-1] == '\0');

  klee_make_symbolic(input_2, sizeof(input_2), "input_2");
  klee_assume(input_2[max_size-1] == '\0');
  
  compute(input_1, input_2);
  return 0;
}
