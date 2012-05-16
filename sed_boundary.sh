#! /bin/sh

# use \b to check the boundary of word
echo "use \b and \ *"

echo -e "( U8, \n (U8a\n( U8\n( U8\n" | sed 's/(\ *U8\b/( U32/g'

exit $?



