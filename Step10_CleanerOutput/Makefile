
# You can add an @ sign first in a recipe line
# and the recipe will not be printed.
# This is useful for commands like echo.

# By assigning @ to the variable AT, you
# can prefix each recipe line with $(AT)
# and by default hide the recipe lines.
# Allowing you to print something less verbose.

# To debug the build you specify an empty AT
# on the command line.
# Normal build: make
# Debug build:  make AT=

# Or you can specify: make LOG=debug
ifeq ($(LOG),debug)
    AT:=
endif

# Or you can specify: make LOG=trace
ifeq ($(LOG),trace)
    AT:=
	MAKEFLAGS+=-d
endif

all: hello

%.o : %.c
	@echo "Compiling $@"
	$(AT)gcc -c $< -o $@

hello: hello.o there.o
	@echo "Linking $@"
	$(AT)gcc $^ -o $@

clean:
	@echo Cleaning...
	$(AT)rm -f hello *.o
	@echo done.

# You can override the AT variable just for this recipe.
clean2: AT=
clean2:
	@echo Cleaning2...
	$(AT)rm -f hello
	@echo done.

# You can place the phony declarations at the end of the Makefile.
.PHONY: all clean

# If AT has not been assigned before, assign @ to it.
AT?=@
MAKEFLAGS+=--no-builtin-rules
