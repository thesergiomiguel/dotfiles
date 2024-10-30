# vim: ft=zsh

export DOTFILES="$HOME/dotfiles"

# Where user-specific configurations should be written (analogous to /etc).
export XDG_CONFIG_HOME="$HOME/.config"

# Where user-specific non-essential (cached) data should be written (analogous to /var/cache).
export XDG_CACHE_HOME="$HOME/.cache"

# Where user-specific data files should be written (analogous to /usr/share).
export XDG_DATA_HOME="$HOME/.local/share"

# Where user-specific state files should be written (analogous to /var/lib).
export XDG_STATE_HOME="$HOME/.local/state"

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Editor
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"
