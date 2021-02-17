
# SOURCES becomes a fully evaluated variable.
SOURCES:=hello.c
# When appending to a fully evaluated (non-recursive, non-lazy) variable
# the right hand side will be evaluated. EXTRA expands to the empty string here.
SOURCES+=there.c $(EXTRA)

# CFLAGS becomes a lazy (recursive) variable.
CFLAGS=-Wall
CFLAGS+=$(EXTRA) -g

# Print SOURCES="hello.c there.c " CFLAGS="-Wall  -g"
$(info FIRST SOURCE="$(SOURCES)" CFLAGS="$(CFLAGS)")

hello: $(SOURCES)
#   Within the recipe (during the second phase, aka deferred location)
#   SOURCES expand to "hello.c there.c " and CFLAGS expand to "-Wall -Waddress -g"
	gcc $(SOURCES) $(CFLAGS) -o $@

EXTRA=-Waddress

# The fully evaluated SOURCES is still printed as "hello.c there.c"
# since the setting of EXTRA cannot change its value.
# However the CFLAGS is lazy and will recursively expand to include
# the current setting of EXTRA. Thus it will print as CFLAGS="-Wall -Waddress -g"
$(info SECOND SOURCES="$(SOURCES)" CFLAGS="$(CFLAGS)")

# The values of SOURCES, CFLAGS and EXTRA are now carried into the deferred evaluations inside the recipes.

clean:
	rm -f hello
.PHONY: clean
