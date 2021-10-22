#!/bin/bash 
# Ping server until q key pressed and sound buzzer for each ping success
regex='[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)'
if [[ $1 =~ $regex ]]
then 
    echo "Link valid"
  n=1
  while true;
  do
    ping -c1 $1
    if [ $? -eq 0 ]
    then
      echo -ne '\007'
    fi
    # -n 1 to get one character at a time, -t 0.1 to set a timeout
    read -n 1 -t 0.1 input                  # so read doesn't hang
    if [[ $input = "q" ]] || [[ $input = "Q" ]]
    then
      echo # to get a newline after quitting
      break
    fi
  done
else
  echo "Command useage:"
  echo $0 URL
fi
