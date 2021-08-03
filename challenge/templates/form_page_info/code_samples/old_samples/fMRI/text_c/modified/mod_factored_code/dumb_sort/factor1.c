#include <stdio.h>
#include <stdlib.h>

void compute(int a, int b, int c);

void compute(int a, int b, int c) {

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
}


int main(int argc, char* argv[]) {
  int a;
  int b;
  int c;

  compute(a, b, c);
  return 0;
}
