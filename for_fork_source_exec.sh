#! /bin/bash

#changed the env:A.
echo -e "\nother script, get A=$A from previous shell,its process id:$$"

A=C
echo -e "\nother script, now A=$A\n"

export A

