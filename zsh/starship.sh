# vim: ft=bash

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

if is_available "starship"; then
  eval "$(starship init zsh)"
fi
