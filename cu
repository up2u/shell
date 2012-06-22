#! /bin/sh
set -x

# this will refresh user added item like .S .s Makefile... etc
#cscope-indexer -r
cscope -q -b -i cscope.files -f cscope.out
global -u

exit $?
