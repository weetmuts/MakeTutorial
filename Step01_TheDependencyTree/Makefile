# A Makefile is read in two distinct phases:
# https://www.gnu.org/software/make/manual/html_node/Reading-Makefiles.html
# Firstly, it loads and executes the file imperatively and builds a dependency tree.
# Secondly, it will evaluate this dependency tree to execute recipes (if necessary)
# to generate the specified target.

# This is the first target in the file. It will be the default make target.
# It only declares a dependency, there is no recipe.

# This Makefile ends the first phase with printing the "End of makefile loaded" message.
# This is thus printed before the evalutation of the dependencies and recipes!
all: hello list_of_strings.txt hello.lines

# Do NOT look for an all file, instead always execute the all target.
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

$(info End of makefile loaded)
