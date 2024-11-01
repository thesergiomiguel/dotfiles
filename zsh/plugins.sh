# vim: ft=bash

# Z
source "$ZDOTDIR/vendor/zsh-z/zsh-z.plugin.zsh"

# Autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-beginning-search-backward-end history-beginning-search-forward-end)

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[k" history-beginning-search-backward-end
bindkey "^[j" history-beginning-search-forward-end

source "$ZDOTDIR/vendor/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax highlighting
# This is the one that needs to be set last.
source "$ZDOTDIR/vendor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
