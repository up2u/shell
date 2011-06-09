#! /bin/sh

set -x 

# read : read a line and assigned to a variable
# if change the IFS to : ,and put a few varibale in the command 
# it will assigned the variable with value seperated by : 

IFS=:
while read name passwd uid gid fullname
do
	echo $name $passwd $uid $gid $fullname
done < /etc/passwd

exit $?
