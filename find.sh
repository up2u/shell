#! /bin/bash
set -x

echo "find -name with -path and -prune"

#if not exist
#create 3 temporary directory
#touch a temporary file for every directory
if ! test -d t{1,2,3}
then
	mkdir t{1,2,3}
	touch t{1,2,3}/1.tmp
fi

#find, not work -prune , puzzled ?!
find . \( -path t1/ -o -path t2/ \) -prune -o -name "1.tmp" -print

exit $?
