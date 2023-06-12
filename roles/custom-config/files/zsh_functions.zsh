# This is a handy list of functions I use

scan() {
	SCANDIR="${PWD}/nmap_scans"
	if [ -z $1 ];
	then
		read "TARGET?Enter a target: "
	else
		TARGET=$1
	fi

	echo "Scanning ${TARGET}..."
	mkdir -p $SCANDIR
	sudo nmap -sS -sV -sC -oN $SCANDIR/initial-scan -v $TARGET
	sudo nmap -sS -p- -oN $SCANDIR/allports -v0 $TARGET &disown
	sudo nmap -sU -oN $SCANDIR/udpports -v0 $TARGET &disown
}

# Get latest version of linpeas and download to current directory
alias getlinpeas='curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh > linpeas.sh'

# I use this a ton
alias webserver='python -m http.server'

# hey why not, change this number to your preferred revshell port.
alias revshell='ncat -lvnp 9090'