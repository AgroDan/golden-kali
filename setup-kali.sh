#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as sudo or root."
	exit 1
fi

echo "***********************************"
echo "*        Installing pip           *"
echo "***********************************"

curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

export PATH=$PATH:/root/.local/bin

echo "***********************************"
echo "*       Installing ansible        *"
echo "***********************************"

pip install ansible

echo "***********************************"
echo "*      Running Kali playbook      *"
echo "***********************************"

curl -s http://raw.githubusercontent.com/AgroDan/FreshInstall/master/kali.yml -o kali.yml

ansible-playbook ./kali.yml

echo "***********************************"
echo "*          Cleaning up            *"
echo "***********************************"

rm -f ./get-pip.py ./kali.yml

echo "***********************************"
echo "*             Done!               *"
echo "***********************************"

echo "You should be set up. Check above for any errors."