#!/bin/bash
# Dependencies: 
# 	System packages: scrot

mkdir -p ~/media/screenshots && scrot ~/media/screenshots/%m-%d-%Y-%H%M%S.jpg --select --line mode=edge
