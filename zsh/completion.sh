# vim: ft=bash

autoload -U compinit

# Use XDG_CACHE_HOME to keep completions
[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh"

compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

zstyle ':completion:*' menu select # interactive search 
zstyle ':completion:*' completer _extensions _complete _approximate

# Group matches under descriptions (e.g. aliases, commands, corrections, ...)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Order matches
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

# Navigate menu using hjkl
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Toggle interactive mode with C-x i
bindkey -M menuselect '^xi' vi-insert
