# A make variable begins with a $ sign.
# $x is a variable and $(x) is the same variable.
# $xxx is the variable $x followed by two x:s
# This you why you often write $(x)xx to reduce confusion.
# For multi character variables $(longer) the parentheses are required.

x=hello
# The spaces surrounding the equal sign are ignored.
x = hello

# This will print TEST="helloxxhello XX" during the first phase. (As you already
# noticed there are several builtin functions that look like a variable with
# arguments. info is one of them and we will explain more later.) Also XYZZY
# is not yet defined and expands to the empty string with no error or warning message.
# (This can be annoying sometimes, since a misspelled variable just expands
# to the empty string.)
$(info TEST="$xxx$(x) X$(XYZZY)X")

# To fully understand how variables are expanded you have to know the:
# 1) location: immediate(aka first phase) and deferred(aka second phase aka inside recipes)
# 2) type of variable: fully evaluated or lazy (recursively expanded)

# This is an immediate location and the variable is lazily assigned,
# ie EXTRA part will be expanded later when SOURCES is put to use.
SOURCES=hello.c $(EXTRA)

# This is an immediate location and the variable is full evaluated when assigned,
# ie the EXTRA part is evaluated to the empty string.
OTHERS:=hello.c $(EXTRA)

# This is an immediate location where both variables expand to "hello.c "
# (Note the extra space at the end.)
$(info FIRST SOURCES=$(SOURCES) OTHERS=$(OTHERS))

# A dependency rule's target and dependencies are immediate locations.
# Since SOURCES evaluates to just "hello.c " here, the dependency
# is actually broken since it does not include there.c
hello: $(SOURCES)
#   The recipe rule body is the deferred location so it will be evaulated
#   after the first imperative makefile phase is completed, look below!
#   Therefore SOURCES here will evaluate to "hello.c there.c"
#   since EXTRA will be set later during the imperative phase.
	gcc $(SOURCES) -o hello
#   To confirm that the dependencies are indeed broken, we
#   can either do "make --no-builtin-rules -p" and see the "hello: hello.c" rule,
#   or we can explicitly print all the dependencies $^ (this is an automatic variable)
#   that will be explained later. This will echo just hello.c
	@echo "Recipe ran with the dependencies: $^"
#   The @ sign means do not print the recipe line before executing it.
#   This is useful for echo commands, or you will get the same text twice.

# The recipe has now ended. No more TABBED lines after the rule.

# This is an immediate location, the varible is lazily assigned.
EXTRA=there.c

# This is an immediate location, the variable SOURCES is now expanded
# into "hello.c there.c" but OTHERS is an not a lazy variable and will
# evaluate to just "hello.c " as before.
$(info SECOND SOURCES=$(SOURCES) OTHERS=$(OTHERS))

# The current values of SOURCES and EXTRA are carried into the deferred evaluations inside the recipes.
# Thus the evaluation of SOURCES inside the recipe above will expand to "hello.c there.c"

clean:
	rm -f hello
.PHONY: clean
