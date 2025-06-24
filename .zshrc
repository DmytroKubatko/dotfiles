# User configuration
export EDITOR='nvim'

# NVM - Lazy loaded for faster startup
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

# PATH exports
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

export PATH=~/.composer/vendor/bin:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH=$PATH:/opt/homebrew/bin/nvim

# Aliases

alias ls='eza'
alias lsa='eza -la'

# Git aliases 
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gc='git commit --verbose'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias gl='git pull'
alias glgg='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'''
alias gm='git merge'
alias gp='git push'
alias gst='git status'
alias gsw='git switch'
alias gswc='git switch --create'

# Initialize Starship prompt
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
