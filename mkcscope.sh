#!/bin/bash

pwd=$PWD

# Remove pre-exsiting cscope.files

[ -f "./cscope.files" ] && rm cscope.files

# Find target source files and make cscope.files
find ./ \( -name '*.c' -o -name '*.cpp' -o \
	   -name '*.C' -o -name '*.CPP' -o \
	   -name '*.h' -o -name '*.hpp' -o \
	   -name '*.H' -o -name '*.HPP' -o \
	   -name '*.java' -o -name '*.JAVA' -o \
	   -name '*.s' -o -name '*.S' \) \
	   -print > cscope.files

# Output cscope.out
cscope -R -b -u -i cscope.files
