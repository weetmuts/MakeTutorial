# There are many builtin functions:
# https://www.gnu.org/software/make/manual/html_node/Functions.html

all: hello

# Variables that perform shell calls should always be simple aka immediate (ie not recursive, not lazy)
# Otherwise the shell call will be invoked every time the variable is used!
SOURCES:=$(shell find . -name "*.c")

# Count the number of sources
NUM_SOURCES:=$(words $(SOURCES))

# Remove the directory, ie keep only the filename, then remove the .c
SOURCES_INFO:=$(subst .c,,$(notdir $(SOURCES)))

hello : $(SOURCES)
	@echo Building $(NUM_SOURCES) files: $(SOURCES_INFO)
	gcc $(SOURCES) -o $@

clean:
	@rm -f hello

.PHONY: clean
MAKEFLAGS += --no-builtin-rules
