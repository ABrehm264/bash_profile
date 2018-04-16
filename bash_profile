
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias ll="ls -al"
alias cgrep="grep --color=always"

alias chef-rspec='chef exec rspec'

code () {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

# Resets local and origin master to look like upstream.
alias git-reset-master='git fetch upstream && git checkout master && git reset --hard upstream/master && git push'
alias git-sync='git checkout master && git fetch upstream && git rebase upstream/master && git push origin master'
alias git-submodule-update='git submodule update --init --recursive && git submodule sync'

# Begin: Git in shell helpers
source ~/.git-completion.sh
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
# End: Git in shell helpers

export CLICOLOR=1
export LSCOLORS=gxGxhxDxhxhxhxhxhxcxcx
