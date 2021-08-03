CURRENT_DIR=$(shell pwd)
KLEE_DIR=/home/klee/text_c

colon := :
$(colon) := :

run_mounted:
	docker run --rm -v $(CURRENT_DIR)$(:)$(KLEE_DIR) -ti --ulimit='stack=-1:-1' klee/klee:2.1
