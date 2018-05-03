alias goto-downloads="cd ~/Downloads"
alias goto-chef="cd ~/Documents/code/chef-repo"

code () {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

get_sha_256 () {
  curl "$1" | openssl dgst -sha256 | awk -F' ' '{ print $2 }'
}

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias back="cd -"
alias bk=back

# Color LS
ls="ls" #install coreutils for gls and better ls coloring support
if [ $ls == "ls" ]; then
  colorflag="-G"
else
  colorflag="--color"
fi
alias ls="command ${ls} ${colorflag}"
alias ll="${ls} -lahF ${colorflag}" # all files (including dotfiles), in long format

# Chef
alias chef-rspec='chef exec rspec'

# Git
alias git-reset-master='git fetch upstream && git checkout master && git reset --hard upstream/master && git push'
alias git-sync='git checkout master && git fetch upstream && git rebase upstream/master && git push origin master'
alias git-submodule-update='git submodule update --init --recursive && git submodule sync'

. ~/.bash_extensions/git-completion.bash
. ~/.bash_extensions/git-prompt.sh

# Prompt
PS1="\[$COLOR_WHITE\]\u@\h \W"          # basename of pwd
PS1+="\[\$(git_color)\]"        # colors git status
PS1+="\$(git_branch)"           # prints current branch
PS1+="\[$COLOR_BLUE\] \$\[$COLOR_RESET\] "   # '#' for root, else '$'
export PS1
