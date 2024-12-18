### PATH ###

export PATH="/c/Users/tommy/AppData/Local/Programs/Python/Python38:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/x86:$PATH"


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
alias "make"="nmake"
alias "m"="nmake"
alias "r"="nmake run"
alias "rr"="nmake rrun"

# Python
alias "py"="python"
alias "www"="python -m http.server 8000 --directory"
export PYTHONUNBUFFERED=1

# Go
alias "gmi"="go mod init"
alias "gb"="go build"

# Bash
alias "c"="clear"
alias "v"="vim"
alias ".."="cd .."
alias "now"='date +"%T"'
alias "clp"="clip.exe"
alias "clip"="clip.exe"
alias "desk"="cd /c/Users/tommy/Desktop"
alias "dpy"="cd /c/Programming"
alias "nc"="ncat"

# Web
alias "w"="tsc -w"
alias "rserve"="npm run serve"
alias "dev"="npm run start:dev"



###   PROMPT   ###
BLUE="\[\033[1;34m\]"
GREEN="\[\033[1;32m\]"
RED="\[\033[31m\]"
END="\[\033[00m\]"

EXITSTATUS="\`if [ \$? = 0 ]; then echo '${GREEN}'; else echo '${RED}'; fi\`"

export PS1="${EXITSTATUS}\u${END}:${BLUE}\w${END}$ "
