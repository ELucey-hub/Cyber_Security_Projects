#!/bin/bash

echo "Roulette Dealer" on "0310" at "5AM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0310* | grep 05:00:00

echo "Roulette Dealer" on "0310" at "8AM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0310* | grep 08:00:00

echo "Roulette Dealer" on "0310" at "2PM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0310* | grep 02:00:00

echo "Roulette Dealer" on "0310" at "8PM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0310* | grep 08:00:00

echo "Roulette Dealer" on "0310" at "11PM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0310* | grep 11:00:00

echo "Roulette Dealer" on "0312" at "5AM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0312* | grep 05:00:00

echo "Roulette Dealer" on "0312" at "8AM" 
awk -F" " '{print FILENAME, $1 $5 $6}' 0312* | grep 08:00:00

echo "Roulette Dealer" on "0312" at "2PM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0312* | grep 02:00:00

echo "Roulette Dealer" on "0312" at "8PM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0312* | grep 08:00:00

echo "Roulette Dealer" on "0312" at "11PM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0312* | grep 11:00:00

echo "Roulette Dealer" on "0315" at "5AM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0315* | grep 05:00:00

echo "Roulette Dealer" on "0315" at "8AM" 
awk -F" " '{print FILENAME, $1 $5 $6}' 0315* | grep 08:00:00

echo "Roulette Dealer" on "0315" at "2PM"
awk -F" " '{print FILENAME, $1 $5 $6}' 0315* | grep 02:00:00