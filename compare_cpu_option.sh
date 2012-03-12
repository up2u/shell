#! /bin/sh

#usage: ./thisshellscrpt  cpuoption1.log cpuoption2.log
#cpuoption1.log cpuoption2.log only contain the cpu options
#like: --config-2det 0 --config-amipf 0 
#so can use '--' as field-separator

awk -F'--' '{for(i=1; i<=NF; i++) printf $i"\n" }' ${1} > ${1}.line
awk -F'--' '{for(i=1; i<=NF; i++) printf $i"\n" }' ${2} > ${2}.line

#then compare use diff -y | less 

exit $?
