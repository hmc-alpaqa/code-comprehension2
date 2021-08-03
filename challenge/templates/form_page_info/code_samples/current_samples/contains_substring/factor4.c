#include <string.h>
#include <stdio.h>
#include <stdlib.h>

void func_one(char input_one[], char input_two[]);
void func_two(char input_one[], int len_one, char input_two[], int len_two);
void func_three(char input_one[], int len_one, char input_two[], int len_two, int i);

//start code
void func_one(char input_one[], char input_two[]) {
  int len_one = strlen(input_one);
  int len_two = strlen(input_two);
  
  if(len_one > 3 || len_two > 3) {
    printf("1 ");

  } else {

    func_two(input_one, len_one, input_two, len_two);
  }
    
  printf("8 ");
}

void func_two(char input_one[], int len_one, char input_two[], int len_two) {

  for(int i = 0; i < len_one; i++) {
    printf("2 ");
    
    func_three(input_one, len_one, input_two, len_two, i);
  }
}

void func_three(char input_one[], int len_one, char input_two[], int len_two, int i) {
  
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
//end code

int main(int argc, char* argv[]) {

  int max_size = 10;
  char input_1[] = "hel";
  char input_2[] = "el";

  func_one(input_1, input_2);
  return 0;
}
