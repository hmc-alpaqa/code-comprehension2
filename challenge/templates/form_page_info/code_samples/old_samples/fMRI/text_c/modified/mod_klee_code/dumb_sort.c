#include <stdio.h>
#include <stdlib.h>

#include "klee/klee.h"

int* compute(int a, int b, int c);

int* compute(int a, int b, int c) {
  int* res = (int*) malloc(3 * sizeof(int));

  int* a_addr = &a;
  int* b_addr = &b;
  int* c_addr = &c;

  
  
  if(*a_addr > *b_addr) {
    int temp = *b_addr;
    *b_addr = *a_addr;
    *a_addr = temp;
  }

  if(*a_addr > *c_addr) {
    int temp = *c_addr;
    *c_addr = *a_addr;
    *a_addr = temp;
  }

  if(*b_addr > *c_addr) {
    int temp = *c_addr;
    *c_addr = *b_addr;
    *b_addr = temp;
  }

  res[0] = a;
  res[1] = b;
  res[2] = c;
  return res;
}


int main(int argc, char* argv[]) {
  int a;
  int b;
  int c;
  klee_make_symbolic(&a, sizeof(a), "a");
  klee_make_symbolic(&b, sizeof(b), "b");
  klee_make_symbolic(&c, sizeof(c), "c");

  compute(a, b, c);
  return 0;
}
