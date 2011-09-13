###################################################Start
#!/bin/bash
#use ./addallusercomputer.sh username group ID
set -x


othercomputerlist='moon hydra leo mars orion pluto neptune lyra earth saturn gemini'
#check run this shell is or not use root
	if [ $(whoami) != "root" ]; then
		echo "You have no permission to run $0 as non-root user."
		exit 1
	fi

for othercomputer in $othercomputerlist
do
	ssh $othercomputer  "grep $1 /etc/passwd && echo this computer have been added this user\
			 || /usr/sbin/useradd -c $1 -g $2 -G andeshz -d /andesHZ/users/$1 -m $1 -u $3\
		    && echo $1|passwd --stdin $1 && echo Add user $1 successful in pc $othercomputer && exit"
done


exit 0
################################################################End

