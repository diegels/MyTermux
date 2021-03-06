#!/usr/bin/env bash

echo "From .bash_aliases" | lolcat
# Aliases
alias cls='cd && ls -a'
alias lsd=' lsd --group-dirs first'
alias ll='lsd -a'
alias pkgup='pkg update -y && pkg upgrade -y && pkg autoclean'
alias md='mkdir -p'
alias rmf='rm -irf'
alias cp='cp -vri'
alias viba='vim .bash_aliases'
alias vibasr='vim .bashrc'
alias vibas='vim bash.bashrc'
alias src='source .bashrc'
alias sra='source .bash_aliases'
alias virc='vim .vimrc'
alias mv='mv -ivn'
alias c='clear'
alias td='./today.sh'
alias jor='. ~/journal.sh'
alias vibc='vim .bash_config'
alias chmd='chmod +x'
alias aptg='apt-get install'
alias ..='cd ..'
alias h='htop'
alias apts='apt search'
alias aptre='apt reinstall'
alias aptr='apt remove'
alias srz='source ~/.zshrc'
alias vizsh='vim .zshrc'
alias ss='./screensaver.sh echo ss'
alias srg='source ~/.bash_config'
alias tc='./date.sh'
alias v='vim'
alias grep='grep -E'
alias sd='./sheldon.sh echo'
alias ni='nvim'
alias nirc='nvim init.vim'
alias wget='wget -c'
alias ports='netstat -tulanp'
alias now='date +"%T"'
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias gh='history|grep'
alias rm='rm -I --preserve-root'
alias fastping='ping -c 100 -s.2'
alias diff='colordiff'
alias cpv='rsync -ah --info=progress2'
alias count='find . -type f | wc -l'
alias left='ls -t -1'
alias tcn='mv --force -t ~/.local/share/Trash '
alias vibf='vim .bash_functions'
alias srf='source ~/.bash_functions'
alias note='cd ~; cd notes; ls -a; sleep 5; nvim'
alias e='exit'
alias m='micro'
alias tmr='timer.sh'
alias srp='. ~/.bash_profile'
alias vibp='vim .bash_profile'
alias na='nano'
alias nano='/usr/bin/nano -EMWacuw$ --tabsize=4'


