
# Include support for logging.
include make/Log.mk

# You can now do:
# make
# make LOG=verbose
# make LOG=debug
# make LOG=trace

# Avoid puttin global targets in included make files!
# Since such a code-style will make it very hard to unravel how a build works.
# Instead put global targets like all: clean: etc in this top level Makefile
# They can then depend on internal targets from the included files.

# Here we include the ListSymbols macro to create an appropriate rule to
# print the symbols from a compiled object file.
include make/ListSymbols.mk

# Create a list of the object files from the source files.
OBJECT_FILES:=$(subst .c,.o,$(wildcard *.c))
# We have now calculated OBJECT_FILES to be "hello.o there.o"

all: hello symbols_listing.txt
	@$(call LOG_INFO_FRAMED,"Build completed")

hello: $(OBJECT_FILES)
	@$(call LOG_INFO,"Linking $@")
	@$(call LOG_VERBOSE,"from objects $^")
	@$(call LOG_DEBUG,"using linker $$(which gcc)")
	$(AT)gcc $^ -g -o $@

# Use the macro ListSymbols to create the target symbols_listing.txt
# which all can depend upon above.
$(eval $(call ListSymbols,symbols_listing.txt,$(OBJECT_FILES)))

# A rule to create the o files from a source file.
%.o : %.c
	@$(call LOG_INFO,"Compiling $@")
	@$(call LOG_VERBOSE,"from source $<")
	@$(call LOG_DEBUG,"using compiler $$(which gcc)")
	$(AT)gcc -c -g $< -o $@

clean:
	@$(call LOG_INFO,"Cleaning...")
	@$(call LOG_VERBOSE,"files $(wildcard *.o)")
	$(AT)rm -f hello *.o symbols_listing.txt

.PHONY: all clean
