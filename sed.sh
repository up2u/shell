#! /bin/bash

# ! used before pattern.

# not print if match word.
echo " not print if match word."

# use NOT .
echo " use NOT ."
echo -e "hello \n word \n to you \n" |  sed -n '/word/!p' 

# when use multiple match .must use -e with every match.
echo " when use multiple match .must use -e with every match."
echo -e "hello \n word \n to you \n" | sed -n -e '/word/!p' -n -e "/word/=" 

# sed :can use comma(,) ,as the match form  match1 until the first match2, if no match2
#     finded, will go through the end line.

echo "will print 2 until 4"

echo -e " line1 \n line2 \n line3 \n line4 \n line5"  | sed -n '/2/,/4/p'
# sed : first character to UP.


exit $?
