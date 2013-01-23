#!/bin/bash

#
# Generate a HTML wrapper for your .swf file.
#
# author: Rafael Rinaldi (rafaelrinaldi.com)
# since: Aug 3, 2011
#

usage() {
	echo "
Available parameters:

[-f -file] .swf file to embed (only required parameter).
[-c -color] Content color (don't use '#' or '0x', just the hexadecimal code).
[-t -title] Page title (use quotes).
[-w -width] Content width ('100%' by default).
[-h -height] Content height ('100%' by default).
[-ac] Align center option. ('false' by default).
[-v -version] Flash player version ('10.0.0' by default).
[-sov] SWFObject version ('2.2' by default).
[--help] Script usage.
"
}

# Basic logging method.
trace() {
	echo "
[$0] $1
"
}

options=$@
arguments=($options)
index=0

# Default values.
f=""
c="FFFFFF"
t=""
w="100%"
h="100%"
ac="false"
v="10.0.0"
sov="2.2"

for argument in $options
	do
		index=`expr $index + 1`
		
		# Parsing parameters.
		case $argument in
			-f|-file) f=${arguments[index]} ;;
			-c|-color) c=${arguments[index]} ;;
			-t|-title) t=${arguments[index]} ;;
			-w|-width) w=${arguments[index]} ;;
			-h|-height) h=${arguments[index]} ;;
			-ac) ac=${arguments[index]} ;;
			-v|-version) v=${arguments[index]} ;;
			-sov) sov=${arguments[index]} ;;
			--help) usage ;;
		esac
	done

# File variables.
template="template/index.html"
html="index.html"
path=""

if [[ $@ == "" ]]; then
	usage
	exit
fi

if [[ $f == "" ]]; then
	trace "You must specify the .swf file!"
	exit
fi

# Getting file path.
path="${f%/*}"

# Getting file name.
f=`basename $f`

# If "-ac" parameter was already set.
case $ac in
	
	t|true|y|yes)
	
		# Disable align if width or height has the default value of "100%".
		if [ $w == "100%" -o $h == "100%" ]; then
			trace "To align you must set the dimensions of your .swf (width and height)!"
			exit;
		fi
		
		half_width=`expr $w / 2`
		half_height=`expr $h / 2`

		# CSS stack.
		m="position: absolute; left: 50%; top: 50%; margin-left: -${half_width}px; margin-top: -${half_height}px;"
	;;
esac

# Parsing template.
sed -e "s/{file}/$f/g" -e "s/{color}/$c/g" -e "s/{title}/$t/g" -e "s/{width}/$w/g" -e "s/{height}/$h/g" -e "s/{margin}/$m/g" -e "s/{version}/$v/g" -e "s/{sov}/$sov/g" < $template > "$path/$html"

trace "File successfully created at '$path/$html'!"