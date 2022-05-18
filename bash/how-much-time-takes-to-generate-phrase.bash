#!/bin/bash

KEYWORD="a"

if [[ "$#" -eq "0" ]]; then
	echo "$0 String-to-search"
	echo "Since no string was provided, we will see how many itterations needed to get letter a"
else
	KEYWORD="$1"
fi

i=1
a=0

LETTERS=$(echo $KEYWORD | wc -m)
LETTERS=$(($LETTERS -1))
echo "LETTERS=${LETTERS} = ${KEYWORD}"

while true
do
	TEST=$(cat /dev/urandom | tr -dc '[:print:]' | fold -w $LETTERS | head -n 1)
	if [[ "$i" -eq "100000" ]]; then
		((a++))
		echo ${a}00000 $KEYWORD $TEST
		sleep 5
		i=0
	fi
	if [[ "$TEST" == "$KEYWORD" ]]; then
		echo "${a}00000 + ${i} = $(echo "${a}00000 + ${i}" | bc ) times - to get KEYWORD=${KEYWORD} = ${TEST}=GENERATED WORD"
		exit 0
	fi
	((i++))
done
