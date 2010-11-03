#! /bin/bash
#set -x

#usage : ./parenthese_brace.sh (-h|--help) print help

HELP()
{
	echo "test the ( { ,parenthese & brace"
	echo "from bbs: () means nested sub-shell,won't change current env"
	echo "          {} measn non-named command group"
}

if test "$1" = "--help" || test "$1" = "-h"
then
	HELP
	exit $?
fi

# test ()
echo -e "\ntest ()\n"
echo "() won't changed the current env"
a=123
echo "current a=$a"
(a=4; echo "int the parenthese a=$a")
echo "after parenthese, now a=$a"

# test {}
echo -e "\ntest {}\n"
echo -e "{} will changed the curren env"
b=999
echo "current b=$b"
{
	b=5; echo "in the brace b=$b"
}
echo "after brace, now b=$b"
echo "show that in the brace b was changed"

#PS: put the offen used command to the function,and put them in /etc/rc.d/init.d/functions
#    then it will be used as global.
#like: smb can be used global shell

# unset the function
unset HELP
exit $?
