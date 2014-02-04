#!/bin/bash

IFS=$'\n'
RESP=($(curl -s 'http://developer.veevavault.com/?page_id=951' \
	| sed -n 's/.*End Point.*\(\/api\/[^\w<]*\).*/\1/p' | sort | uniq ))
unset IFS
  
for (( i=0 ; i < "${#RESP[@]}" ; i++ ))
do
	printf "%02d: %s\n" "$i" "${RESP[$i]}"
done
echo "Enter a number"
read num
URL="${RESP[$num]}"
echo "$URL"
while [[ $URL == *{*?}* ]]; do
	START=`expr index "$URL" {`
	START_OFF=`expr $START - 1`
	END=`expr \`expr index "$URL" }\` - $START_OFF` 
	
	VAL_TO_REPLACE="${URL:$START_OFF:$END}"
	echo "Enter a value for $VAL_TO_REPLACE"
	read val
	URL=${URL/$VAL_TO_REPLACE/$val}
	echo $URL
done

echo "$(sh use.sh $URL)"
