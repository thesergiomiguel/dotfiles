# Git connfig

## Setup

Set git user and email on a separate file in `$HOME`:

```bash
git config --file ~/.gituser user.name "..."
git config --file ~/.gituser user.email "..."
```

The name `.gituser` is not special, but our git config tries to include a file with that name on that location. Despite the name, it can be used to store other entries that we might not want to share with the world.

Then, just place `./git/` in `$XDG_CONFIG_HOME`:

```bash
ln -s $DOTFILES/git $XDG_CONFIG_HOME/git
```

## Dependencies

A few of the aliases depend on `fzf`, which is also a dependency for neovim, the `zsh` module and, in general, life.
