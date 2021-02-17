
# SOURCES becomes a fully evaluated variable.
SOURCES:=hello.c
# When appending to a fully evaluated (non-recursive, non-lazy) variable
# the right hand side will be evaulated. EXTRA expandes to the empty string here.
SOURCES+=there.c $(EXTRA)

# CFLAGS becaomes a laze variable.
CFLAGS=-Wall

# Print "hello.c there.c " and ""
$(info FIRST SOURCE="$(SOURCES)" CFLAGS="$(CFLAGS)")

hello: $(SOURCES)
#   Within the recipe (aka the second phase aka deferred location)
#   Use the non-lazy SOURCES.
#   Use the lazy CFLAGS as it was finally defined at the end of the first phase.
#   This will include the late setting of the EXTRA value.
	gcc $(SOURCES) $(CFLAGS) -o $@

CFLAGS+=$(EXTRA) -g
EXTRA=-Waddress

# The fully evaluated SOURCES is still printed as "hello.c there.c"
# since the setting of EXTRA cannot change its value.
# However the CFLAGS is lazy and will recursively expand to include
# the current setting of EXTRA. This it will print as "-Wall -Waddress -g"
$(info SECOND SOURCE="$(SOURCES)" CFLAGS="$(CFLAGS)")

clean:
	rm -f hello
.PHONY: clean
