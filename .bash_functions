#!/bin/bash                                                       

echo ".bash_functions 💨" | lolcat

##########
function cpy() {    
	cat "$1" >> misc.sh
}   
##########
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
