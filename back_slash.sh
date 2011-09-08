#! /bin/sh

# the difference between single/double quote is : ` $ \

str='abc\'

# when use single quote , to grep backslash \, you should use '\\'
echo "now use single quotes to grep \\"
echo $str | grep '\\'  

# when use double quote , to grep backslash \, you should use "\\\\"
echo "now use double quotes to grep \\"
echo $str | grep "\\\\"

exit $?
