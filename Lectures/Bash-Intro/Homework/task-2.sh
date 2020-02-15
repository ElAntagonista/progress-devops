#!/bin/bash
if [ -z "$1" ];
then
    exit "I need an argument"
fi
regex=".*sudo:\s+(${1})\s+:.*COMMAND=(.*)"
date=$(date '+%Y-%m-%d')
filename="${1}-${date}.txt"
tmpfile="${RANDOM}-tmp.txt"
counter=0
while read -r LINE; do
    if [[ $LINE =~ $regex ]]
        then  
            let counter+=1
            echo ${BASH_REMATCH[2]} >> $tmpfile 
        fi
done < /var/log/auth.log

if test -f "$tmpfile"; then
    echo "User ${1} has used sudo ${counter} times" > $filename
    cat $tmpfile | sort -u >> $filename
    rm $tmpfile 2> /dev/null
fi

