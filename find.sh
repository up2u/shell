#! /bin/bash
set -x

echo "find -name with -path and -prune"

#if exist, delete them, else
#create 3 temporary directory, touch a temporary file for every directory
if test -d t1 || test -d t2 || test -d t3
then
	rm -fr t{1,2,3}
	mkdir t{1,2,3}
	touch t{1,2,3}/1.tmp
fi

#NOTE: 
#    1:the path must use the same mode: absolute path or relative path
#	   else won't work
# 	 2:the path mustn't be ended with "/",else won't work

# 1:relative path, result show as relative path
echo "1:relative path, result show as relative path"
find . \( -path ./t1 -o -path ./t2 \) -prune -o -name "1.tmp" -print

# 2: absolute path , result show as absolute path
echo "2: absolute path , result show as absolute path"
find `pwd` \( -path `pwd`/t1 -o -path `pwd`/t2 \) -prune -o -name "1.tmp" -print
exit $?
