#include <stdio.h>

#include "GraphManager.h"
#include "flags.h"

int factorial_attempt(int n, struct GraphManager* graph_manager);

int factorial_attempt(int n, struct GraphManager* graph_manager) {
  //0 ENTRY
  visit_node(graph_manager, 0, 0, ENTRY, ENTRY);
  int counter = 1;
  
  /*factorial 0*/
  int j = 1;
  for(int i = 1; i <= n; i++) {
    //0 LOOP_ENTRY
    visit_node(graph_manager, 0, 1, LOOP_ENTRY, LOOP_ENTRY);
    j *= i;
  }
  //0 LOOP_EXIT
  visit_node(graph_manager, 0, 1, LOOP_EXIT, LOOP_EXIT);



  /*check mod 10 1*/
  //1 ENTRY
  visit_node(graph_manager, 1, 0, ENTRY, NO_FLAGS);
  if(j % 10 == 0) {
    //1
    visit_node(graph_manager, 1, 1, NO_FLAGS, NO_FLAGS);
    counter--;
  } else {
    //1
    visit_node(graph_manager, 1, 2, NO_FLAGS, NO_FLAGS);
    counter++;
  }


  
  /*check < 256 2*/
  //2 ENTRY
  visit_node(graph_manager, 2, 0, ENTRY, NO_FLAGS);
  if(j < 256) {
    //2
    visit_node(graph_manager, 2, 1, NO_FLAGS, NO_FLAGS);
    counter--;
  } else {
    //2
    visit_node(graph_manager, 2, 2, NO_FLAGS, NO_FLAGS);
    counter++;
  }


  return j * counter;
}


int main(int argc, char* argv[]) {
  struct GraphManager* graph_manager;
  int num_graphs = 3;
  int* nodes_per_graph = malloc(num_graphs * sizeof(int));
  nodes_per_graph[0] = 2;
  nodes_per_graph[1] = 3;
  nodes_per_graph[2] = 3;
  int loop_threshold = 1;
  initialize_GraphManager(&graph_manager, num_graphs, nodes_per_graph, loop_threshold);

  int test[] = {1, 2, 3, 4};
  int test_length = 4;
  for(int i = 0; i < test_length; i++) {
    int input = test[i];
    int res = factorial_attempt(input, graph_manager);
  }

  terminate_paths(graph_manager);
  print_summary(graph_manager);

  return 0;
}
