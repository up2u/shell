#! /bin/sh

#usage : ./xxx.sh  a b c d 
#set -x


echo 'now show args without quote: \$*'
for f in $*
do
    echo $f
done
echo 'now show args with quote: "\$*"'
for f in "$*"
do
    echo $f
done

echo "now show args without quote: \$@"
for f in $@
do
    echo $f
done
echo 'now show args with quote: "\$@"'
for f in "$@"
do
    echo $f
done

exit $?
