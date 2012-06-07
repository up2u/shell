#! /bin/sh


# delete spaces of line tail
sed -i 's/[ ]*$//' `find . -name "*.[ch]"`

exit $?
