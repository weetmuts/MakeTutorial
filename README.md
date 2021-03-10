# A GNU Make tutorial: Learn how and why to use GNU make

The fundamental premise of make is to compare the last modified
timestamp of two files, the source and the target.

If the source has a more recent timestamp than the target, then the
target needs to be rebuilt.

The target is rebuilt by executing a recipe (aka a small piece of
code) that will update the target and this indirectly give it a
timestamp that is newer than the source.

The recipes are often executed by bash (even if you can change the
SHELL to for example python or any other scripting language), so you
will need a good understanding of bash as well, to fully understand a
Makefile.

Since the recipes are shell scripts, the build process is really
independent of the target language. Though languages with a 1-1
correlation between source and object files are easier, it is easy to
handle Java compilations as well, where the output is more
unpredictable.

Make files do not need to compile either, they can execute cli
instructions to setup an AWS cloud or upload your newly built android
app into your phone.

Build tools are often tailored for the uses cases their designers had
in mind.  Whenever someone says that build system so and so is better
than another build system, they are usually looking at built-in rules
tailored for their use case.

Makefiles often disable the built-in make rules to avoid confusion.
(And you really do not need the implicit fortran rules any more, they were
hip many decades ago.)

As long as there is a dependency chain of actions that should be
executed to achive a certain goal, then make can be used.  Thus make
boils down to dependency tracking and executing scripts to update
targets.  This is a generic problem solver that can be adjusted for
many situations.

# Lessons

## Step 01 the phases

Understand the two phases when executing a makefile.
First the makefile is executed imperatively from the first line to the last.
During this phase a dependency tree (with recipes) is built.

Secondly the dependency tree is evaluated to see if the desired target
(either specified on the command line, or the first in the makefile)
needs to be updated. Only then are the necessary recipes executed.

If you run make twice in a row, without changing any sources, then
a well written makefile will do nothing the second time! Everything is
up to date.

Read [Step01_TheDependencyTree/Makefile](Step01_TheDependencyTree/Makefile)

## Step 02 variables (lazy/evaluated variables and immediate/deferred locations)

Variables are evaluated either during the first phase (immediate
locations) or the second phase (deferred locations).  Also each
variable can be lazy or fully evaluated already.

If you understand this, then you have grasped the most complex part of
Make already! Its downhill from now. Ok a lot of details, but still downhill. :smile:

Read [Step02_Variables/Makefile](Step02_Variables/Makefile)

## Step 03 automatic variables

There are several automatic variables ($@ $< $^ and more) that can be
used in recipes. They are called automatic variables because they are
automatically assigned before the recipe is evaulated.

Read [Step03_AutomaticVariables/Makefile](Step03_AutomaticVariables/Makefile)

## Step 04 pattern rules

You can define a pattern rule to tell make that if it needs to construct
`foo.o` it should look for `foo.c` and compile it. Another example could be
to generate `lib/foo.js` by transpiling `src/foo.ts`.

Read [Step04_PatternRules/Makefile](Step04_PatternRules/Makefile)

## Step 05 Append to variables

You can append to variables. An append will preserve laziness and
preserve fully evaluated variables.

Read [Step05_AppendToVariables/Makefile](Step05_AppendToVariables/Makefile)

## Step 06 Create variable names by expanding other variables.

Variable names can be constructed through normal variable evaluation.

Read [Step06_DynamicVariableNames/Makefile](Step06_DynamicVariableNames/Makefile)

## Step 07 Macro calls

A variable can be instatiated using the $(call VAR,arg1,arg2,arg3...)

You can define variables with multiline content using define X ... endef

You can eval the expanded variable $(eval $(call VAR,x,y)) to have
a macro create a new rule.

Read [Step07_MacroCalls/Makefile](Step07_MacroCalls/Makefile)

## Step 08 Builtin make functions

There are many builting GNU make functions that are very useful.

Read [Step08_BuiltinFunctions/Makefile](Step08_BuiltinFunctions/Makefile)

## Step 09 As a curiosity, you can replace the shell command and the recipe marker.

You can for example use python instead of bash. But please, do not use this,
unless you have a very very very good reason for doing so.

Read [Step09_DifferentShell/Makefile](Step09_DifferentShell/Makefile)

## Step 10 Cleaner output from the makefile, add LOG level debug and trace.

When running just "make" the output should not be overly detailed, preferably just
printing what is happening, not exactly how! But add "make LOG=debug"
to see every build command or add "make LOG=trace" for crazy amount of info.

Read [Step10_CleanerOutput/Makefile](Step10_CleanerOutput/Makefile)

## Step 11 Include makefiles to re-use code for building.

You can easily include other makefiles. However do not put global targets
like all: clean: build: etc inside the included makefiles since
this will make it hard to figure out how the build works.

Read [Step11_IncludeMakefiles/Makefile](Step11_IncludeMakefiles/Makefile)
