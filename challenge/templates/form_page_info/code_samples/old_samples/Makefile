cur_dir = $(shell pwd)
path_to_graphman = ../track_paths
include_libs = -I$(curdir)$(path_to_graphman)
path_counting = $(wildcard $(path_to_graphman)/*.c)

hello:
	gcc $(include_libs) -o hello_world hello_world.c

factorials:
	gcc -g $(include_libs) -o factorials ./factorial_dir/factorials.c $(path_counting) --coverage

bfs:
	gcc -g $(include_libs) -o bfs ./AlgoC/data_structures/graphs/bfs.c $(path_counting) --coverage

ternary:
	gcc -g $(include_libs) -o ternary_search ./injected_code/ternary_search.c $(path_counting) --coverage

where_refactor:
	gcc -g $(include_libs) -I./for_the_study/include -o where_refactor ./injected_code/where_refactor.c $(path_counting) ./for_the_study/BranchSelect.c --coverage

prototype_1:
	gcc -g $(include_libs) -o prototype_1 ./injected_code/prototype_1.c $(path_counting)

print:
	echo $(path_counting)

clean:
	rm hello_world factorials bfs ternary where_refactor prototype_1 *.gcno *.gcov *.gcda
