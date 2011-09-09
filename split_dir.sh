#! /bin/sh

#set -x
#file_list like this:
# ./11
# ./11/a
# ./11/b
# ./11/c
# ./22
# ./22/b
# ./22/c/d
# ./22/e/f/g

# and the output
# ./11
# ./22

## this is used for archived a file through find command, for avoiding archived a 
#file multile times , because it has directory and file at same time.

 
file_list=$1

pre_line=""; 

if test -f /tmp/uniq_dir_file.txt; 
then
	rm -f /tmp/uniq_dir_file.txt
fi

for line in `cat $file_list`; 
do 
	pre_dir=$( echo $pre_line | awk -F/ '{print $2}');  
	dir=$(echo $line | awk -F/ '{print $2}'); 
	if test "x$pre_dir" != "x$dir" ; then 
		echo $line >> /tmpuniq_dir_file.txt 
		pre_line=$line ; 
	fi;  
done

exit $?
