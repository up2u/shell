#! /bin/sh
# input ./sh  1 2 

## use backslash with conditions !!!
# [ -f /var/lock/subsys/$subsys -o -f /var/lock/subsys/$subsys.init ] \ 
#		|| continue

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
## file /tmp/11111 not exist, so [ ! -f /tmp/11111 ] is RIGHT, so won't echo hello
[ ! -f /tmp/11111 ] || echo "hello"

#the order be operated is from left to right !!!
## will echo 222 , 3333 4444
[ ! -f /tmp/11111 ] || echo "hello" && echo "222" && echo "33333" && echo "444444"


exit $?
