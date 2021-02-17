
# Use := assigns where you can.
SOURCES:=hello.c there.c

# Use lazy assigns when you now the variable will be adjusted retroactively.
# This is of course more difficult to debug, but sometimes it is useful.
CFLAGS=-O1 $(EXTRA_CFLAGS)

# A variable name can be composed of other variable names!

INFO=$($(AA)$(BB))
# AA and BB can be assigned with := or = it does not matter here.
AA:=SOUR
BB:=CES
# However if you later do += on AA the behaviour will depend on
# whether the AA is fully evaluated or lazy. Tricky!

# $(INFO) expands to $($(AA)$(BB)) which expands to $(SOURCES) which expande to "hello.c there.c"
$(info INFO="$(INFO)")

# You can use this to tweak which variables are used for a build
# without using if statements (which will be explained in a later version).
# Lets default to an x86 build.
CPU?=x86

CFLAGS.x86=-g
CFLAGS.arm=-arm-stuff
CFLAGS.riscv=-riscv-stuff

CFLAGS+=$(CFLAGS.$(CPU))

EXTRA_CFLAGS=-Os

# Just running "make" will print CFLAGS="-O1 --extras -g"
# Running "make CPU=arm" will print CFLAGS="-O1 --extras -arm-stuff"
# Running "make CPU=riscv" will print CFLAGS="-O1 --extras -riscv-stuff"
$(info CFLAGS="$(CFLAGS)")

hello: $(SOURCES)
	gcc $^ $(CFLAGS) -o $@

clean:
	rm -f hello
.PHONY: clean
