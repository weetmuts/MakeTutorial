# A GNU Make tutorial: Learn how and why to use GNU make

The fundamental premise of make is to compare the last modified
timestamp of two files, the source and the target.

If the source has a more recent timestamp than the target, then the
target needs to be rebuilt.

The target is rebuilt by executing a recipe (aka a small piece of
code) that will update the target and this indirectly give it a
timestamp that is newer than the source. If make is re-executed
immediately afterwards, it should print

However the recipes are often executed by bash (even if you can change
the SHELL to for example python or any other scripting language), so
you really need a decent understand if bash to understand a Makefile.

With a well written makefile, the next time you run make, it will print, nothing to be done!

Build tools are often tailored for the uses cases their designers had
in mind.  Whenever someone says that build system so and so is better
than another build system, they are usually looking at built-in rules
tailored for their use case.

If you disable the built-in make rules, since they might confuse you
and your makefile, then make boils down to simple dependency tracking
and executing scripts to update targets.

This is a generic problem solver that can be adjusted for many situations.

# Lessons

## Step 01 the phases

Understand the two phases when executing a makefile.
First the makefile is executed imperatively from the first line to the last.
During this phase a dependency tree (with recipes) is built.

Secondly the dependency tree is evaluated to see if the desired target
(either specified on the command line, or the first in the makefile)
needs to be updated. Only then are the necessary recipes executed.

Read [Step01_TheDependencyTree/Makefile](Step01_TheDependencyTree/Makefile)

## Step 02 automatic variables

All make variables start with $. There are several automatic variables that can be
used in recipes. They are called automatic variables because they are automatically
assigned before the recipe is evaulated.

Read [Step02_AutomaticVariables/Makefile](Step02_AutomaticVariables/Makefile)

## Step 03 pattern rules

You can define a pattern rule to tell make that if it needs to construct
`foo.o` it should look for `foo.c`. Or to build `lib/foo.js` it should
transpile from `src/foo.ts`.

Read [Step03_PatternRules/Makefile](Step03_PatternRules/Makefile)

## Step 04 variables (lazy/evaluated variables and immediate/deferred locations)

Variables are evaluated either during the first phase (immediate
locations) or the second phase (deferred locations).  Also each
variable can be lazy or fully evaluated already.

If you understand this, then you have grasped the most complex part of
Make already!

Read [Step04_DollarsDollars/Makefile](Step04_DollarsDollars/Makefile)

## Step 05 Append to variables

You can append to variables. An append will preserve laziness and
preserve fully evaluated variables.

Read [Step05_AppendDollars/Makefile](Step05_AppendDollars/Makefile)
