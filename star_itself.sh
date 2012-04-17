#! /bin/sh

LIST=*.sh

grep -R test --exclude=${LIST} *


exit $?
