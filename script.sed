#! /bin/sed -f
# usage ./sed.sh -f file
# if match an line has "word"(you can substiute it youself),
# then the follow line will be append to the line after "word"
# must use \ to contain multiple lines.
# NOTE:1: nothing can't add after "\". !!!
#      2: no exit 0
/word/ a\
\
Hello sed.\
to you.

