#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as sudo or root."
	exit 1
fi

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
echo "*      Running Kali playbook      *"
echo "***********************************"

curl -sL http://raw.github.com/AgroDan/FreshInstall/master/kali.yml -o /tmp/kali.yml

ansible-playbook /tmp/kali.yml

echo "***********************************"
echo "*          Cleaning up            *"
echo "***********************************"

rm -f /tmp/get-pip.py /tmp/kali.yml

echo "***********************************"
echo "*             Done!               *"
echo "***********************************"

echo "You should be set up. Check above for any errors."
