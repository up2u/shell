#! /bin/sh

#find the file extension of kernel directory

echo "cd to your kernel directory"

find . -type f | grep -v Documentation > /tmp/1
awk -F'/' '{print $NF}' /tmp/1 > /tmp/2
awk -F'.' '{print $NF}' /tmp/2 > /tmp/3
sort /tmp/3 > /tmp/4
sort -u /tmp/4 > /tmp/5

exit $?
