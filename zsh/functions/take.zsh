# vim: ft=bash

# Cd into a path, creating it first if necessary
take() {
  # Check if an argument is given
  if [ -z "$1" ]; then
    return 1
  fi
  
  # Create the directory and its parents if needed
  mkdir -p "$1" && cd "$1"
}
