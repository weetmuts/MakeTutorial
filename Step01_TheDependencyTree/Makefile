# A Makefile is read in two distinct phases:
# https://www.gnu.org/software/make/manual/html_node/Reading-Makefiles.html
#
# 1) it loads and executes the file imperatively and builds a dependency tree.
# Lets call this the first phase, or the immediate phase, or the imperative phase.
#
# 2) it will evaluate this newly built dependency tree to execute recipes (if necessary)
# to generate the specified target.
# Lets call this the second phase, or the deferred phase, or the tree evaluation phase.

# The "all" target below is the first target in the file. It will therefore be the default
# make target. Here it only declares three dependencies and no recipe.
all: hello list_of_strings.txt hello.lines

# Do NOT look for a file named "all", instead always execute the all target.
.PHONY: all

# Declare the hello target and its recipe. Each line of a recipe is indented with a TAB.
# In the second phase, if any of hello.c or there.c has a last modified timestemp that
# is newer than hello's timestamp, then the recipe will be executed.
#
# But timestamp evaluation is only started if the hello target has actually been requested.
# If you run "make" or "make all" the defalut target is evaluated and consequently all its
# dependencies including hello. If you run "make hello.lines" then only that target
# is requested and built if necessary.
hello: hello.c there.c
	gcc hello.c there.c -o hello

# Another rule will look for strings inside hello.c and this Makefile.
list_of_strings.txt: hello.c Makefile
	cat hello.c there.c Makefile | grep -o '".*"'  > list_of_strings.txt

# You can place the recipe on the same line by using a semicolon.
# The command "wc -l" will count all the lines inside hello.c
hello.lines: hello.c ; wc -l hello.c > hello.lines

# You can update the target explicitly if you want to do something which does not
# change the local file system. Here hello is uploaded to a server.
# The touched file hello.uploaded will tell make that if you run "make upload" twice
# in a row. It will only upload again if the hello binary has changed.
hello.uploaded: hello
	scp hello server:/home/code
	touch hello.uploaded

# The timestamp target might have a long name. To make the CLI easier to remember
# you can add a phony target that depends on the hello.uploaded file.
# Bash cli expansion will also help you, eg type "make up" press TAB and
# bash will look through the makefile to find a suitable target that starts with up
# and expand the command line to "make upload"
upload: hello.uploaded
.PHONY: upload

clean:
	rm -f hello list_of_strings.txt hello.lines
.PHONY: clean

# This Makefile ends the first phase with printing the "End of makefile loaded..." messages below.
# Thus this message at the end of the file is always printed before any recipes are executed!
$(info End of makefile loaded, a tree of dependencies now exists!)
$(info So which target(s) is it that you want to build?)
$(info Let us check MAKECMDGOALS="$(MAKECMDGOALS)")
