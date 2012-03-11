#! /bin/sh

# clean file first
> /tmp/reverse.log

# range = 256
i=0
while test $i -lt 256
do
	echo "obase=2; $i" | bc | sed -e:a  -e 's/^.\{1,7\}$/0&/;ta' | rev | tee -a /tmp/reverse.log
	((i++))
done

echo "reverse finish"

exit $?
