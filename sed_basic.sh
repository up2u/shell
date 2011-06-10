#! /bin/sh

echo -e "11 \n  22 \n 33 \n" |  sed -n '1,$='                # only print line number

# print from line 2 until pattern:aa , if pattern not found will print to last line
echo -e "11 \n  22 \n 33 \n  aa \n bb \n  " | sed -n '2,/aa/p'  

# match any char  : *
echo -e "11 \n  aing \n ing \n  aa \n bb cingdll \n  " | sed -n '/.*ing/p'

## the pattern can be also use line number. 
# sed a \ test
echo -e  "11  \n  22 \n 33 \n"  | sed '/22/a \Hilll' 

# sed c  \ test
echo -e  "11  \n  22 \n 33 \n"  | sed '/22/c \Hilll' 

# sed c \ test
echo -e  "11  \n  22ppp \n 33 \n"  | sed '/2p/i \Hilll'   # the line before pattern  

# insert in line,USE:&
echo -e " abc_f  \n P13you o   \n %UIolll \n jlj" | sed 's/ou/MM&/g'  ###  indert MM before ou, 
echo -e " abc_f  \n P13you o   \n %UIolll \n jlj" | sed 's/ou/&MM /g' ###  ....      after  ..
echo -e " abc_f  \n P13you o   \n %UIolll \n jlj" | sed 's/^/MM &/g' ###  insert MM to line head

# when with multiple 's///', shoud use ; 
echo -e " abc_f  \n P13you o   \n %UIolll \n jlj" | sed 's/P/ZZ/; s/y/++/ '

exit $?
