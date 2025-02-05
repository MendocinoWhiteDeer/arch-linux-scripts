#!/bin/bash
# A script for Chicken over TCP; tested on Arch Linux
# If server is already running on localhost at the specified port, it will just connect
# Dependencies: 
# 	System packages: netcat, chicken
# 	Chicken eggs: srfi-18, nrepl

CHICKEN_PORT=1234
MAX_ATTEMPTS=10
SLEEP_TIME=0.5

echo "Starting server ..."
chicken-csi -R nrepl -P "(nrepl $CHICKEN_PORT)" & 
sleep $SLEEP_TIME
nc localhost $CHICKEN_PORT
exit 0

echo "Failed to connect to localhost at port $CHICKEN_PORT after multiple attempts." >&2
