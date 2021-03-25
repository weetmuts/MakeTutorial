# It is common to disable the builtin rules. No need for Fortran rules....
# You can either run "make --no-builtin-rules" or add to this variable.
MAKEFLAGS += --no-builtin-rules

# A pattern rule is applied to any target that does not have any explicit rule.
# https://www.gnu.org/software/make/manual/html_node/Pattern-Rules.html

all: hello list_of_strings.txt hello.lines subset
.PHONY: all

# This rule is for demonstration purposes only, usually the rule is: %.o : %c to
# create object files. Given the target xyz, then this rule can be applied
# if there exists an xyz.c
% : %.c
	gcc -c $< -o $@

# Here there is no good relation between the target and the sources,
# so its not really possible to write a pattern rule.
list_of_strings.txt: hello.c Makefile
	cat $^ | grep -o '".*"'  > list_of_strings.txt

# Easy correlation from xyz.lines to xyz.c
%.lines: %.c ; wc -l $< > $@

# You can apply a tailored pattern rule for only a subset of all files.
# The desired subset here is a single file: subset/hello.o, but the subset
# can be any number of files. Usually stored in a variable.
subset/hello.o: subset/%.o : %.c
	mkdir -p subset
	gcc -c $< -o $@

subset: subset/hello.o

clean:
	rm -rf hello list_of_strings.txt hello.lines subset
.PHONY: clean

hello : hello.h
