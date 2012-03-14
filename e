#! /bin/sh
#this is just to start Emacs or start gnuclient correctly from e

ps -u $USER | grep emacs | grep -v grep

if test "$?" -eq  "0";
then
    gnuclient -q $* 
else
    emacs $*  &
fi

