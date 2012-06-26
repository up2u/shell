#! /bin/sh
set -x

more-cscope-files
global -u
#gtags -f cscope.files

exit $?
