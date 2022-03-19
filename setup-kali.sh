#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as sudo or root."
	exit 1
fi

# Generate psuedo-random string to fool servers into not giving you
# cached crap, mostly for debugging purposes. This is kinda neato
RANDO=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n1)

echo "***********************************"
echo "*        Installing pip           *"
echo "***********************************"

sudo apt install python3-pip -y 


echo "***********************************"
echo "*       Installing ansible        *"
echo "***********************************"

pip install ansible



echo "***********************************"
echo "*       Pulling .tmux.conf        *"
echo "***********************************"

curl -sL "https://raw.githubusercontent.com/Masklyne/FreshInstall/master/master-tmux_conf?nocache=$RANDO" -o /tmp/master-tmux_conf

echo "***********************************"
echo "*      Running Kali playbook      *"
echo "***********************************"

curl -sL "https://raw.githubusercontent.com/Masklyne/FreshInstall/master/kali.yml?nocache=$RANDO" -o /tmp/kali.yml

ansible-playbook /tmp/kali.yml

echo "***********************************"
echo "*  Install NVIDIA GPU Drivers     *"
echo "***********************************"
sudo apt update
sudo apt install -y nvidia-driver nvidia-cuda-toolkit




echo "***********************************"
echo "*          Cleaning up            *"
echo "***********************************"

rm -f /tmp/master-tmux_conf /tmp/get-pip.py /tmp/kali.yml

echo "***********************************"
echo "*             Done!               *"
echo "***********************************"

echo "You should be set up. rebooting for the Nvida drivers ."
sudo reboot -f
