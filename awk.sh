#! /bin/bash

# match:  once a line match mao, then print
echo "match:  once a line match mao, then print,use ~ and //"
echo  " wo shi mao " | awk '{if($0~/mao/) print $1}'	# use ~ and //
echo  " wo shi mao " | awk '{if($0~/ao/) print $2}'
echo  " wo shi mao " | awk '{if($0~/[Mm]ao/) print $3}'

# match:  once a field match mao, then print
echo "match:  once a field match mao, then print"
echo  " wo shi mao " | awk '{if($3~/mao/) print $1}'
echo  " wo shi mao " | awk '{if($3~/ao/) print $2}'
echo  " wo shi mao " | awk '{if($3~/[Mm]ao/) print $3}'

# match: exact match. 
echo "match a field exactly: use == and quote with \"\"."
echo -e "hello word, i am mlj \n and you ?" | awk '{if($4=="am") print $2}'  # use == and quote with "".
# AND OR
echo "use == and quote with "". logic OR"
echo -e "hello word, i am mlj \n and you ?" | awk '{if($4=="am" || $2=="you") print NR,$2}'  # use == and quote with "". logic OR

# line head.
echo "line head"
echo -e "hello word, i am mlj \n and you ?" | awk '{if(/^h/)  print "line head NR,$0"}'
echo "line rear"
echo -e "hello word, i am mlj \n and you ?" | awk '{if(/?$/)  print "line rear NR,$0"}'

# substitution
echo "condition -> multiple command,must use {} to include them"
echo -e "hello word, i am mlj \n and you ?" | awk '{if($1=="and") {$1="AND"; print $0} }'
exit $?
