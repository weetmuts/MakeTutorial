# It is common to disable the builtin rules. No need for Fortran rules....
# You can either run "make --no-builtin-rules" or add to this variable.
MAKEFLAGS += --no-builtin-rules

# A pattern rule is applied to any target that does not have any explicit rule.
# https://www.gnu.org/software/make/manual/html_node/Pattern-Rules.html

all: hello list_of_strings.txt hello.lines
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

clean:
	rm -f hello list_of_strings.txt hello.lines
.PHONY: clean

hello : hello.h
