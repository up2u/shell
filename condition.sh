#! /bin/sh
# input ./sh  1 2 

## for logical AND
#	if [ "$1" -eq "1" -a "$2" -eq "2" ]; then
	if [ "$1" -eq "1" ] && [ "$2" -eq "2" ]; then     # with same effect
		echo yes
	else
		echo no
	fi

## for logic NOT
	if test ! -z "$1"; then
		echo has args
	fi

exit $?
