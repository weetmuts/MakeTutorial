
all: test hello

# A macro call is just a normal lazy variable.
# If not lazy, then the arguments $1 $2 etc will not be inserted!
LOG=echo "msg: $1 building:$@ pwd:$$PWD"

# The LOG call in the test rule, will expand during the second phase,
# to: echo "msg: Creating test... building:test pwd:$PWD" "GURKA"
# Thus the shell will print the current working directory for $PWD
test: test.source
	@$(call LOG,Creating test...)
	@cp test.source test

# Create a variable with a newline.
define NL


endef

# Define GENERATE_RULE as a lazy variable
define GENERATE_RULE
$1 : $2
	@echo "Running generated rule for $1"
	@$(call LOG,Creating hello...)
	@$3
endef

# Print the content of the macro call on stdout when make is running the first(imperative) phase.
# This happens both when running "make clean" and just "make"
# Note the problem with $PWD which works in the test rule above since there, the LOG macro is expanded only once.
# But here the LOG macro content is expanded twice, the $PWD will be expanded by make into just WD
# since no $P is define.
$(info GENERATED_RULE_START$(NL)$(call GENERATE_RULE,hello,hello.c there.c,gcc $$^ $$(CFLAGS) -o $$@)$(NL)GENERATED_RULE_END)

# Eval the content as if you had type the rule into the Makefile for the imperative phase to find.
$(eval $(call GENERATE_RULE,hello,hello.c there.c,gcc $$^ $$(CFLAGS) -o $$@))

# We now have a rule to build hello constructed in the tree of dependencies!

clean:
	@$(call LOG,Cleaning...)
	@rm -f hello test

# Just to trick you, add a lazy suffix here....
# Not a good coding practise!
LOG+="GURKA"

.PHONY: clean
MAKEFLAGS += --no-builtin-rules
