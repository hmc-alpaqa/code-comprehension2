#include <stdio.h>
#include <stdlib.h>

#include "klee/klee.h"

int* compute(int a, int b, int c, int d);

int* compute(int a, int b, int c, int d) {
  int* res = (int*) malloc(4 * sizeof(int));
  
  if(a > b) {int temp = b; b = a; a = temp;}
  if(c > d) {int temp = d; d = c; d = temp;}
  if(a > c) {int temp = c; c = a; a = temp;}
  if(b > d) {int temp = d; d = b; b = temp;}
  if(b > c) {int temp = c; c = b; b = temp;}

  res[0] = a;
  res[1] = b;
  res[2] = c;
  res[3] = d;
  return res;
}


int main(int argc, char* argv[]) {
  int a, b, c, d;
  klee_make_symbolic(&a, sizeof(a), "a");
  klee_make_symbolic(&b, sizeof(b), "b");
  klee_make_symbolic(&c, sizeof(c), "c");
  klee_make_symbolic(&d, sizeof(d), "d");


  compute(a, b, c, d);
  return 0;
}
