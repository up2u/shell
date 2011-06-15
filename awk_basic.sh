#! /bin/sh

echo -e "1 \n 2 \n a \n b \n jlj\n" | awk 'BEGIN {print "this head"} {print $1}  END{print "this is tail"}' 

# print line number fullfil the condions (without ; between condtion !!!)
echo -e "1 4 \n 6 8 \n 78 56\n9 1" | awk '$1<10{x++} $2>5{y++} END{print x, y}'

exit $?
