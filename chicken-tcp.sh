#!/bin/bash
# A script for Chicken over tcp; tested on Arch Linux
# If server is already running on localhost at the specified port, it will just connect
# Dependencies: 
# 	System packages: netcat, chicken
# 	Chicken eggs: srfi-18, nrepl

CHICKEN_PORT=1234
MAX_ATTEMPTS=10
SLEEP_TIME=0.1

# Check if server is already running at specified port
if nc -z localhost $CHICKEN_PORT; then
	echo "Server is already running. Connecting to whatever is there ..."
	exec nc localhost $CHICKEN_PORT
fi

# Start chicken-csi with nrepl in the background
echo "Starting server ..."
(chicken-csi -R nrepl -P "(nrepl $CHICKEN_PORT)" &) 

# Make multiple attempts to connect
echo "Attempting to connect a maximum of $MAX_ATTEMPTS times every $SLEEP_TIME seconds."
for ((i=l; i<=MAX_ATTEMPTS; i++)); do
	if nc -z localhost $CHICKEN_PORT; then
		exec nc localhost $CHICKEN_PORT
	fi
	sleep $SLEEP_TIME
done

echo "Failed to connect to localhost at port $CHICKEN_PORT after multiple attempts." >&2
exit 1
