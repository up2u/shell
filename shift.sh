#! /bin/sh

# input arg 1 2 3 
echo $@                 # 1 2 3 
echo $#

shift
echo $@                 # 2 3 

shift
echo $@                 # 3

shift
echo $#
exit $?
