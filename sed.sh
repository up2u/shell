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

#with multiple match then with string substitution
echo "from a blank line until has \"line6\" "
echo -e " line1 \n line2 \n line3 \n\n line4 \n line5 \n line4 \n line6"  | sed  '/^$/,/line6/s/4/FROM-4/g'

# sed can use other IFS replace "/"
echo "changed sed's IFS use other like :"
echo "/usr/local/bin/"  | sed -e s:/usr/local/:/usr/local/my/:g 

# use [^character] means: !character.
echo -e "\n <b>This</b> is what <b>I</b> meant. "
echo "we want to splite the <> from the string."
echo "<b>This</b> is what <b>I</b> meant. " | sed  "s/<[^>]*>//g"

# sed : first character to UP.
# \b means the start boundary of the word.
echo "hello \"i\",[1]\"m\" mlj " | sed -r '/^[a-zA-Z]/{s/\b([a-z])/\U&/g}'
echo "hello \"i\",[1]\"m\" mlj " | sed -r '/^[a-z]/{s/\b[a-z]/\U&/g}'

exit $?
