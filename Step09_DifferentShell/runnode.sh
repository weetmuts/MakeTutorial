#!/bin/bash

shift
echo "$@" > tmp.js
node tmp.js
