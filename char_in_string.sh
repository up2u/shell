#! /bin/bash

#calculate the number of every char in an long string.
echo "calculate the number of every char in an long string."
echo "http://bbs.chinaunix.net/thread-452942-1-1.html" | awk '{for(i=1;i<=length($0);i++) ++S[substr($0,i,1)] } {for(t in S) print t"="S[t]}'

#multiple lines

echo -e "aabde\na\na" | awk '{for(i=1;i<=length($0);i++) ++S[substr($0,i,1)]} END{for(t in S) print t"="S[t]}'

exit $?
