#! /bin/sh
#set -x

echo -e "\n REPLACE Chinese SPACE WITH ASCII SPACE\n"
sed  -i  s#　#\ #g  $*
#          ^  ^
#          |  |
#          | space
#      chinese space

exit $?
