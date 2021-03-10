
all: bash python pythonn node ruby clojure

bash: hello.txt
	@echo "hello from bash"

# Set the SHELL variable for this rule only.
python: SHELL=python3
python: hello.txt
	@print("hello from python3");

node: SHELL=./runnode.sh
node: hello.txt
	@console.log("hello from node");

ruby: SHELL=./runruby.sh
ruby: hello.txt
	@puts "hello from ruby"

clojure: SHELL=./runclojure.sh
clojure: hello.txt
	@(println "hello from clojure")

# You can even change the recipe prefix if you really do not want a TAB.
.RECIPEPREFIX=>
pythonn: SHELL=python3
pythonn: hello.txt
>@print("hello again from python3");

.PHONY: all bash python node ruby clojure
