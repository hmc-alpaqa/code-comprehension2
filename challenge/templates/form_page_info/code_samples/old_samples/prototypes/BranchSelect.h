#ifndef BRANCH_SELECT_H
#define BRANCH_SELECT_H

#include <stdlib.h>
#include <time.h>
#include <stdio.h>

#define PERCENT_BASE 100

struct BranchSelect {
  int if_percent;
};

void initialize_BranchSelect(struct BranchSelect** branch_select, int if_percent);

int select_if(struct BranchSelect* branch_select);

#endif
