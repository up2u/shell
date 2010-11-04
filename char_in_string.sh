#! /bin/bash

#calculate the number of every char in an long string.
echo "calculate the number of every char in an long string."
echo "http://bbs.chinaunix.net/thread-452942-1-1.html" | awk '{for(i=1;i<=length($0);i++) ++S[substr($0,i,1)] } {for(t in S) print t"="S[t]}'

#multiple lines
echo -e "aabde\na\na" | awk '{for(i=1;i<=length($0);i++) ++S[substr($0,i,1)]} END{for(t in S) print t"="S[t]}'

# now calculate the word number
# but pubblezd with the following problems

echo "will show 1, this is right."
echo "hello" | awk 'BEGIN{FS="hello"}{a+=(NF-1)}END{print a}'

echo -e "\nbut this show 0"
echo "hello" | awk '     {FS="hello"}{a+=(NF-1)}END{print a}'

exit $?
