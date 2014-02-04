#!/bin/bash
INFO_FILE="info.txt"
URL="$(sed -n 1p $INFO_FILE)"
USER="$(sed -n 2p $INFO_FILE)"
PASS="$(sed -n 3p $INFO_FILE)"
RESULT="$(curl -s -X POST $URL?username=$USER\&password=$PASS)"

echo "Authorization: $(echo \"$RESULT\" | sed -n -e 's/.*sessionId":"\([^\"]*\)\".*/\1/p' )" > auth.out
