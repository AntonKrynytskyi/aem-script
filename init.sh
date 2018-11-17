#!/bin/sh
currentPath="$(pwd)"
ameScrtipPath="$currentPath/aem"
comn="alias aem=$ameScrtipPath"

sudo touch cash.txt

sudo chmod 555 aem
sudo chmod 777 cash.txt

echo $comn >> ~/.bashrc 

