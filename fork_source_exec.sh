#! /bin/bash

echo "now test the different between: fork,source,exec"
echo "from the bbs, it tell that:"
echo "1): fork :run under the parent process, follow the parent's enviroment variable,
	  and won't change the parent's enviroment variable"
echo "2): source : run on the current shell, but not the sub_shell of the current shell,
	  if it change the enviroment variable, will affect the current shell"
echo "3): exec: run on the current shell (share the same process !!), will replace the 
	  original shell won't run again, this's the mainly difference"


# test them use a variable A
A=B
export A

# process id
echo -e "\nA=$A,the current process id:$$"

# 
case $1 in 
	source)
		echo "using source"
		source ./for_fork_source_exec.sh
		;;
	exec)
		echo "using exec"
		exec ./for_fork_source_exec.sh		
		;;
	fork)
		echo "using default: fork"
			./for_fork_source_exec.sh
		;;
esac

if test "$1" == "fork" ; then
	echo -e "\nA=$A,it's fork, won't changed the parent env,the current process id:$$\n"
elif test "$1" == "source" ; then
	echo -e "\nA=$A,it's source,the called shell has the same process id as parent, 
	parent env be changed by the called shell,the current process id:$$\n"
else 
	echo "it won't run here"
fi

exit $?
