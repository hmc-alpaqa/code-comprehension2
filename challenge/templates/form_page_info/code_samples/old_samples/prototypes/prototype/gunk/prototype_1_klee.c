#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <limits.h>

#include "klee/klee.h"

struct MysteryStruct {
  int str_index;
  int str_len;
  int special_val;
  int special_product;
  char* str;
};

//Shown
int func0(int input);
int create_instruction(int base, int input);
void select_and_call_function(struct MysteryStruct* mystery_struct, int instruction_set[], int index);

//Hidden
struct MysteryStruct* initialize_MysteryStruct();
void func1(struct MysteryStruct* mystery_struct);
void func2(struct MysteryStruct* mystery_struct);
void func3(struct MysteryStruct* mystery_struct);
void add_letter(struct MysteryStruct* mystery_struct, char letter);
int parse_input(char* input, int* value);
void read_input_file(FILE* file, int** tests, int* num_tests, int* invalid_test);

struct MysteryStruct* initialize_MysteryStruct() {
  struct MysteryStruct* mystery_struct = malloc(sizeof(struct MysteryStruct*));
  mystery_struct->str_index = 0;
  mystery_struct->str_len = 2;
  mystery_struct->str = calloc(3, sizeof(char));
  mystery_struct->str[2] = '\0';
  mystery_struct->special_val = 0;
  mystery_struct->special_product = 1;
  return mystery_struct;
}

void func1(struct MysteryStruct* mystery_struct) {
  add_letter(mystery_struct, '1');
  mystery_struct->special_val += (1 * mystery_struct->special_product);
  mystery_struct->special_product++;
}
void func2(struct MysteryStruct* mystery_struct) {
  add_letter(mystery_struct, '2');
  mystery_struct->special_val += (64 * mystery_struct->special_product);
  mystery_struct->special_product++;
}
void func3(struct MysteryStruct* mystery_struct) {
  add_letter(mystery_struct, '3');
  mystery_struct->special_val += (4096 * mystery_struct->special_product);
  mystery_struct->special_product++;
}

void add_letter(struct MysteryStruct* mystery_struct, char letter) {
  int index = mystery_struct->str_index % mystery_struct->str_len;
  mystery_struct->str[index] = letter;
  mystery_struct->str_index++;
}
  

//start
int func0(int input) {
  int base = 8;
  int num_instructions = 4;
  int instruction_set[num_instructions];

  for(int i = 0; i < num_instructions; i++) {
    int instruction = create_instruction(base, input);
    instruction_set[i] = instruction;
    
    input = input / base;
  }


  struct MysteryStruct* mystery_struct = initialize_MysteryStruct();
  for(int i = 0; i < (num_instructions - 1); i+=2) {
    select_and_call_function(mystery_struct, instruction_set, i);
  }

  return mystery_struct->special_val;
}

int create_instruction(int base, int input) {
  int instruction;
  int remainder = input % base;

  if(remainder < (base - 3)) {
    instruction = 0;

  } else if(remainder > (base - 3)) {
    instruction = 1;

  } else {
    instruction = 2;
  }
  
  return instruction;  
}

void select_and_call_function(struct MysteryStruct* mystery_struct, int instruction_set[],
			      int index) {
  int instruction_sum = instruction_set[index] + instruction_set[index+1];

  if(instruction_sum < 2) {
    func1(mystery_struct);
    
  } else if(instruction_sum == 2) {
    func2(mystery_struct);
    
  } else {
    func3(mystery_struct);
  }
}
//end

//Points value to the number represented by input.
//Returns 0 on success and -1 on invalid input.
int parse_input(char* input, int* value) {
  if(strlen(input) == 0) {
    return -1;
  }

  char* endptr;
  int parse_res;
  long strtol_res = strtol(input, &endptr, 10);
  
  if(strlen(endptr) == 0 || (strlen(endptr) == 1 && endptr[0] == '\n')) {
    if(strtol_res > INTMAX_MAX || strtol_res < INTMAX_MIN) {
      parse_res = -1;

    } else {
      *value = (int) strtol_res;
      parse_res = 0;
    }
    
  } else {
    parse_res = 1;
  }

  return parse_res;
}

void read_input_file(FILE* file, int** tests, int* num_tests, int* invalid_test) {
  int max_line_length = 100;
  int max_inputs = 4096;
  char line[max_line_length];

  *tests = malloc(max_inputs * sizeof(int));
  *num_tests = 0;
  *invalid_test = 0;
  
  while(fgets(line, max_line_length, file)) {
    int value;
    int parse_res = parse_input(line, &value);

    if(parse_res == 0) {
      tests[(*num_tests)++] = value;
    } else {
      *invalid_test = 1;
    }
  }
}

int main(int argc, char* argv[]) {
  int input;
  klee_make_symbolic(&input, sizeof(input), "input");
  return func0(input);
}
