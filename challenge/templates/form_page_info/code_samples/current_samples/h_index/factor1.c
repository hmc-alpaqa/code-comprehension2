#include <stdio.h>
#include <stdlib.h>

void func_one(int input_one[]);
int arrlen(int input_one[]);

int arrlen(int input_one[]) {
  return 3;
}

//start code
void func_one(int input_one[]) {  
  int len = arrlen(input_one);

  if(len != 3) {
    printf("1 ");
    return;
  }

  if(input_one[0] > input_one[1] || input_one[1] > input_one[2]) {
    printf("2 ");
    return;
  }
  
  int var_one = 1;
  for(int i = len - 1; i >= 0 && var_one == 1; i--) {
    printf("3 ");

    int var_two = len - i;

    if(input_one[i] >= var_two) {
      printf("4 ");
      var_one = 1;

    } else {
      printf("5 ");
      var_one = 0;
    }
  }

  printf("6 ");
}
//end code

int main(int argc, char* argv[]) {
  int input_one[] = {3, 5, 9};

  func_one(input_one);
  return 0;
}
