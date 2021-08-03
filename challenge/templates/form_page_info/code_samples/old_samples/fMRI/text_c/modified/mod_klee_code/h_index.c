#include <stdio.h>
#include <stdlib.h>

#include "klee/klee.h"

int compute(int num1, int num2, int num3);
void sort(int nums[], int length);

int compute(int num1, int num2, int num3) {  
  int nums[] = {num1, num2, num3};
  int len = 3;
  sort(nums, len);
  

  int res = 0;
  for(int i = len - 1; i >= 0; i--) {
    int current = len - 1;
    if(nums[i] >= current) {
      res = current;
    } else {
      break;
    }
  }

  return res;
}

void sort(int nums[], int length) {
  for(int i = 0; i < length; i++) {
    for(int j = 0; j < length-i-1; j++) {
      int left = nums[j];
      int right = nums[j+1];
      if(left > right) {
	nums[j+1] = left;
	nums[j] = right;
      }
    }
  }
}

int main(int argc, char* argv[]) {
  int num1;
  int num2;
  int num3;
  
  klee_make_symbolic(&num1, sizeof(num1), "num1");
  klee_make_symbolic(&num2, sizeof(num2), "num2");
  klee_make_symbolic(&num3, sizeof(num3), "num3");

  compute(num1, num2, num3);
  return 0;
}
