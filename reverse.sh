#!/bin/bash

if [[ ${#} -eq 0 ]]
then 
	printf '%s\n' "Error: Please enter string" >&2
        exit 1
else	
	for WORD in ${@};
      	do
        	REVERSE=$(expr $WORD| rev)
        	RESULT="$RESULT $REVERSE"
      	done
      	RESULT=$(echo "${RESULT## }" | tr '[:upper:]' '[:lower:]')
      	echo "${RESULT^}"
fi