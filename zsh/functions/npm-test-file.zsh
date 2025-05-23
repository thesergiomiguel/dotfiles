# vim: ft=bash

npm-test-file() {
# Check if package.json exists
if [[ ! -f package.json ]]; then
  echo "package.json not found in the current directory."
  return 1
fi

  # Extract script names from package.json using jq
  local scripts
  scripts=$(jq -r '.scripts | to_entries[] | "\(.key) -> \(.value)"' package.json)

  # Check if there are multiple scripts with "test" or "e2e" in their names
  local test_scripts
  test_scripts=$(echo "$scripts" | grep -i -E 'test|e2e')

  # Count the number of matching scripts
  local test_script_count
  test_script_count=$(echo "$test_scripts" | wc -l)

  # If there's only one "test" script and no other conflicting scripts, run it directly
  if [[ $test_script_count -eq 1 ]] && echo "$test_scripts" | grep -qi 'test'; then
    local selected_script
    selected_script=$(echo "$test_scripts" | awk -F' -> ' '{print $2}')
  else
    # Otherwise, use fzf to select a script
    selected_script=$(echo "$scripts" | fzf --height 40% --reverse --prompt="Select a script: " | awk -F' -> ' '{print $2}')
  fi

  if [[ -z "$selected_script" ]]; then
    echo "No script selected."
    return 1
  fi

  # Use fzf to select a file path, excluding node_modules
  local selected_path
  selected_path=$(find . -type d \( -name node_modules -o -name .git \) -prune -o -type f -print | fzf --height 40% --reverse --prompt="Select a file: ")

  if [[ -z "$selected_path" ]]; then
    echo "No file selected."
    return 1
  fi

  # Construct the final command
  local command
  command=$(echo "$selected_script" | sed 's/ [^ ]*$/ /')"$selected_path"
  command="npx $command"

  # Print the command to the CLI, ready for execution
  echo "$command"
  eval "$command"
}

# Register the function as a ZLE widget
zle -N npm-test-file

# Map C-x C-n to npm-select-script
bindkey "^X^T" npm-test-file

