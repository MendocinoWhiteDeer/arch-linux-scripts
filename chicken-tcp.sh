#!/bin/bash
# A script for Chicken over TCP; tested on Arch Linux
# If server is already running on localhost at the specified port, it will just connect
# Dependencies: 
# 	System packages: netcat, chicken
# 	Chicken eggs: srfi-18, nrepl

CHICKEN_PORT=1234

echo "Starting server ..."
chicken-csi -R nrepl -P "(nrepl $CHICKEN_PORT)" &
nc localhost $CHICKEN_PORT
