#include <stdio.h>
#include <stdlib.h>

void func_one(int input_one[]);
int arrlen(int input_one[]);

int arrlen(int input_one[]) {
  return 3;
}

//start code
void func_one(int input_one[]) {
  int len_one = arrlen(input_one);

  if(len_one > 3) {
    printf("1 ");
    
  } else {
    int var_one = -1;
    for(int i = 0; i < len_one; i++) {
      printf("2 ");
      
      int var_two = (i + input_one[i]) % len_one;
      while(var_two != i && input_one[var_two] != var_one) {
        printf("3 ");
	
        int var_three = input_one[var_two];
        input_one[var_two] = var_one;
        var_two = (var_two + var_three) % len_one;
      }

      var_one--;
    }
  }					       
  
  printf("4 ");
}
//end code

int main(int argc, char* argv[]) {
  int input_one[] = {1, -1, 0};
  func_one(input_one);
}
