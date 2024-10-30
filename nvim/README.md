# Nvim

## Bootstrap

- `ln -s $DOTFILES/nvim .config/nvim`

And then simply run `nvim` (or `v`, if the `zsh` module has been setup) to let it bootstrap itself.

## General dependencies

- `telescope-fzf-native` requires `cmake`.
- `fd`, `rg` and `fzf`

## LSP/formatter dependencies

- [typescript tools](https://github.com/typescript-language-server/typescript-language-server)
- [cssls, jsonls and eslint](https://github.com/hrsh7th/vscode-langservers-extracted)
- [rustaceanvim](https://rust-analyzer.github.io/)
- [lua_ls](https://github.com/luals/lua-language-server)

Other lang servers used, e.g. tailwind, may be only temporary and I will not list them here.
