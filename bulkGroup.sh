#!/bin/bash

shopt -s expand_aliases
alias gam='python /home/hilary/gam/gam.py'

if [ ! "$1" ]; then
	echo "Usage: ${0##*\/} group list"
	echo
	echo "Takes lists of email addresses from a .csv file"
	echo "and adds them to the specified group with GAM,"
	echo "the Google Apps Manager, and a pinch of magic."
	echo

	exit 2
fi

group="$1"
shift

while test "$1" != "" ; do
	while read email ; do
		gam update group "$group" add member "$email"
	done < "$1"

	shift
done

exit 0
