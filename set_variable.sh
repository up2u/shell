#! /bin/sh

# if COLUMNS set do nothing,else set it as 80
[ -z "${COLUMNS:-}" ] && COLUMNS=80
echo $COLUMNS

exit $?
