#!/bin/bash

shift
echo "$@" > tmp.rb
ruby tmp.rb
