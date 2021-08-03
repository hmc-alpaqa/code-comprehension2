#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "klee/klee.h"

int compute(char string1[], char string2[]);
int my_strlen(char string1[]);

int compute(char string1[], char string2[]) {
  int len1 = my_strlen(string1);
  int len2 = my_strlen(string2);
  
  int res = 0;
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

int my_strlen(char string[]) {
  int len = 0;
  while(string[len] != '\0') {
    len++;
  }
  return len;
}

int main(int argc, char* argv[]) {

  int max_len = 10;
  char string1[max_len];
  char string2[max_len];

  klee_make_symbolic(string1, sizeof(string1), "string1");
  klee_make_symbolic(string2, sizeof(string2), "string2");

  klee_assume(string1[max_len-1] == '\0');
  klee_assume(string2[max_len-1] == '\0');

  compute(string1, string2);
  return 0;
}
