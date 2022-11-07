#!/bin/bash

# Exit immediately on failure
set -eu

# Are we running in bash?
# Single bracket to be posix compliant in case we run in sh or something
if [ -z ${BASH} ]; then
	echo "This script must be run from the Bash shell!"
	exit 1
fi

# Are we root?
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as sudo or root."
	exit 2
fi

PATH_TO_SCRIPT=$(dirname $(readlink -f $0))
ZSH_FUNC_FILE="zsh_functions.zsh"
TMUX_FILE="tmux_conf"

if [[ ! -e ${PATH_TO_SCRIPT}/${ZSH_FUNC_FILE} ]] && [[ ! -e ${PATH_TO_SCRIPT}/${TMUX_FILE} ]]; then
	echo "Cannot find supporting files! Please clone repository and try again!"
	exit 3
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

ansible-playbook ${PATH_TO_SCRIPT}/kali.yml --extra-vars "tmux=${PATH_TO_SCRIPT}/${TMUX_FILE} zsh_func=${PATH_TO_SCRIPT}/${ZSH_FUNC_FILE}"

echo "***********************************"
echo "*             Done!               *"
echo "***********************************"

echo "You should reboot your system now."
