#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <limits.h>

#include "GraphManager.h"

struct MysteryStruct {
  int str_index;
  int str_len;
  char* str;
};

//Shown
struct MysteryStruct* func0(int input, struct GraphManager* graph_manager);
int create_instruction(int base, int input, struct GraphManager* graph_manager);
void select_and_call_function(struct MysteryStruct* mystery_struct, int instruction_set[], int index, struct GraphManager* graph_manager);

//Hidden
struct MysteryStruct* initialize_MysteryStruct();
void func1(struct MysteryStruct* mystery_struct);
void func2(struct MysteryStruct* mystery_struct);
void func3(struct MysteryStruct* mystery_struct);
void add_letter(struct MysteryStruct* mystery_struct, char letter);
int parse_input(char* input, int* value);


struct MysteryStruct* initialize_MysteryStruct() {
  struct MysteryStruct* mystery_struct = malloc(sizeof(struct MysteryStruct*));
  mystery_struct->str_index = 0;
  mystery_struct->str_len = 2;
  mystery_struct->str = calloc(3, sizeof(char));
  mystery_struct->str[2] = '\0';
  return mystery_struct;
}

void func1(struct MysteryStruct* mystery_struct) {
  add_letter(mystery_struct, '1');
}
void func2(struct MysteryStruct* mystery_struct) {
  add_letter(mystery_struct, '2');
}
void func3(struct MysteryStruct* mystery_struct) {
  add_letter(mystery_struct, '3');
}

void add_letter(struct MysteryStruct* mystery_struct, char letter) {
  int index = mystery_struct->str_index % mystery_struct->str_len;
  mystery_struct->str[index] = letter;
  mystery_struct->str_index++;
}
  

//start
struct MysteryStruct* func0(int input, struct GraphManager* graph_manager) {
  visit_node(graph_manager, 0, 0, ENTRY, ENTRY);
  
  int base = 8;
  int num_instructions = 4;
  int instruction_set[num_instructions];

  visit_node(graph_manager, 1, 0, ENTRY, NO_FLAGS);
  for(int i = 0; i < num_instructions; i++) {
    visit_node(graph_manager, 1, 1, LOOP_ENTRY, LOOP_ENTRY);
    
    int instruction = create_instruction(base, input, graph_manager);
    instruction_set[i] = instruction;
    
    input = input / base;
  }
  visit_node(graph_manager, 1, 1, LOOP_EXIT, LOOP_EXIT);


  struct MysteryStruct* mystery_struct = initialize_MysteryStruct();

  visit_node(graph_manager, 2, 0, ENTRY, NO_FLAGS);
  for(int i = 0; i < (num_instructions - 1); i+=2) {
    visit_node(graph_manager, 2, 1, LOOP_ENTRY, LOOP_ENTRY);
    
    select_and_call_function(mystery_struct, instruction_set, i, graph_manager);
  }
  visit_node(graph_manager, 2, 1, LOOP_EXIT, LOOP_EXIT);

  visit_node(graph_manager, 0, 1, NO_FLAGS, NO_FLAGS);
  return mystery_struct;
}

int create_instruction(int base, int input, struct GraphManager* graph_manager) {
  visit_node(graph_manager, 1, 2, NO_FLAGS, NO_FLAGS);
  int instruction;
  int remainder = input % base;

  if(remainder < (base - 3)) {
    visit_node(graph_manager, 1, 3, NO_FLAGS, NO_FLAGS);
    instruction = 0;

  } else if(remainder > (base - 3)) {
    visit_node(graph_manager, 1, 4, NO_FLAGS, NO_FLAGS);
    instruction = 1;

  } else {
    visit_node(graph_manager, 1, 5, NO_FLAGS, NO_FLAGS);
    instruction = 2;
  }

  visit_node(graph_manager, 1, 6, NO_FLAGS, NO_FLAGS);
  return instruction;  
}

void select_and_call_function(struct MysteryStruct* mystery_struct, int instruction_set[], int index, struct GraphManager* graph_manager) {
  visit_node(graph_manager, 2, 2, NO_FLAGS, NO_FLAGS);
  
  int instruction_sum = instruction_set[index] + instruction_set[index+1];

  if(instruction_sum < 2) {
    visit_node(graph_manager, 2, 3, NO_FLAGS, NO_FLAGS);
    func1(mystery_struct);
    
  } else if(instruction_sum == 2) {
    visit_node(graph_manager, 2, 4, NO_FLAGS, NO_FLAGS);
    func2(mystery_struct);
    
  } else {
    visit_node(graph_manager, 2, 5, NO_FLAGS, NO_FLAGS);
    func3(mystery_struct);
  }

  visit_node(graph_manager, 2, 6, NO_FLAGS, NO_FLAGS);
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

int main(int argc, char* argv[]) {
  int max_line_length = 100;
  int max_inputs = 4096;
  char line[max_line_length];

  int* inputs = malloc(max_inputs * sizeof(int));
  int num_inputs = 0;
  int contained_invalid_test = 0;
  FILE* in = fopen(argv[1], "r");
  while(fgets(line, max_line_length, in)) {
    int value;
    int parse_res = parse_input(line, &value);

    if(parse_res == 0) {
      inputs[num_inputs++] = value;
    } else {
      contained_invalid_test = 1;
    }
  }

  if(contained_invalid_test) {
    printf("At least one test case was invalid\n");
  }


  struct GraphManager* graph_manager;
  int num_graphs = 3;
  int nodes_per[] = {2, 7, 7};
  int loop_thresh  = 6;
  
  initialize_GraphManager(&graph_manager, num_graphs, nodes_per, loop_thresh);

  struct MysteryStruct* pointer;
  for(int i = 0; i < num_inputs; i++) {
    pointer = func0(inputs[i], graph_manager);
    
    free(pointer);
  }

  terminate_paths(graph_manager);
  flush_queue(graph_manager);
  go_interactive(graph_manager);
}
