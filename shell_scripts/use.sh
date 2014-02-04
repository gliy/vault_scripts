#!/bin/bash
HEADER="$(cat auth.out)"
URL="https://calpoly-capstone4.veevavault.com${1}"
echo "$URL/${1}"
RESP="$(curl -s -H "$HEADER" "$URL" -D /tmp/headers.out )" 
if [[ "$(cat /tmp/headers.out | grep Content-Type)" =~ json.* ]]; then
 echo "$(echo $RESP | python -mjson.tool)"
else 
 echo "$RESP"
fi
rm /tmp/headers.out
