# vim: ft=bash

# Checks if a command/alias/builtin is executable. Used in sourced modules.
is_available() {
  command -v "$1" >/dev/null 2>&1
}

# More specific config files
source "$ZDOTDIR/options.sh"
source "$ZDOTDIR/vim-mode.sh"
source "$ZDOTDIR/aliases.sh"
source "$ZDOTDIR/starship.sh"
source "$ZDOTDIR/fzf.sh"
source "$ZDOTDIR/completion.sh"
source "$ZDOTDIR/plugins.sh"

# Keep zcompdump in XDG_CACHE_HOME
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

#
# Path
#

# Remove duplicates from $PATH
typeset -U path

path=(
  # Custom scripts
  "$DOTFILES/scripts"

  $path
)