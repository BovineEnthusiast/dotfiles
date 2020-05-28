export PATH=/usr/local/sbin:$(brew --prefix openvpn)/sbin:$HOME/bin:/usr/local/bin:~/.npm-global/bin:$PATH
export ZSH=/Users/dennissubachev/.oh-my-zsh

# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# Shows dots when waiting for tab completion to finish
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# git provides aliases
# sudo lets you double click esc to add sudo
# z lets you jump to directories
# bgnotify will send a notification when long running commands complete

# zsh-syntax-highlighting highlights typed commands
# ^^ requires git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autocomplete
# ^^ requires git@github.com:marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
plugins=(git sudo z bgnotify zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Env variables
source ~/.zshrc.env

# Make code the editor
VISUAL='code --wait --new-window'
EDITOR='/usr/bin/vi'

export VISUAL EDITOR
export DOCKER_BUILDKIT=1

alias config='code ~/.zshrc'
alias d-c='docker-compose'
alias d='docker'
alias db='docker build'
alias dc='docker container'
alias di='docker image'
alias dlcheck='npm run compile:check && git fetch -tfp && npm run nghm lint && npx nx affected --target=test --base=origin/master --parallel'
alias dlvpn='sudo openvpn --config ~/vpn/vpn-mgm-dsubachev.ovpn'
alias dn='docker network'
alias dnsclean='sudo killall -HUP mDNSResponder'
alias ds='docker swarm'
alias dv='docker volume'
alias gbh='git fetch -tpf && git cherry HEAD origin/master'
alias ggb="git branch | grep \* | cut -d ' ' -f2 | pbcopy"
alias grmb='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gtlg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)' --all"
alias grbom="git fetch -tpf && git rebase origin/master"
alias hc="helm create"
alias hi="helm install"
alias hid="helm install --debug --dry-run"
alias hu="helm uninstall"
alias ip='curl ifconfig.me'
alias k='kubectl'
alias kesh="\$(kubectl get pods --all-namespaces | sed 1d | awk '{print \$1,\$2}' | fzf | awk '{print \"kubectl exec -it --namespace=\"\$1,\$2\" /bin/sh\"}') || echo The selected pod does not have sh"
alias kg='kubectl get'
alias kga='kubectl get all'
alias kgd='kubectl get deployments'
alias kge='kubectl get events --sort-by=.metadata.creationTimestamp'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kl='kubectl logs'
alias ng="npx ng"
alias pcat='pygmentize -f terminal256 -O style=native -g'
alias plz='sudo !!'
alias refresh='source ~/.zshrc'
alias tf='terraform'
alias whoisport='sudo lsof -i'
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
