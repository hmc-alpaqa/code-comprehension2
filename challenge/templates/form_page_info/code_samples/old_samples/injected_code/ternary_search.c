#include <time.h>
#include <stdio.h>

#include "GraphManager.h"

int ternarySearch(int l, int r, int key, int ar[], struct GraphManager* graph_manager);
int do_ternarySearch(int r, int key, int ar[], struct GraphManager* graph_manager);

int do_ternarySearch(int r, int key, int ar[], struct GraphManager* graph_manager) {
  visit_node(graph_manager, 0, 0, ENTRY, ENTRY);
  int p = ternarySearch(0, r, key, ar, graph_manager);
  visit_node(graph_manager, 0, 1, LOOP_EXIT, LOOP_EXIT);

  return p;
}

// Function to perform Ternary Search
int ternarySearch(int l, int r, int key, int ar[], struct GraphManager* graph_manager)
{

  visit_node(graph_manager, 0, 1, LOOP_ENTRY, LOOP_ENTRY);

  visit_node(graph_manager, 1, 0, ENTRY, NO_FLAGS);
  
    if (r >= l)
    {

      visit_node(graph_manager, 1, 1, NO_FLAGS, NO_FLAGS);
      
        // Find the mid1 and mid2
        int mid1 = l + (r - l) / 3;
        int mid2 = r - (r - l) / 3;

        // Check if key is present at any mid
        if (ar[mid1] == key)
        {

	  visit_node(graph_manager, 1, 2, NO_FLAGS, NO_FLAGS);
	  
            return mid1;
        }
        if (ar[mid2] == key)
        {

	  visit_node(graph_manager, 1, 3, NO_FLAGS, NO_FLAGS);
	  
            return mid2;
        }

        // Since key is not present at mid,
        // check in which region it is present
        // then repeat the Search operation
        // in that region

        if (key < ar[mid1])
        {

	  visit_node(graph_manager, 1, 4, NO_FLAGS, NO_FLAGS);
	  
            // The key lies in between l and mid1
	  return ternarySearch(l, mid1 - 1, key, ar, graph_manager);
        }
        else if (key > ar[mid2])
        {

	  visit_node(graph_manager, 1, 5, NO_FLAGS, NO_FLAGS);
	  
            // The key lies in between mid2 and r
	  return ternarySearch(mid2 + 1, r, key, ar, graph_manager);
        }
        else
        {

	  visit_node(graph_manager, 1, 6, NO_FLAGS, NO_FLAGS);
	  
            // The key lies in between mid1 and mid2
	  return ternarySearch(mid1 + 1, mid2 - 1, key, ar, graph_manager);
        }
    }

    visit_node(graph_manager, 1, 7, NO_FLAGS, NO_FLAGS);

    // Key not found
    return -1;
}

// Driver code
int main()
{
  long t;
  srand((unsigned) time(&t));
  
  struct GraphManager* graph_manager;
  int nodes_per[] = {2, 8};
  int num_graphs = 2;
  int loop_thresh = 5;
  initialize_GraphManager(&graph_manager, num_graphs, nodes_per, loop_thresh);


  int ar_size = 7000;
  int num_ar = 7000;
  int spacing = 10;

  int ar[ar_size];
  for(int i = 0; i < num_ar; i++) {
    ar[0] = 0;
    for(int j = 1; j < ar_size; j++) {
      int incr = rand() % spacing;
      ar[j] = ar[j-1] + spacing;
    }

    int range = ar[ar_size-1] - ar[0];
    int key = rand() % range + ar[0];
    do_ternarySearch(ar_size-1, key, ar, graph_manager);
  }

  terminate_paths(graph_manager);
  flush_queue(graph_manager);
  print_summary(graph_manager);
}
