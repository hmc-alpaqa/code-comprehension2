#include <stdio.h>
#include <stdlib.h>

int compute(int num1, int num2);

int compute(int num1, int num2) {
  int var = num1;

  if(num1 <= 0 || num2 <= 0) {
    return -1;
  }
  
  for(int i = 0; i < 2 && var != 0; i++) {
    int* var_ptr = &var;
    int* num1_ptr = &num1;
    int* num2_ptr = &num2;

    if(*num1_ptr < *num2_ptr) {
      *var_ptr = *num1_ptr;
      *num1_ptr = *num2_ptr;
      *num2_ptr = *var_ptr;
    }
    *var_ptr = *num1_ptr % *num2_ptr;
    if(*var_ptr != 0) {
      *num1_ptr = *num2_ptr;
      *num2_ptr = *var_ptr;
    }
  }

  return num2;
}

int main(int argc, char* argv[]) {
  int num1;
  int num2;
  
  compute(num1, num2);
  return 0;
}
