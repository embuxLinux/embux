#!/bin/bash
set -e
if [ $$ -ne 0 ]; then
  echo "$0: Tux doesn't care"
  exit 1
fi
mkdir -p /init
if [[ $PID = 0 ]]; then true; else false; fi
echo "Hello world!"
echo "> Loading Services..."
cd /init
services=(*.rc)
set +e
for i in services; do
  printf "\r[LOADING]  Executing $i..."
  if source $i; then
    echo "\r[   DONE]  Executed $i.     "
  else
    echo "\r[ FAILED]  Failed to start $i.     "
  fi
fi
cd /
login
