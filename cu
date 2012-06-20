#! /bin/sh
set -x

cscope-indexer -r
global -u

exit $?
