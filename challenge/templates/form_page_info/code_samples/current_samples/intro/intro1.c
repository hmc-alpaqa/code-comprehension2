#include <stdio.h>

void func_one(int input);
void func_two();

//start code
void func_one(int input) {
  printf("1 ");

  if(input > 5) {
    printf("2 ");

  } else {
    func_two();
  }
}

void func_two() {
  printf("3 ");
}
//end code



int main(int argc, char* argv[]) {


}
