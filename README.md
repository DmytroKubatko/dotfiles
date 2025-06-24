# Dotfiles Configuration

This repository contains my personal dotfiles and configuration files for various development tools.

## Fast CLI Tools Installation

These are modern, fast alternatives to common CLI tools, many written in Rust:

### Installation

Install all tools at once using Homebrew:

```bash
brew install ripgrep fd bat eza zoxide dust procs hyperfine git-delta tokei
```

### Tools Overview

#### Search & Text Processing
- **ripgrep (`rg`)** - Fast grep alternative
  - Usage: `rg "pattern" --type py`
  - [Documentation](https://github.com/BurntSushi/ripgrep)

- **fd** - Fast find alternative
  - Usage: `fd filename`
  - [Documentation](https://github.com/sharkdp/fd)

#### File Listing & Display
- **bat** - Cat with syntax highlighting
  - Usage: `bat filename.py`
  - [Documentation](https://github.com/sharkdp/bat)

- **eza** - Modern ls replacement
  - Usage: `eza -la` or `eza --tree`
  - [Documentation](https://github.com/eza-community/eza)

#### Navigation
- **zoxide** - Smarter cd command
  - Usage: `z project` (jumps to frequently used directories)
  - [Documentation](https://github.com/ajeetdsouza/zoxide)
  - Setup: Add to shell config: `eval "$(zoxide init zsh)"`

#### System Monitoring
- **dust** - Better du replacement
  - Usage: `dust` (shows disk usage in tree format)
  - [Documentation](https://github.com/bootandy/dust)

- **procs** - Modern ps replacement
  - Usage: `procs` (shows processes with colors)
  - [Documentation](https://github.com/dalance/procs)

#### Development Tools
- **hyperfine** - Command-line benchmarking
  - Usage: `hyperfine 'command1' 'command2'`
  - [Documentation](https://github.com/sharkdp/hyperfine)

- **git-delta** - Better git diff viewer
  - Usage: Configure as git pager (see setup below)
  - [Documentation](https://github.com/dandavison/delta)

- **tokei** - Code statistics
  - Usage: `tokei` (counts lines of code)
  - [Documentation](https://github.com/XAMPPRocky/tokei)

### Configuration Setup

#### Git Delta
Add to your `~/.gitconfig`:
```ini
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true
    side-by-side = true
```

#### Zoxide
Add to your shell configuration file:
```bash
# For zsh
eval "$(zoxide init zsh)"

# For bash
eval "$(zoxide init bash)"
```

## Starship Prompt Installation

Starship is a minimal, blazing-fast, and infinitely customizable prompt for any shell.

### Installation

```bash
# Install starship
brew install starship

# Or using curl
curl -sS https://starship.rs/install.sh | sh
```

### Setup

Add the following to your shell configuration file:

#### For Zsh (`~/.zshrc`)
```bash
eval "$(starship init zsh)"
```

#### For Bash (`~/.bashrc`)
```bash
eval "$(starship init bash)"
```

#### For Fish (`~/.config/fish/config.fish`)
```fish
starship init fish | source
```

### Configuration

Starship configuration is stored in `~/.config/starship.toml`. You can customize it extensively.

Example basic configuration:
```toml
format = """
$all$character"""

[character]
success_symbol = "[➜](bold green)"
error_symbol = "[➜](bold red)"
```

### Resources
- [Starship Documentation](https://starship.rs/)
- [Configuration Reference](https://starship.rs/config/)
- [Presets](https://starship.rs/presets/)

## Quick Start Commands

Try these commands to see the improvements:
```bash
# Search for text in files
rg "TODO" --type py

# Find files
fd "config"

# Better file listing
eza -la --tree

# Smart navigation (after using directories)
z projects

# View file with syntax highlighting
bat ~/.zshrc

# Check disk usage
dust

# View processes
procs

# Benchmark commands
hyperfine 'ls' 'eza'

# Code statistics
tokei
```