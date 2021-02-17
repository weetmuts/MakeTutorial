# My recommendation is to use := to create non-recursive variables
# when you can. These are much easier to debug.
SOURCES:=hello.c there.c

# Use lazy assigns when you know the variable will be adjusted retroactively.
# This is of course more difficult to debug, but sometimes it is useful.
CFLAGS=-O1 $(EXTRA_CFLAGS)

# A variable name can be composed of other variable names!

INFO=$($(AA)$(BB))

# AA and BB can be assigned with := or = it does not matter here.
AA:=SOUR
BB:=CES

# $(INFO) expands to $($(AA)$(BB)) which expands to $(SOURCES) which expande to "hello.c there.c"
$(info INFO="$(INFO)")

# You can use this to tweak which variables are used for a build
# without using if statements (which will be explained in a later lesson).
# Lets default to an x86 build. The ?= will only assign a value to CPU
# if the CPU variable has not yet been set to any value (including the empty string).
CPU?=x86

CFLAGS.x86=-g
CFLAGS.arm=-arm-stuff
CFLAGS.riscv=-riscv-stuff

CFLAGS+=$(CFLAGS.$(CPU))

EXTRA_CFLAGS=-Os

# Just running "make" will print CFLAGS="-O1 -Os -g"
# Running "make CPU=arm" will print CFLAGS="-O1 -Os -arm-stuff"
# Running "make CPU=riscv" will print CFLAGS="-O1 -Os -riscv-stuff"
$(info CFLAGS="$(CFLAGS)")

hello: $(SOURCES)
	gcc $^ $(CFLAGS) -o $@

clean:
	rm -f hello
.PHONY: clean
