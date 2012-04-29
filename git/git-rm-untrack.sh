#! /bin/sh

# match pattern : stack
git st  | sed -n '/stack/p' | sed 's/#//' | while read line; do rm $line  ;done

exit $?
