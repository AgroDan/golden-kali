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

curl -s https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3 /tmp/get-pip.py --user --no-warn-script-location

export PATH=$PATH:/root/.local/bin

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
echo "*  set up tlp to help with battery  *"
echo "***********************************"
sudo apt install -y tlp
sudo systemctl enable tlp
sudo systemctl start tlp
sudo tlp start

echo "***********************************"
echo "*  Set up discord 		*"
echo "***********************************"
sudo apt install -y snapd
sudo systemctl enable snapd.apparmor.service
sudo systemctl enable --now snapd apparmor
sudo snap install discord
snap connect discord:system-observe
echo "****************************************************************"
echo "*  You will need to run sudo /snap/bin/discord after reboot    *"
echo "****************************************************************"


echo "***********************************"
echo "*          Cleaning up            *"
echo "***********************************"

rm -f /tmp/master-tmux_conf /tmp/get-pip.py /tmp/kali.yml

echo "***********************************"
echo "*             Done!               *"
echo "***********************************"

echo "You should be set up. rebooting for the Nvida drivers ."
sudo reboot -f
