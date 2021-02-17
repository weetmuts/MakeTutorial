
# A make variable begins with a $ sign.
# $x is a variable $(x) is the same variable.
# $xxx is the variable $x followed by to x:s
# This you why you often write $(x)xx to reduce confusion.
# For multi character variables $(longer) the parentheses are required.

# To fully understand how variables are expanded you have to know the:
# 1) immediate(aka first phase) and deferred(aka second phase aka recipes) locations
# 2) whether the variable itself is already evaluated or if its lazy.

# This is an immediate location, but the variable is lazily assigned,
# ie EXTRA part will be expanded later.
SOURCES=hello.c $(EXTRA)

# This is an immediate location, but the variable is full evaluated,
# ie the EXTRA part is evaluated to the empty string.
OTHERS:=hello.c $(EXTRA)

# This is an immediate location, and the both variables expand to "hello.c "
$(info FIRST SOURCES=$(SOURCES) OTHERS=$(OTHERS))

# A dependency rule's target and dependencies are immediate locations.
# Since SOURCES evaluates to just "hello.c " here, the dependency
# is actually somewhat broken since it does not include there.c
hello: $(SOURCES)
#   The recipe rule body is the deferred location so it will be evaulated
#   after the first imperative makefile phase is completed. Therefore
#   SOURCES will eventually evaluate to "hello.c there.c"
	gcc $(SOURCES) -o hello
#   To confirm that the dependencies are the somewhat broken, we
#   can either do "make -p" and see the "hello: hello.c" rule,
#   or we can explicitly print all the dependencies $^
#   This will echo just hello.c
	@echo "Recipe ran with the dependencies: $^"

# This is an immediate location, the varible is lazily assigned.
EXTRA=there.c

# This is an immediate location, the variable SOURCES is now expanded
# into "hello.c there.c" but OTHERS is an not a lazy variable and will
# evaluate to just "hello.c " as before.
$(info SECOND SOURCES=$(SOURCES) OTHERS=$(OTHERS))

# The current value of SOURCES is carried into the deferred evaluations inside the recipes.

clean:
	rm -f hello
.PHONY: clean
