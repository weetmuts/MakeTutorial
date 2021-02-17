

MAKEFLAGS += --no-builtin-rules

# A pattern rule is applied to any target without any explicit rule.
# https://www.gnu.org/software/make/manual/html_node/Pattern-Rules.html

all: hello list_of_strings.txt hello.lines
.PHONY: all

# This rule is for demonstration purposes only, usually the rule is: %.o : %c to
# create object files.
% : %.c
	gcc -c $< -o $@

list_of_strings.txt: hello.c Makefile
	cat $^ | grep -o '".*"'  > list_of_strings.txt

%.lines: %.c ; wc -l $< > $@

clean:
	rm -f hello list_of_strings.txt hello.lines
.PHONY: clean

hello : hello.h
