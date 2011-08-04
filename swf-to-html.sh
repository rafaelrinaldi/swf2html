#!/bin/bash

#
# Generate a HTML wrapper for your SWF file.
#
# author: Rafael Rinaldi (rafaelrinaldi.com)
# since: Aug 3, 2011
# license: WTFPL

# Usage
usage() {
	echo "
Available parameters:

[-f -file] SWF file to embed (only required parameter).
[-c -color] Content color (don't use '#' or '0x', just the hexadecimal code).
[-t -title] Page title (use quotes).
[-w -width] Content width ('100%' by default).
[-h -height] Content height ('100%' by default).
[-v -version] Flash player version ('10.0.0' by default).
[-sov] SWFObject version ('2.2' by default).
[--help] Script usage.
"
}

# Basic logging method
trace() {
	echo "
[$0] $1
"
}

# Available options
options=$@

# Options converted to array
arguments=($options)

# Loop index
index=0

# Variables
f=""
c="FFFFFF"
t=""
w="100%"
h="100%"
v="10.0.0"
sov="2.2"

for argument in $options
	do
		# Incrementing loop index
		index=`expr $index + 1`
		
		# Getting parameters
		case $argument in
			-f|-file) f=${arguments[index]} ;;
			-c|-color) c=${arguments[index]} ;;
			-t|-title) t=${arguments[index]} ;;
			-w|-width) w=${arguments[index]} ;;
			-h|-height) h=${arguments[index]} ;;
			-v|-version) v=${arguments[index]} ;;
			-sov) sov=${arguments[index]} ;;
			--help) usage ;;
		esac
	done

# File variables
template="template/index.html"
html="index.html"
path=""

if [[ $@ == "" ]]; then
	usage
	exit
fi

if [[ $f == "" ]]; then
	trace "You must specify the SWF file!"
	exit
fi

# Getting file path
path="${f%/*}"

# Getting file name
f=`basename $f`

# Doing "the thing"
sed -e "s/{file}/$f/g" -e "s/{color}/$c/g" -e "s/{title}/$t/g" -e "s/{width}/$w/g" -e "s/{height}/$h/g" -e "s/{version}/$v/g" -e "s/{sov}/$sov/g" < $template > "$path/$html"

trace "File successfully created at '$path/$html'!"