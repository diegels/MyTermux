#[[ $- == *i* ]] && "$HOME/.local/share/blesh/ble.sh" --noattach

# welcome message
echo ".bash_profile 🖕" | lolcat

# sources
eval "$(zoxide init bash)"
#source ~/ble.sh/blerc
#source ~/.local/share/blesh/ble.sh
source ~/aliases.sh
#source ~/oh-my-git/prompt.sh
source ~/.bash_prompt
source ~/.bash_config
# sourcing main bash file
test -e /etc/bash.bashrc && source /etc/bash.bashrc

# interactive terminal
case $- in
	*i*) ;; # interactive
	*) return ;;
esac

# less
if  test -x /usr/bin/lesspipe; then
	export LESSOPEN="| /usr/bin/lesspipe %s";
	export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

# command execution function
#function _stat(){

#if [[ "$?" = 0 ]]; then
#	echo "🚀" 
#else
#	echo "💥"
#fi
#}

# .prompt.sh config


# My prompt
#PS1='\[\e[3;31m\](techkr \[\e[1;35m\]AT \[\e[3;32m\]tech) \[\e[3;35m\]IN \[\e[3;33m\][\W] $(_stat)\n\[\e[0m\]\[\e[3;34m\]_$\[\e[0m\]  '

# term variables
export TERM="xterm-256color"
export EDITOR="vi"
export EDITOR="vi"
export MANPAGER="less -R --use-color -Dd+r -Du+b"

 #term colors
export LESS_TERMCAP_mb="^[[35m" # magenta
export LESS_TERMCAP_md="^[[35m" # yelloe
export LESS_TERMCAP_me="" # "^[0m"
export LESS_TERMCAP_se="" # "^[0m"
export LESS_TERMCAP_so="^[[34m" # blue
export LESS_TERMCAP_ue="" # "^[0m"
export LESS_TERMCAP_us="^[[4m" # underline

# Path variables
export PATH="$PATH:$HOME"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/colorscripts"
# history

# set a fancy prompt
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# tput
if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput/ ] && tput setaf 1 >&/dev/null; then
		color_prompt=yes
	else
		color_prompt=
	fi
fi

# uncomment for color prompt
force_color_prompt=yes
unset color_prompt force_color_prompt

#Sourcing completion bash
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

function __getMachineId() {
    if [ -f /etc/machine-id ]; then
        echo $((0x$(cat /etc/machine-id | head -c 15)))
    else
        echo $(( (${#HOSTNAME}+0x$(hostid))))
    fi
}
# ?

# * files all
shopt -s globstar
# window size
shopt -s checkwinsize
# dot files
shopt -s dotglob
# extended glob
shopt -s extglob
# interactive comments
shopt -s interactive_comments
# vi mode
#set -o vi
# history
shopt -s histappend
# aitocd
shopt -s autocd

# Display matches for ambiguous patterns at first tab press
# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space                                                                                                                                       
# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH=".:~:~/bin"

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# Examples:
export notes="$HOME/notes"
# export dotfiles="$HOME/dotfiles"
# export projects="$HOME/projects"
# export documents="$HOME/Documents"
# export dropbox="$HOME/Dropbox"
##########

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red                                                                                                                                BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

# history
export HISTTIMEFORMAT="%d/%m/%y %T "

# hyper insensitive
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untra
# under VCS as dirty. This makes repository status check for large # much, much faster.                                                DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line to display red dots whilst waiting f
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="mm/dd/yyyy"

 # You may need to manually set your language environment
 export LANG=en_US.UTF-8

 # Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


#ENVIRONMENT VARIABLES:
_ZO_DATA_DIR="~/.local/share/zoxide"                         # Path for zoxide data files
_ZO_ECHO=1                       # Print the matched directory before navigating to it when set to 1
_ZO_EXCLUDE_DIRS=""               # List of directory globs to be excluded
_ZO_FZF_OPTS=""                   # Custom flags to pass to fzf
_ZO_MAXAGE=100000                     # Maximum total age after which entries start getting deleted
_ZO_RESOLVE_SYMLINKS=1           # Resolve symlinks when storing paths#
echo "$(neofetch)"
echo "                     $(date)                          " | lolcat
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" | lolcat
echo "@@@@@@@@@@@@@@@@@@@@ [techkr@tech]@@@@@@@@@@@@@@@@@@@@" | lolcat 
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" | lolcat
echo "                     $(uptime -p)                     " | lolcat
echo "$(tux)"




#[ ${BLE_VERSION-} ]] && ble-attach
