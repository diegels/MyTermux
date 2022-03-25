#!/bin/zsh
eval "$(zoxide init zsh)" 

source ~/aliases.sh
source ~/.bash_config

echo ".zshrc 💎" | lolcat

# autoload
# completion
autoload -U compinit && compinit

# colors
autoload -U colors && colors

# edit cmd line
autoload -z edit-command-line
zle -N edit-command-line

# audit
autoload  -U compaudit

# BIND KEYS
bindkey -v

# edit cmd line
bindkey "^X^E" edit-command-line

# vi keybind
bindkey -M vicmd v edit-command-line


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

#    if [[ "$?" = 0 ]]; then
#        echo " 💘"
#        else
#        echo "💡"
#    fi

#PROMPT='%F{blue}tough%f%F{purple}•AS•%f%F{cyan}nails•%f%F{green}%1~•%f%F{red}•%#%f '

#PS1=''; RPS1=''
#PS2="↷ %_>"; RPS2=''
#PS3="↷ ?#"; RPS3=''
#PS4="↷ +i>"; RPS3=''



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
export HISTSIZE=50000
export HISTCONTROL=ignotrboth,spaces,dups
export HISTFILESIZE=10000
export SAVEHIST=10000
# set a fancy prompt
case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
esac


        # activate ls colors, (private if possible)
        # export ZSH_DIRCOLORS="$ZSH_CONFIG/dircolors-solarized/dircolors.256dark"
    if [[ -a $ZSH_DIRCOLORS ]]; then
    if [[ "$TERM" == *256* ]]; then
		which dircolors > /dev/null && eval "`dircolors -b $ZSH_DIRCOLORS 2>/dev/null`"
    else
#       # standard colors for non-256-color terms
        which dircolors > /dev/null && eval "`dircolors -b`"
    fi
    else
        which dircolors > /dev/null && eval "`dircolors -b`"
	fi

# tput
    if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput/ ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
    fi  


alias zrc='vi ~/.zshrc'
alias srz='source ~/.zshrc'
alias ls='ls -a'
alias cd='cd && ls'
alias pd='pushd'
alias pp='popd'

# no clobber
#setopt noclobber

# hisrory
setopt histappend
# interactve commenting	
setopt interactive_comments

# correct
setopt correct

# golb
setopt glob_complete

# set eror messages
setopt bg_nice notify

# nomath bad pattern
setopt nomatch bad_pattern

#Prompt sub
setopt prompt_subst

# autoname cd
setopt auto_name_dirs

#pushd
setopt autopushd pushdsilent pushdminus
#DIRSTACK=20

#vextended glob
setopt extended_glob

# exrended hist
setopt extended_history

setopt hist_allow_clobber hist_reduce_blanks
setopt hist_ignore_dups hist_save_no_dups 
setopt share_history hist_no_functions


# dot files
setopt dotglob


# auto menu
setopt automenu

# auto list
setopt autolist


# autocd
setopt autocd


# timestamp
HIST_STAMPS="mm/dd/yyyy"

# diable dirty repos
DISABLE_UNTRACKED_FILES_DIRTY="true"

# case sensitive
CASE_SENSITIVE="false"

# hyper sensitive
HYPHEN_INSENSITIVE="true"

# language
export LANG=en_US.UTF-8

# arh os
# export ARCHFLAGS="-arch x86_64"



#        ZPLUGINDIR=$HOME/.zsh/plugins

#    if [[ ! -d $ZPLUGINDIR/zsh-autosuggestions ]]; then
#	    git clone https://github.com/zsh-users/zsh-autosuggestions $ZPLUGINDIR/zsh-autosuggestions
#    fi
#    if [[ ! -d $ZPLUGINDIR/zsh-history-substring-search ]]; then
#	    git clone https://github.com/zsh-users/zsh-history-substring-search $ZPLUGINDIR/zsh-history-substring-search
#    fi
#    if [[ ! -d $ZPLUGINDIR/z ]]; then
#	    git clone https://github.com/rupa/z $ZPLUGINDIR/z
#    fi

#source $ZPLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
#source $ZPLUGINDIR/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
#source $ZPLUGINDIR/z/z.sh

# clone a plugin, identify its init file, source it, and add it to your fpath
function plugin-load {
    local repo plugin_name plugin_dir initfile initfiles
        ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
    for repo in $@; do
		plugin_name=${repo:t}
    	plugin_dir=$ZPLUGINDIR/$plugin_name
        initfile=$plugin_dir/$plugin_name.plugin.zsh
    if [[ ! -d $plugin_dir ]]; then
		echo "Cloning $repo"
        git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugin_dir
    fi
    if [[ ! -e $initfile ]]; then
		initfiles=($plugin_dir/*.plugin.{z,}sh(N) $plugin_dir/*.{z,}sh{-theme,}(N))
        [[ ${#initfiles[@]} -gt 0 ]] || { echo >&2 "Plugin has no init file '$repo'." && continue }
        ln -sf "${initfiles[1]}" "$initfile"
    fi
        fpath+=$plugin_dir
        (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
done
}

#       where do you want to store your plugins?
        ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
#       get zsh_unplugged and store it with your other plugins
    if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
        git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
	fi

	source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.plugin.zsh

        # make list of the Zsh plugins you use
repos=(
        # plugins that you want loaded first
        sindresorhus/pure

        # other plugins
        zsh-users/zsh-completions
        rupa/z
        changyuheng/fz
        

        # ...oh-my-zsh

        # plugins you want loaded last
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
        zsh-users/zsh-autosuggestions
)

        # now load your plugins
        plugin-load $repos

function plugin-update {
        ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
    for d in $ZPLUGINDIR/*/.git(/); do
		echo "Updating ${d:h:t}..."
	    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
	done
}

#ZPLUGINDIR=~/.config/zsh/plugins
#rm -rfi $ZPLUGINDIR
#zshZPLUGINDIR=~/.config/zsh/plugins
#rm -rfi $ZPLUGINDIR
#zsh

# zoxide config

#ENVIRONMENT VARIABLES:
_ZO_DATA_DIR="~/.local/share/zoxide"                         # Path for zoxide data files
_ZO_ECHO=1                       # Print the matched directory before navigating to it when set to 1
_ZO_EXCLUDE_DIRS=               # List of directory globs to be excluded
_ZO_FZF_OPTS=                  # Custom flags to pass to fzf
_ZO_MAXAGE=100000                     # Maximum total age after which entries start getting deleted
_ZO_RESOLVE_SYMLINKS=1           # Resolve symlinks when storing paths


zstyle '*:completion:*' completer _expand _complete _ignored _approximate
zstyle '*:completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle '*:completion:*' menu select=2
zstyle '*:completion:*:descriptions:*' format '-- %d --'
                                               					   
zstyle '*:completion:*' rehash true
zstyle '*:completion:*' group-name 
zstyle '*:completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle '*:completion:*' special-dirs true
zstyle '*:completion:*' completer _complete _correct _approximate
zstyle '*:completion:*' verbose yes
zstyle '*:completion:*' use-cache on
zstyle '*:completion:*' cache-path "$ZSH_CACHE"
	

echo "$(date)" | lolcat
sleep 2
echo
echo
echo "$(uptime -p)" | lolcat
sleep 2
echo
echo
echo "$(neofetch)"
sleep 2
echo
echo
echo "$(toilet -F metal -F border -F metal Termux)"	
echo "$(crunchbang-mini)"
echo "$(kaisen)"
