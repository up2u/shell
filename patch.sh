#! /bin/sh

#this file show how to sync configure file you self to the main configure file
set -x

## 1  now main configure file
## 2o original main configure file
## 2  your configure file

# main configure file
echo -e "1\n2\n3" > 1
# $ cat 1
# 1
# 2
# 3

## Now their status:
# your configure file and original main configure, are copied from main.conf
# and do change now, it is:
# $ cat 2
# //1
# 2
# //3

# $ cat 2o
# 1
# 2
# 3

# then main.conf changed
# $ cat 1
# 1
# a
# 2
# b
# c
# 3
# d

# ?? How to sync your configure file with main.conf and store your own configure line?
# use patch command:

# Notice the order of them
# the 2nd mean the current status, should placed after original status.
# diff 2o 1 > /tmp/1
# patch -p0 2 /tmp/

exit $?
