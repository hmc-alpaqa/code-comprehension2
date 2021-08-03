#include <stdio.h>


int warmup0(int input) {
  int var1 = 2;
  int var2[var1];

  var2[0] = -10;
  var2[1] = 10;
  
  return var2[input];
}

void warmup_one(int input) {
  int var2 = 3;

  if(input < (var2 - 1)) {
    printf("1 ");

  } else if(input > (var2 - 1)) {
    printf("2 ");

  } else {
    printf("3 ");
  }
}

void warmup_two(char* input_one, int input_two[]) {
  if(strlen(input_one) < 3 || arrlen(input_two) < 3) {
    printf("1 ");
    return;
  }

  if(input_one[2] == 't' && input_two[2] == 5) {
    printf("2 ");

  } else {
    printf("3 ");
  }
}

void warmup_three(int input_one, int input_two) {
  if(input_two - 3 > input_one) {
    printf("1 ");
    return;
  }
  
  for(int i = input_one; i < input_two; i++) {
    printf("2 ");
  }
}

int main(int argc, char* argv[]) {



}
