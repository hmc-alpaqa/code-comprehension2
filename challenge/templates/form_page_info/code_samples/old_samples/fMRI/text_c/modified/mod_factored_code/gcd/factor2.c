#include <stdio.h>
#include <stdlib.h>

int compute(int num1, int num2);
void func1(int* num1_ptr, int* num2_ptr, int* var_ptr);

int compute(int num1, int num2) {
  int var = num1;

  if(num1 <= 0 || num2 <= 0) {
    return -1;
  }
  
  for(int i = 0; i < 2 && var != 0; i++) {
    func1(&num1, &num2, &var);
  }

  return num2;
}

void func1(int* num1_ptr, int* num2_ptr, int* var_ptr) {
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

int main(int argc, char* argv[]) {
  int num1;
  int num2;
  
  compute(num1, num2);
  return 0;
}
