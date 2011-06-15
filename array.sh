#! /bin/sh

set -x 

DB=(db1 db2 db3)
DB_SET=$(echo ${DB[@]}|tr ' ' ',')
echo $DB_SET

exit $?
