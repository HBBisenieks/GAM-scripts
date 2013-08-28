#!/bin/bash

# bulk updates email addresses

alias gam='python /path/to/gam'

if [ ! "$1"] ; then
	echo "	Takes a csv as argument in the form [old username] [new username]"
	echo "	and updates that user in GAM."
	exit 2
fi

while read first last old_e new_e ; do
	gam update user "$old_e" username "$new_e"
done < "$1"
