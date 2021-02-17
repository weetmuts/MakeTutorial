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

## Step 01

Two phases: first the imperative phase builds a dependency tree,
second the tree is evaluated and recipes are executed if there is a need.

## Step 02

Make variables start with $, and there automatic variables that can be
used in recipes.

## Step 03

Pattern rules are used to automatically generate foo.o from foo.c

## Step 04

Variables are evaluated in immediate locations or deferred locations.
Each variable can be lazy or already evaluated.
