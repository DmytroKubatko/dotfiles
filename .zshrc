# User configuration
export EDITOR='nvim'

# NVM - Lazy loaded for faster startup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# PATH exports
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

export PATH=~/.composer/vendor/bin:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH=$PATH:/opt/homebrew/bin/nvim

# Aliases
#

alias v='nvim'
alias cr='cursor'
alias cl='claude'

alias ls='eza'
alias lsa='eza -la'

# Git aliases 
alias lg='lazygit'
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
alias glgg='git log --graph'
alias gm='git merge'
alias gp='git push'
alias gst='git status'
alias gsw='git switch'
alias gswc='git switch --create'
alias gsu='git diff --name-only --diff-filter=U'

# Initialize Starship prompt
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/Users/dmitrijkubatko/.bun/_bun" ] && source "/Users/dmitrijkubatko/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/dmitrijkubatko/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
