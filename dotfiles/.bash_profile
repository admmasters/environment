export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\\n\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
export DEV="$HOME/Developer"
#export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/Developer/environment/scripts:$PATH"

#ALIASES
alias profile='vim ~/.bash_profile'
alias reload='source ~/.bash_profile'
alias ngitignore='echo "node_modules/\nbower_components/" >> .gitignore' 
alias dev='cd $DEV'
alias nuclide='cd $DEV/nuclide'
alias GET='curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET'
alias opensource="cd $DEV/open-source"
alias nuclide="cd $DEV/nuclide"

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
alias gA='git add -A'
alias gca='git commit -a -m'
alias grv='git checkout -- '
alias gnp='git push --set-upstream origin '
alias prettylog='git log --graph --color --all --decorate --oneline'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=$PATH:/opt/gradle/gradle-3.5/bin

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
