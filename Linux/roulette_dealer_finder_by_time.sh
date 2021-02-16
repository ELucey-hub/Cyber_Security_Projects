#!/bin/bash

echo "Dealer" on "Date" and "Time" 

awk -F" " '{print FILENAME, $1 $5 $6}' $1 | grep $2