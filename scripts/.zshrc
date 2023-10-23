export ZSH=$HOME/.oh-my-zsh
 
if [[ ! -f ~/.zpm/zpm.zsh ]]; then
 git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
fi
source ~/.zpm/zpm.zsh
 
zpm load zpm-zsh/material-colors

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fino"
 
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git autojump)
source $ZSH/oh-my-zsh.sh
 
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
 
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
 
# Code completion
if [ -f '~/Documents/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/matthew/Documents/dev/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/Documents/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/matthew/Documents/dev/google-cloud-sdk/completion.zsh.inc'; fi
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
complete -C /usr/local/bin/terraform terraform
complete -F __start_kubectl k
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
 
# Alias
alias tw='cd ~/Documents/dev/tw'
alias dev='cd ~/Documents/dev'
alias ducks='du -cks * | sort -rn | head -11'
alias top=vtop
alias talisman=$TALISMAN_HOME/talisman_darwin_amd64
alias ls='ls -fla'
alias c='clear'
alias check-port='f() { echo checking port $1; lsof -i:$1 };f'
alias kill-port='f() { echo killing process on port $1; {kill -9 $(lsof -ti tcp:$1) && echo done} || echo no process running };f'
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

alias projector=". secrets.sh"
alias k="kubectl"
alias kc="kubectx"
alias mk="minikube"
 
alias py="python3"
alias pyp="pip3"
alias python="python3"
alias pip="pip3"

alias please="make"

alias gitme="git config user.email"

alias software="software.sh"
alias repos="repos.sh"
alias pairing="pairing.sh"

# Python
export PATH="$HOME/Library/Python/3.10/bin:$PATH"

# Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
 
# Node
eval "$(nodenv init -)"
 
# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# export GEM_HOME="$HOME/.gem"

#Enable docker build kit for faster builds
DOCKER_BUILDKIT=1
 
# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
 
# dotnet
export PATH="/usr/local/share/dotnet:~/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands:$PATH"
 
# Talisman
export TALISMAN_HOME=~/.talisman/bin
 
# Golang
export GO_PATH=/usr/local/go
export GOPATH=$HOME/go-workspace
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$GOPATH/bin:$PATH
 
# Guile setup
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
 
# Polygot code scanner
export PATH="~/Documents/dev/polygot/releases/polyglot-code-scanner-v0.2.1-x86_64-apple-darwin:$PATH"

# Python
# Set within /usr/local/bin instead
# export PATH="/Users/matthew/Library/Python/3.9/bin:$PATH"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Minikube
# eval $(minikube docker-env)
# minikube -p minikube docker-env

. "$HOME/.cargo/env"

# GCP
# Terraform
complete -o nospace -C /usr/local/Cellar/tfenv/2.2.2/versions/1.0.11/terraform terraform
export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/matthew/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/matthew/google-cloud-sdk/completion.zsh.inc'; fi
export GPG_TTY=$(tty)

#Polygot tool
export PATH=~/Documents/dev/polygot-code-scanner:$PATH
