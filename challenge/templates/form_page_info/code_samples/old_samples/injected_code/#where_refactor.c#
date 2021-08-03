#include <stdlib.h>
#include <stdio.h>

#include "BranchSelect.h"
#include "GraphManager.h"

static struct BranchSelect* branch_select;
static int loop_depth;

void func1();
void func2();
void func3();
void func4(struct GraphManager* graph_manager);
void func5(struct GraphManager* graph_manager);
int dummy_func(int x, int y);

void func1() {
  /*start func4*/
  if(select_if(branch_select)) {
    dummy_func(0, 0);
    
  } else {
    dummy_func(1, 1);
  }
  /*end func4*/

  for(int i = 0; i < loop_depth; i++) {
    
    /*start func4*/
    if(select_if(branch_select)) {
      dummy_func(0, 0);
      
    } else {
      dummy_func(1, 1);
    }
    /*end func4*/
  }
}


void func2() {
  /*start func4*/
  func4(NULL);
  /*end func4*/

  for(int i = 0; i < loop_depth; i++) {

    /*start func4*/
    if(select_if(branch_select)) {
      dummy_func(0, 0);
      
    } else {
      dummy_func(1, 1);
    }
    /*end func4*/
  }
}

void func3() {
  /*start func4*/
  if(select_if(branch_select)) {
    dummy_func(0, 0);

  } else {
    dummy_func(1, 1);
  }
  /*end func4*/

  for(int i = 0; i < loop_depth; i++) {

    /*start func4*/
    func4(NULL);
    /*end func4*/
  }
}

void func5(struct GraphManager* graph_manager) {
  visit_node(graph_manager, 0, 0, ENTRY, ENTRY);
  func4(graph_manager);

  for(int i = 0; i < loop_depth; i++) {
    visit_node(graph_manager, 0, 1, LOOP_ENTRY, LOOP_ENTRY);
    func4(graph_manager);
  }
  visit_node(graph_manager, 0, 1, LOOP_EXIT, LOOP_EXIT);

  visit_node(graph_manager, 0, 2, NO_FLAGS, NO_FLAGS);
}

void func4(struct GraphManager* graph_manager) {
  visit_node(graph_manager, 1, 0, ENTRY, NO_FLAGS);
  
  if(select_if(branch_select)) {
    visit_node(graph_manager, 1, 1, NO_FLAGS, NO_FLAGS);
    dummy_func(0, 0);

  } else {
    visit_node(graph_manager, 1, 2, NO_FLAGS, NO_FLAGS);
    dummy_func(1, 1);
  }

  visit_node(graph_manager, 1, 3, NO_FLAGS, NO_FLAGS);
}

int dummy_func(int x, int y) {
  return x * y;
}


int main(int argc, char* argv[]) {
  int if_percent = 50;
  initialize_BranchSelect(&branch_select, if_percent);

  struct GraphManager* graph_manager;
  int num_graphs = 2;
  int nodes_per[] = {3, 3};
  int loop_thresh = 5;
  loop_depth = loop_thresh;
  initialize_GraphManager(&graph_manager, num_graphs, nodes_per, loop_thresh);

  int num_tests = 1000;
  for(int i = 0; i < num_tests; i++) {
    func5(graph_manager);
  }

  terminate_paths(graph_manager);
  flush_queue(graph_manager);
  print_summary(graph_manager);
}
