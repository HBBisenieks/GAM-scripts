#!/bin/bash

# Updates email addresses in bulk
# Written by Hilary B. Bisenieks <https://github.com/HBBisenieks> (c)2013
# Provided under the MIT License
# No warranty is provided or implied

shopt -s expand_aliases
alias gam='python /path/to/gam'

if [ ! "$1"] ; then
	echo "Usage: ${0##*\/} list"
	echo
	echo "Takes a csv as argument in the form [old username] [new username]"
	echo "and updates that user in GAM."
	echo
	exit 2
fi

while read first last old_e new_e ; do
	gam update user "$old_e" username "$new_e"
done < "$1"
