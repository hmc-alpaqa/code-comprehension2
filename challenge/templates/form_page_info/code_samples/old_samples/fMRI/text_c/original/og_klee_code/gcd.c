#include <stdio.h>
#include <stdlib.h>

int compute(int num1, int num2);


int compute(int num1, int num2) {
  int temp = num1;

  while(temp != 0) {
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

}
