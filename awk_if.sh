#! /bin/sh

# use awk if condition to truncate num in different field
#set -x

awk -F'.lcm' '{print $1}' lcm.xls | awk -F'_' '{if($2~/[0-9]/) {print $2} else {print $0}}' | awk -F'.' '{if($2~/[0-9]/) {print $2} else {print $0}}' > /tmp/num.log


exit $?
