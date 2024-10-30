# vim: ft=bash
# See https://thevaluable.dev/fzf-shell-integration/

if is_available "fzf"; then
  source <(fzf --zsh)
fi

# Add git completions
_fzf_complete_git() {
  _fzf_complete -- "$@" < <(
    git --help -a | grep -E '^\s+' | awk '{print $1}'
  )
}

# Expand the following commands with only dirs
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"

# Use `fd`
if is_available "fd"; then
  export FZF_DEFAULT_COMMAND="fd --type f"
  export FZF_CTRL_T_COMMAND="fd --type f -H --exclude node_modules"
fi

# Look-and-feel
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
