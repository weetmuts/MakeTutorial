# A Makefile is read in two distinct phases:
# https://www.gnu.org/software/make/manual/html_node/Reading-Makefiles.html
#
# 1) it loads and executes the file imperatively and builds a dependency tree.
# Lets call this the first phase, or the immediate phase, or the imperative phase.
#
# 2) it will evaluate this newly built dependency tree to execute recipes (if necessary)
# to generate the specified target.
# Lets call this the second phase, or the deferred phase, or the tree evaluation phase.

# The all target is the first target in the file. It will be the default make target.
# It only declares a dependency here and no recipe.
all: hello list_of_strings.txt hello.lines

# Do NOT look for a file named "all", instead always execute the all target.
.PHONY: all

# Declare the hello target and its recipe. Each line of a recipe is indented with a TAB.
hello: hello.c hello.h
	gcc hello.c -o hello

# Another rule will look for strings "example"
list_of_strings.txt: hello.c Makefile
	cat hello.c  | grep -o '".*"'  > list_of_strings.txt
	cat Makefile | grep -o '".*"'  >> list_of_strings.txt

# You can place the recipe on the same line by using a semicolon.
hello.lines: hello.c ; wc -l hello.c > hello.lines

clean:
	rm -f hello list_of_strings.txt hello.lines
.PHONY: clean

# This Makefile ends the first phase with printing the "End of makefile loaded" message.
# This message is therefore printed before any recipes are executed!
$(info End of makefile loaded)
