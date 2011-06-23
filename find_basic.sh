#! /bin/sh
set -x

# rename , use exec
touch 1.txt
find . -name "1.txt" -exec mv {} {}.log \;
rm 1.txt.log

# ignore path ./.git
# perm

find . -path ./.git  -prune -o -perm  111     # match exectuable bit was set,and only exectuable bit was set
find . -path ./.git  -prune -o -perm /111     # match any exectuable bit was set 
find . -path ./.git  -prune -o -perm -111     # match all exectuable bit was set 

## must use -o  ?
#  type for ignore .git 
# 
find . -path ./.git -prune  -type f  -o -newer grep_basic.txt ! -newer basics.txt

exit $?
