# ~/.bashrc: executed by bash for non-login shells.
# Stolen from an older unbuntu default config.
# Everett Kropf, 20??, 2016.

# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history. See bash(1) for more options.
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    xterm) color_prompt=yes;;
esac

# For none of the cases, try terminal capability.
if [ -z "$color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[00;32m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='\u@\h:\w\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Path for MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
elif [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# VI mode FTW!
set -o vi

# Dotfile tracking (home config).
alias hconfig='/usr/bin/git --git-dir=$HOME/.hconfig --work-tree=$HOME'

# Color grep? Yes please!
alias grep='grep --color=auto'

# some ls aliases
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'

# Source grep-ing.
alias mgrep='find . -name \*.m | xargs grep -n --color=auto'
alias cgrep='find -E . -regex ".*\.(c|h|cpp|hpp)" | xargs grep --color=auto'

# Cxx search and replace.
function csarep {
    cgrep -l $1 | xargs sed -E -e "s/$1/$2/" -i ''
}

# "view" for MacVim
alias mview='mvim -R'

# random
alias cleantex='rm -f *.{aux,bbl,blg,lof,log,lot,nav,out,snm,spl,toc}'
alias ldd='otool -L'

# add my own bin path
export PATH=$PATH:~/bin

# Local VM ssh.
alias lssh='ssh -p 2222 localhost'
