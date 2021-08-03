#include <stdio.h>
#include <stdlib.h>

int* compute(int a, int b, int c);
void func1(int* addr1, int* addr2);

int* compute(int a, int b, int c) {
  int* res = (int*) malloc(3 * sizeof(int));

  int* a_addr = &a;
  int* b_addr = &b;
  int* c_addr = &c;

  func1(a_addr, b_addr);
  func1(a_addr, c_addr);
  func1(b_addr, c_addr);
  
  res[0] = a;
  res[1] = b;
  res[2] = c;
  return res;
}

void func1(int* addr1, int* addr2) {
  if(*addr1 > *addr2) {
    int temp = *addr2;
    *addr2 = *addr1;
    *addr1 = temp;
  }
}


int main(int argc, char* argv[]) {
  int a;
  int b;
  int c;

  compute(a, b, c);
  return 0;
}
