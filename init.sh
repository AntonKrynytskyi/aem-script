#!/bin/sh

echo "[INFO] "
sudo mkdir -p /usr/local/script/aem
echo "[INFO] created /usr/local/script/aem folder"

sudo cp aem /usr/local/script/aem/aem
echo "[INFO] copy 'aem' script file to /usr/local/script/aem folder"

sudo cp README.md /usr/local/script/aem/README.md
echo "[INFO] move 'aem' script file to /usr/local/script/aem folder"

sudo touch /usr/local/script/aem/cash.txt
sudo chmod 777 /usr/local/script/aem/cash.txt
sudo chmod 555 aem

echo "[INFO] created cash.txt under /usr/local/script/aem folder"

echo "alias aem=/usr/local/script/aem/aem" >> ~/.bashrc
echo "[INFO] created 'aem 'alias under ~/.bashrc"

echo "[INFO] done"
echo "[INFO] "
