#include <stdio.h>
#include <stdlib.h>

#include "klee/klee.h"

int compute(int num1, int num2);


int compute(int num1, int num2) {
  int temp = num1;

  if(num1 <= 0 || num2 <= 0) {
    return -1;
  }
  
  for(int i = 0; i < 2 && temp != 0; i++) {
    if(num1 < num2) {
      temp = num1;
      num1 = num2;
      num2 = temp;
    }
    temp = num1 % num2;
    if(temp != 0) {
      num1 = num2;
      num2 = temp;
    }
  }

  return num2;
}

int main(int argc, char* argv[]) {
  int num1;
  int num2;

  klee_make_symbolic(&num1, sizeof(num1), "num1");
  klee_make_symbolic(&num2, sizeof(num2), "num2");
  
  compute(num1, num2);
  return 0;
}
