
# Automatic variables can be convenient (but not necessary) in rules since you can avoid
# duplicating the input and output file names.
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

# $@ means the target file
# $^ means all dependencies
# $< means the first dependency

all: hello list_of_strings.txt hello.lines
.PHONY: all

hello: hello.c hello.h
	gcc $< -o $@

list_of_strings.txt: hello.c Makefile
	cat $^ | grep -o '".*"'  > $@

hello.lines: hello.c ; wc -l $< > $@

clean:
	rm -f hello list_of_strings.txt hello.lines
.PHONY: clean
