#! /bin/sh

echo -e "1 \n 2 \n a \n b \n jlj\n" | awk 'BEGIN {print "this head"} {print $1}  END{print "this is tail"}' 

exit $?
