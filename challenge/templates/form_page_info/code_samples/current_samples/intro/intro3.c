#include <stdio.h>

void func_one(int input_one[], int input_two[]);

//start code
void func_one(int input_one[], int input_two[]) {
  int length_one = arrlen(input_one);
  int length_two = arrlen(input_two);

  if(length_one < 3 || length_two < 3) {
    printf("1 ");
    return;
  }

  if(input_one[2] == input_two[2]) {
    printf("2 ");

  } else {
    printf("3 ");
  }
}
//end code

int main(int argc, char* argv) {

}

