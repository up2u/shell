#! /bin/bash

# test $(),${}

HELP()
{
	echo -e "\n\$() and `` both used to command substitution"
	echo -e "\${} used to variable substitution"
	echo -e "\$(()) used to integer arithmetic like: + - * / % & | ^ !"
	exit $?	
}

if test "$1" = "--help" || test  "$1" = "-h"
then
	HELP
	exit $?
fi

# show the usage.
echo -e "\nusage: ./parenthese_brace_with_$.sh --help | -h\n"

# test $()
currentdir="$(pwd)"
echo "current dir =${currentdir}"

# test {}
abspath="/backup/AndeSoft/MCUProject/Test/Intg/Makefile"
echo "abs path=${abspath}"

# test length
length=${#abspath}
echo "length=${length}"

# test basename
basename=${abspath##*/}
echo "basename=${basename}"

# test directory
directory=${abspath%/*}
echo "directory=${directory}"

# directory string substitution
# replace backup with New.
newpath=${abspath/backup/New}
echo "newpath=${newpath}"

# replace multiple contain "/", then /backup/AndeSoft/ will be replace by /New 
newpath=${abspath/backup\/AndeSoft/New}
echo "newpath=${newpath}"

# array with ()

A=(d e345678 f gh)
echo "the 1st elem =${A[1]}"

echo "the total num of elements=${#A[@]}"  # equ 4

echo "the 1st element length is =${#A[1]}"  # equ 7

# test $(()) NOTE: the operand can use ${a}
a=5; b=7; c=2
echo "a=${a}, b=${b},c=${c}"
d=$((a+b)); d2=$(($a+$b))  # use ${a}
echo "a+b =${d}; d2=${d2}"
e=$((b&c))
echo "b AND c =${e}"
f=$((a|c))
echo "a OR c =${f}"
g=$(( (a+b)/c ))
echo "(a+b)/c =${g}"

# other operation, (()) with for
echo "other operation: (()) with for loop"

for ((i=0; i<5; i++))
do
	echo "now i is ${i}"
done\

echo "with while loop"
m=5
while [ "${m}" -ge "0" ] ; do
	echo "now m is ${m}"
	((m--))
done

unset HELP
exit $?
