#!/usr/bin/awk -f

# Bulk update email groups
# Written by Hilary B. Bisenieks <https://github.com/HBBisenieks> (c)2013
# Provided under the MIT License
# No warranty is provided or implied

# Takes as input a .csv file with each row containing
# a username followed by any number of email groups to
# which they should be added as a member.

BEGIN {
	FS=",";
}
{
	for (i=2; i<=NF; i++)
	{
		system("python /path/to/gam.py update group " $i " add member " $1);
	}
}
