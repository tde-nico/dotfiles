# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


###   ALIAS   ###

# Git
alias "gcl"="git clone"
alias "add"="git add"
alias "stat"="git status"
alias "gc"="git commit -m"
alias "glog"="git log"
alias "pull"="git pull"
alias "push"="git push"

# Make
alias "m"="make"
alias "r"="make run"
alias "rr"="make rrun"

# Python
alias "py"="python3"
alias "www"="python3 -m http.server 8000 --directory"

# Pwn
alias "pwninit"="/opt/pwninit --template-path ~/.config/pwninit-template.py"
alias "pwn"="sudo docker run -it --rm -v \"\`pwd\`:/chal\" pwner /bin/bash"
alias "sqlmap"="python3 /opt/sqlmap-dev/sqlmap.py"
alias "responder"="sudo python3 /opt/Responder-3.1.3.0/Responder.py"
alias "procyon-decompiler"="java -jar /opt/procyon-decompiler.jar"
alias "openvpn"="sudo openvpn"
alias "ida32"="/mnt/c/Python/Programs/IDA\ 7.5/ida.exe"
alias "ida64"="/mnt/c/Python/Programs/IDA\ 7.5/ida64.exe"
alias "ida64f"="/mnt/c/Program\ Files/IDA\ Freeware\ 8.3/ida64.exe"


# Go
alias "gb"="go build"
alias "gmi"="go mod init"

# Sh
alias "c"="clear"
alias "vim"="nvim"
alias ".."="cd .."
alias "now"='date +"%T"'


# Bash
alias "desk"="cd /mnt/c/Users/tommy/Desktop"
alias "dpy"="cd /mnt/c/Python"
alias "docks"="cd /mnt/c/Python/docks"
alias "upgrade"="sudo apt-get update && sudo apt-get upgrade -y"
alias "2u"="find . -type f -print0 | xargs -0 dos2unix --"
alias "g"="gcc -Werror -Wextra -Wall"
alias "dock"="sudo docker run -it --rm -v \"\`pwd\`:/chal\" --entrypoint /bin/bash"


###   PROMPT   ###
BLUE="\[\033[1;34m\]"
GREEN="\[\033[1;32m\]"
RED="\[\033[31m\]"
END="\[\033[00m\]"

EXITSTATUS="\`if [ \$? = 0 ]; then echo '${GREEN}'; else echo '${RED}'; fi\`"

export PS1="${EXITSTATUS}\u${END}:${BLUE}\w${END}$ "


export PATH="$PATH:/usr/local/x86_64elfgcc/bin"
export PATH="$PATH:/opt"
export PATH=$PATH:/usr/local/go/bin
export PATH="/home/kali/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export MODULAR_HOME="/home/kali/.modular"
export GOPATH="/opt"

libpath=$(python3 -c 'import sysconfig; print(sysconfig.get_config_var("LIBDIR"))')
pythonlib=$(ls $libpath | grep "libpython3.*[0-9]\.so$")
export MOJO_PYTHON_LIBRARY=${libpath}/${pythonlib}


export DISPLAY=172.31.192.1:0.0


if [ "$PWD" = "$HOME" ]; then
  if [ -z "$TMUX" ]; then
    tmux
  else
    desk
    c
  fi
fi


