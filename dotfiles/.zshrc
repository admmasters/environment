export ZSH=~/.oh-my-zsh

ZSH_THEME=""

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git brew terminalapp osx history npm docker yarn)

source $ZSH/oh-my-zsh.sh

export SSH_KEY_PATH="~/.ssh/rsa_id"
export DEV="$HOME/Developer"
export ZOPA="$DEV/github/zopaUK"
export REACT_EDITOR=code-insiders

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME=${HOME}/Library/Android/sdk

#PATH
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$DEV/environment:$PATH"
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=$PATH:/opt/gradle/gradle-3.5/bin
export PATH=${PATH}:/Applications/Genymotion.app/Contents/MacOS
export GOPATH=$DEV/go
export PATH=$PATH:$(go env GOPATH)/bin

#Ignore Terminal Updating
stty -ixon

#Pure Theme
autoload -U promptinit; promptinit
prompt pure
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#ALIASES
alias profile='vim ~/.zshrc'
alias rl='source ~/.zshrc; clear;'
alias ngitignore='echo "node_modules/\nbower_components/" >> .gitignore' 
alias dev='cd $DEV'
alias nuclide='cd $DEV/nuclide'
alias GET='curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET'
alias opensource="cd $DEV/open-source"
alias nuclide="cd $DEV/nuclide"
alias zopa="cd $DEV/github/zopaUK"
alias quopa="cd $DEV/github/zopaUK/quopa"
alias hub="cd $DEV/github/zopaUK/ZEOSHub"

#CHROME
alias cdebug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'
alias cdebug2='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222'

#GIT
alias gs='git status'
alias gds='git diff --staged'
alias gc='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gnb='git checkout -b'
alias ga='git add'
alias gaa='git add -A'
alias gca='git commit -a -m'
alias grv='git checkout -- '
alias gnp='git push --set-upstream origin '
alias plog='git log --graph --color --all --decorate --oneline'

alias lbs='lerna bootstrap'
alias tks="tmux kill-session -t $1"
alias yt='yarn typecheck'
alias ys='yarn start'
alias yc='yarn compile'
alias ysd='yarn start:dev'
alias yr='rm -rf node_modules && yarn'
alias yi='yarn'
alias zp="cd ${ZOPA}"
alias qp="cd ${ZOPA}/quopa"
alias zn="cd ${ZOPA}/zeos-native"
alias zl="cd ${ZOPA}/zeos-libs"
alias ycd="yarn compile:dev"
alias vim=nvim
alias fdns='sudo killall -HUP mDNSResponder; sleep 2; echo macOS DNS Cache Reset | say'
alias t1="tree -L 1"
alias clo="cd $DEV/go/src/github.dns.ad.zopa.com/zopaUK/clogger"
alias libs=$DEV/github/zopaUK/zeos-libs

function _yat {
  yarn add @types/$1
}
alias yat=_yat
alias cloggerimac='rsync -azP ~/Developer/go/src/github.dns.ad.zopa.com/ matthewrevell@192.168.1.222:~/Developer/go/src/github.dns.ad.zopa.com'
alias piazza="cd ${ZOPA}/piazza"

function _gitToKey {
  git remote set-url origin keybase://private/admmasters/$1
}

function _gitToZopa {
  git remote set-url origin git@github.dns.ad.zopa.com:zopaUK/$1.git
}

alias qkey=_gitToKey
alias qor=_gitToZopa quopa


