#include <stdio.h>
#include <stdlib.h>

#include "klee/klee.h"

int compute(int nums[], int len);
void sort(int nums[], int length);

int compute(int nums[], int len) {
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
  int max_len = 10;
  int nums[max_len];
  int len;

  klee_make_symbolic(&nums, sizeof(nums), "nums");
  klee_make_symbolic(&len, sizeof(len), "len");

  klee_assume(len <= max_len);
  
  compute(nums, len);
  return 0;
}
