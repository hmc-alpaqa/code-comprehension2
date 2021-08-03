#include <stdio.h>
#include <stdlib.h>

void func_one(char* input);

//start code
void func_one(char* input) {
  printf("1 ");

  if(strlen(input) < 1) {
    printf("2 ");
    return;
  }

  if(input[0] == 'c') {
    printf("3 ");

  } else {
    func_two();
  }
}

void func_two() {
  printf("4 ");
}
//end code

int main(int argc, char* argv[]) {

}
