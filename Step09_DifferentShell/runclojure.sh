#!/bin/bash

shift
echo "$@" > tmp.clj
clojure tmp.clj
