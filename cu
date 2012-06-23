#! /bin/sh
set -x

more-cscope-files -s S s -p Makefile makefile
global -u

exit $?
