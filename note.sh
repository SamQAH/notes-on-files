#!/bin/bash
#options: -o overwrite previous note
#         -v verbose
#         -r remove all notes

if [ -f "~/.filenote-dir" ]; then
 notedir=$(head -n1 ~/.filenote-dir)
else
 notedir=~/.filenote/
fi
if ! [ -d "$notedir" ]; then
 mkdir $notedir
fi

while echo $1 | grep -q '^-'; do
if [ $1 == "-o" ]; then
 overwrite=1
elif [ $1 == "-v" ]; then
 verbose=1
elif [ $1 == "-r" ]; then
 echo removing $notedir
 rm -r $notedir
 exit 0
else
 echo Option not found: $1
 exit 1
fi
shift
done

if [ $# -lt 1 ]; then
 echo require 1 arguments, $# given.
 exit 1
fi

if [ -f $1 ]; then
 FILE=$(./a.out $1 $(pwd))
 NOTEFILE=$notedir.$FILE
 shift
 DATA=$@
 if [ $# -eq 0 ]; then
  cat $NOTEFILE
  exit 0
 fi
 if [ "$verbose" != "" ]; then 
  echo writing "'"$DATA"'" to $NOTEFILE
 fi
 if [ "$overwrite" != "" ]; then
  echo $DATA > $NOTEFILE
 else
  echo $DATA >> $NOTEFILE
 fi
 exit 0
else
 echo File not found: $1
 exit 1
fi
