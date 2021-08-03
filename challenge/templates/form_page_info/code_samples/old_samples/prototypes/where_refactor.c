#include <stdlib.h>
#include <stdio.h>

//#include "BranchSelect.h"

//static struct BranchSelect* branch_select;
static int loop_depth;

struct BranchSelect {
  int val;
};

static struct BranchSelect* branch_select;

int select_if(struct BranchSelect* branch_select) {
  return branch_select->val;
}

void func1();
void func2();
void func3();
void func4(/*~*/);
void func5(/*~*/);
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
  func4(/**/);
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
    func4(/**/);
    /*end func4*/
  }
}

void func5(/*~*/) {
  //0 0 E E
  func4(/**/);

  for(int i = 0; i < loop_depth; i++) {
    //0 1 LEN LEN
    func4(/**/);
  }
  //0 1 LEX LEX

  //0 2 N N
}

void func4(/*~*/) {
  //1 0 E N
  
  if(select_if(branch_select)) {
    //1 1 N N
    dummy_func(0, 0);

  } else {
    //1 1 N N
    dummy_func(1, 1);
  }

  //1 2 N N
}

int dummy_func(int x, int y) {
  return x * y;
}


int main(int argc, char* argv[]) {
  int if_percent = 50;
  //initialize_BranchSelect(&branch_select, if_percent);
}
