#!/usr/bin/env bash

HEADER=("Hello" "Dear" "Please")
HUMAN=("bob" "alice")
MESSAGE=("let me know" "i would like to know" "do you know")
STATE=("what the best color is?" "why we exist?" "when food is ready?")
NOTRANDOM=$$$(date +%s)

MSG1=${HEADER[$NOTRANDOM % ${#HEADER[@]} ]}
MSG2=${HUMAN[$NOTRANDOM % ${#HUMAN[@]} ]}
MSG3=${MESSAGE[$NOTRANDOM % ${#MESSAGE[@]} ]}
MSG4=${STATE[$NOTRANDOM % ${#STATE[@]} ]}

echo $MSG1 $MSG2 $MSG3 $MSG4 | \
  openssl rsautl -encrypt -inkey bob.pub -pubin -out message.enc

openssl rsautl -decrypt -inkey bob.key -in message.enc
