#include <stdlib.h>
#include <stdio.h>

void func_one(int input_one[], int len_one, int input_two[], int len_two);


void func_one(int input_one[], int len_one, int input_two[], int len_two) {
  if(len_one > len_two) {
    printf("1 ");
    return;
  }
  
  int start_one = 0;
  int start_two = 0;

  int iterations = 3;
  for(int i = 0; i < iterations; i++) {
    printf("2 ");
    
    if(len_one == 1) {

      if(len_two == 1) {
	printf("3 ");
	
      } else if(len_two % 2 == 1) {
	printf("4 ");

      } else {
	printf("5 ");
      }
      return;

    } else if(len_one == 2) {

      if(len_two == 2) {
	printf("6 ");

      } else if(len_two % 2 == 0) {
	printf("7 ");

      } else {
	printf("8 ");

      }
      return;
    }

    int index_one = (len_one - 1) / 2 + start_one;
    int index_two = (len_two - 1) / 2 + start_two;

    if(input_one[index_one] <= input_two[index_two]) {
      printf("9 ");
      start_one += index_one;

    } else {
      printf("10 ");
      start_two += index_one;
    }
    
    len_one -= index_one;
    len_two -= index_one;
  }
}





int main(int argc, char* argv[]) {




}
