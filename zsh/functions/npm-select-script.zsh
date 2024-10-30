# vim: ft=bash

# Select a script from package.json to run.
npm-select-script() {
  local script

  if [[ ! -f package.json ]]; then
    return
  fi

  script=$(cat package.json | jq -r '.scripts | keys[] ' | sort | fzf) && npm run $(echo "$script")
}

# Register the function as a ZLE widget
zle -N npm-select-script

# Map C-x C-n to npm-select-script
bindkey "^X^N" npm-select-script

