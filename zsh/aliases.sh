# vim: ft=bash

# Nvim
if is_available "nvim"; then
  alias vlb="nvim --cmd 'set background=light' -p"
  alias vdb="nvim --cmd 'set background=dark' -p"
  alias v="vdb"
fi

# Filesystem navigation
if is_available "eza"; then
  alias ls="eza -al"
  alias tree="eza -Tal -L 3 --no-permissions --no-user --no-time --no-filesize --icons=always"
fi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Add our custom fns path to $fpath and autoload all files in it
# This isn't working, so let's just source the files
# fpath=("$ZDOTDIR/functions" $fpath)

for func_file in $ZDOTDIR/functions/*; do
  # autoload -Uz "${func_file:t:r}"

  source "${func_file}"
done
