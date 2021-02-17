
# 1) immediate and deferred locations
# 2) the variable itself is already evaluated or its lazy.

# This is an immediate location, but the variable is lazily assigned.
SOURCES=hello.c $(EXTRA)

# This is an immediate location, the variable is expanded into "hello.c "
$(info LAZY1=$(SOURCES))

# The dependency rule is actually broken here, since the dependency
# SOURCES evaluates to just "hello.c "
hello: $(SOURCES)
#   The recipe rule is in a deferred location so it will be evaulated
#   after the first imperative makefile phase is completed. Therefore
#   SOURCES evaluate to "hello.c there.c"
	gcc $(SOURCES) $(CFLAGS) -o $@

# This is an immediate location, the varible is lazily assigned.
EXTRA=there.c

# This is an immediate location, the variable SOURCES is now expanded into "hello.c there.c"
$(info LAZY2=$(SOURCES))

# The current value of SOURCES is carried into the deferred evaluations inside the recipes.

clean:
	rm -f hello
.PHONY: clean
