#! /bin/sh
#this is just to start Emacs or start emacsclient correctly from e

ps -u $USER | grep emacs | grep -v grep

if test "$?" -eq  "0";
then
    emacsclient -n $*
else
    emacs $*  &
fi

