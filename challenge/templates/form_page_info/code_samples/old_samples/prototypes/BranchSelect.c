#include "BranchSelect.h"

void initialize_BranchSelect(struct BranchSelect** branch_select, int if_percent) {
  *branch_select = malloc(sizeof(struct BranchSelect));

  (*branch_select)->if_percent = if_percent;

  long t;
  srand((unsigned) time(&t));
}

int select_if(struct BranchSelect* branch_select) {
  int rand_val = rand() % PERCENT_BASE;
  return rand_val < branch_select->if_percent;
  
}
