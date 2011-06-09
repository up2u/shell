#! /bin/sh
#set -x

# input arg like: 1  2 3

# $*
# result:
# 1 
# 2 
# 3 
for arg in $*
do	
	echo $arg
done

# result:
# 1 2 3
for arg in "$*"
do	
	echo $arg
done

# $@
# result:
# 1 
# 2 
# 3 
for arg in $@
do	
	echo $arg
done

# result:
# 1 
# 2 
# 3
for arg in "$@"
do	
	echo $arg
done

exit $?
