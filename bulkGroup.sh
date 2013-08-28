#!/bin/bash

# Bulk update email groups
# Written by Hilary B. Bisenieks <https://github.com/HBBisenieks> (c)2013
# Provided under the MIT License
# No warranty is provided or implied

alias gam='python /path/to/gam'

if [ ! "$1" ]; then
	echo "Usage: ${0##*\/} list group"
	echo
	echo "Takes a list of email addresses from a .csv file"
	echo "and adds them to the specified group with GAM,"
	echo "the Google Apps Manager, and a pinch of magic."
	echo

	exit 2
fi

while read email ; do
	gam update group "$2" add member "$email"
done < "$1"

exit 0
