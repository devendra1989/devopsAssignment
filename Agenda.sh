#!/bin/bash

echo "Meeting Agenda"

#read -p "Enter the file name which contains the agenda: " AGENDA_FILE
#check if file name is passed or not
if [[ -z ${AGENDA_FILE} ]]
then
        echo "Please enter file name."
        exit 1
fi

if test -f "$AGENDA_FILE"
then
        for i in $( grep -A1 -i --no-group-separator 'Today\|Tomorrow' ${AGENDA_FILE} )
        do
                echo ${i}
                if [[ "${i}" == 'Today' || "${i}" == 'Tomorrow' ]]
                then
                        FILE="${FILE} ${LINE}"
                        LINE="\n${i} : "
                else
                        LINE="${LINE} ${i}"
                fi
        done
        FILE="${FILE} ${LINE}"
        echo -e ${FILE} | sort -k1 | column  -t -s :
else
        echo "${AGENDAT_FILE} does not exist"
        exit 1
fi