#! /bin/bash

# usage  ./fun aa bb cc 

# the difference between: $@ , $*.
# when has multiple paraments in the double quote "", 
#	$* : paraments number will be consider only one.
#   $@ : paraments number is correct.		

my_fun() {
   echo "$#"
}

echo 'the number of parameter in "$@" is ' $(my_fun "$@") 	# number =3
echo 'the number of parameter in  $*  is ' $(my_fun $*)		# 		 =3
echo 'the number of parameter in "$*" is ' $(my_fun "$*")	#        =1


exit $?
