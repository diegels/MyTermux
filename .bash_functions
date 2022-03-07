#!/bin/bash

echo "From .bash_functions" | lolcat

##########
function cpy() {
	cat "$1" >> misc.sh
}
##########
function apt_up() {

	clear
	apt-get dist-upgrade -y
    sleep 1
	apt-get update -y
	sleep 1
	apt-get full-upgrade -y
	sleep 1
	echo "Updated && Upgraded" | lolcat
	sleep 1
	apt-get autoclean -y
	sleep 1
	apt-get autoremove -y
	sleep 1
	echo "termux has been maintained Success!" | lolcat

	return

}

function cc() {

    printf "%*s" $COLUMNS |tr " " "#"

    return

}


function cl() {
    DIR="$*";
    # if no DIR given, go home
        if [ $# -lt 1  ]; then

    DIR=$HOME;

        fi;

    builtin cd "${DIR}" && \
    # use your preferred ls command
    ll -F

}


function save() {

    mv "$1" ~/.local/share/Trash
}
