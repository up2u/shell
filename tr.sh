#! /bin/sh

# make the space (\040), TAB (\011) to newline(\n), and squeeze-repeat '\n'
tr -s "\040\011" "\012"  <  i18n.txt 

# blank to _
tr -s "[:blank:]" "_" < i18n.txt

# num to newline and squeeze it
tr -s "[:digit:]" "\012" < i18n.txt

exit $?
