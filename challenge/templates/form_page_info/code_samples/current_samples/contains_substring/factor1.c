#include <string.h>
#include <stdio.h>
#include <stdlib.h>

void func_one(char input_one[], char input_two[]);

//start code
void func_one(char input_one[], char input_two[]) {
  int len_one = strlen(input_one);
  int len_two = strlen(input_two);
  
  if(len_one > 3 || len_two > 3) {
    printf("1 ");

  } else {

    for(int i = 0; i < len_one; i++) {
      printf("2 ");
      
      for(int j = 0; j < len_two; j++) {
        printf("3 ");
	
        if(i + j >= len_one) {
          printf("4 ");
          break;
        }
	
        if(input_one[i + j] != input_two[j]) {
          printf("5 ");
          break;
	  
        } else {
          printf("6 ");
	  
          if(j == len_two - 1) {
            printf("7 ");
            break;
          }
        }
      }
    }
  }

  printf("8 ");
}
//end code


int main(int argc, char* argv[]) {

  int max_size = 10;
  char input_1[] = "hel";
  char input_2[] = "el";

  func_one(input_1, input_2);
  return 0;
}
