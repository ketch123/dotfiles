autoload -Uz compinit
compinit

# ------------------------------------------------------------------------PATH------------------------------------------------------------------------
export PATH=$HOME/.nodebrew/current/bin:$PATH

if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

export PATH="$HOME/.rbenv/shims:$PATH"

# gopath
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# nodepath
export PATH=$PATH:./node_modules/.bin

# for konnyaku
export PATH=$PATH:$HOME/konnyaku/bin

# for aws-iam-authenticator
export PATH=$PATH:$HOME/.aws-iam-authenticator

# ------------------------------------------------------------------------PATH------------------------------------------------------------------------


# ------------------------------------------------------------------------Config------------------------------------------------------------------------
# editor
export EDITOR=vim

# for zsh-autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# 自動補完関連
autoload -Uz compinit
compinit -u

# cd無しのディレクトリ移動
setopt auto_cd
alias ...='cd ../..'
alias ....='cd ../../..'

# cd後にls
chpwd() { ls -G  }

# history関連
export HISTSIZE=1000
export SAVEHIST=100000
setopt extended_history
setopt hist_ignore_dups

# コマンドのスペル訂正
setopt correct

#C-Uで行頭まで削除
bindkey "^U" backward-kill-line

# 色
autoload -Uz colors
colors

# emacsキーバインド
bindkey -e

# gitのブランチ情報を表示
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
precmd() { vcs_info }

# kawaii2行プロンプト
PROMPT='[%n:%{${fg[yellow]}%}%~%{${reset_color}%}]${vcs_info_msg_0_}
%(?.%B%F{green}.%B%F{blue})%(?!ʕ◔ϖ◔ʔ < !(;ʕ◔ϖ◔ʔ?? < )%f%b'
RPROMPT=''

# for aws_completer
source /usr/local/share/zsh/site-functions/_aws
source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh

# for kind completion
# source <(kind completion zsh)

# gcloud
export PATH=$PATH:/opt/google-cloud-sdk/bin
source /Users/ketch/google-cloud-sdk/path.zsh.inc
source /Users/ketch/google-cloud-sdk/completion.zsh.inc

# ------------------------------------------------------------------------Config------------------------------------------------------------------------


# ------------------------------------------------------------------------Alias------------------------------------------------------------------------
alias ls="ls -G"
alias la="ls -aG"
alias ll="ls -lG"
alias cl="clear"
alias d="docker"
alias chromedev="open /Applications/Google\ Chrome.app/ --args --disable-web-security --user-data-dir"
# 起動中のdockerコンテナのIPを表示するワンライナー
alias dip="docker ps -q|xargs docker inspect -f "{{.Name}}:{{.NetworkSettings.IPAddress}}""
alias dc="docker-compose"

# git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gb="git branch"
alias gch="git checkout"
alias gsb="git show-branch"
alias gsubupd="git submodule foreach git pull origin master"

# ip
alias myip="curl inet-ip.info"

# get status code by curl
alias sc-curl="(){curl -LI $1 -o /dev/null -w '%{http_code}\n' -s}"

# for kubernetes
alias k="kubectl"
alias mk="minikube"

source <(kubectl completion zsh)
complete -F __start_kubectl k

alias kctx="kubectx"
alias kns="kubens"

alias gcl="gcloud"

alias v="vagrant"

# for terraform
alias tf="terraform"

# for asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit
complete -o nospace -C /Users/ketch/.asdf/installs/terraform/0.12.29/bin/terraform terraform
# ------------------------------------------------------------------------Alias------------------------------------------------------------------------
