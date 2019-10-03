alias goto-downloads="cd ~/Downloads"
alias goto-chef="cd /Users/abrehm/links/hpsgithub/abrehm/chef/chef-repo"

alias kubectl-set-config-local="kubectl config use-context docker-for-desktop"
source <(kubectl completion bash)

code () {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

get_sha_256 () {
  curl "$1" | openssl dgst -sha256 #| awk -F' ' '{ print $2 }'
}

docker_ssh () {
  docker exec -it $1 /bin/bash
}

# command aliases
alias flush-dns="sudo killall -HUP mDNSResponder;echo 'DNS cache has been flushed'"
alias ipconfig="ifconfig | grep \"inet \" | grep -v 127.0.0.1 | cut -d\  -f2"
alias fix-missioncontrol="killall Dock"
alias ssh-noauth="ssh -o PreferredAuthentications=keyboard-interactive,password -o PubkeyAuthentication=no"

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias back="cd -"
alias bk=back
alias push-location='current_location_123456666=$(pwd); echo "PWD ("$current_location_123456666") saved..."'
alias pop-location='echo "cd" $current_location_123456666; cd $current_location_123456666'

# Color LS
ls="ls" #install coreutils for gls and better ls coloring support
if [ $ls == "ls" ]; then
  colorflag="-G"
else
  colorflag="--color"
fi
alias ls="command ${ls} ${colorflag}"
alias ll="${ls} -lahF ${colorflag}" # all files (including dotfiles), in long format
alias timestamp="ts '[%Y-%m-%d %H:%M:%S]'"

# Chef
alias chef-rspec='chef exec rspec'

. ~/.bash_extensions/knife_autocomplete.sh
#. ~/.bash_extensions/kitchen-completion.bash

# Git
alias git-reset-master='git fetch upstream && git checkout master && git reset --hard upstream/master && git push'
alias git-sync='git checkout master && git fetch upstream && git rebase upstream/master && git push origin master'
alias git-submodule-update='git submodule update --init --recursive'

. ~/.bash_extensions/git-completion.bash
. ~/.bash_extensions/git-prompt.sh

# Prompt
PS1="\[$COLOR_WHITE\]\u@\h \W"          # basename of pwd
PS1+="\[\$(git_color)\]"        # colors git status
PS1+="\$(git_branch)"           # prints current branch
PS1+="\[$COLOR_BLUE\] \$\[$COLOR_RESET\] "   # '#' for root, else '$'
export PS1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/abrehm/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/abrehm/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/abrehm/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/abrehm/Downloads/google-cloud-sdk/completion.bash.inc'; fi
