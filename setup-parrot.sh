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
echo "*      Pulling master bashrc      *"
echo "***********************************"

curl -sL "http://raw.github.com/AgroDan/FreshInstall/master/master-bashrc?nocache=$RANDO" -o /tmp/master-bashrc

echo "***********************************"
echo "*     Pulling bash_functions      *"
echo "***********************************"

curl -sL "http://raw.github.com/AgroDan/FreshInstall/master/master-bash_functions?nocache=$RANDO" -o /tmp/master-bash_functions

echo "***********************************"
echo "*       Pulling .tmux.conf        *"
echo "***********************************"

curl -sL "http://raw.github.com/AgroDan/FreshInstall/master/master-tmux_conf?nocache=$RANDO" -o /tmp/master-tmux_conf

echo "***********************************"
echo "*      Running Kali playbook      *"
echo "***********************************"

curl -sL "http://raw.github.com/AgroDan/FreshInstall/master/parrot.yml?nocache=$RANDO" -o /tmp/parrot.yml

ansible-playbook /tmp/parrot.yml

echo "***********************************"
echo "*          Cleaning up            *"
echo "***********************************"

rm -f /tmp/master-bashrc /tmp/master-bash_functions /tmp/master-tmux_conf /tmp/get-pip.py /tmp/parrot.yml

echo "***********************************"
echo "*             Done!               *"
echo "***********************************"

echo "You should be set up. Check above for any errors."