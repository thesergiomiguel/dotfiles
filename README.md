# My dotfiles

## Components

### Nvim

#### Setup

- `ln -s <dotfiles>/nvim .config/nvim`

#### General dependencies

- `brew install cmake` (used with telescope-fzf-native)
- `brew install fd`

FZF itself is installed as a dependency of nvim-bqf.

#### LSP/formatter dependencies

- [typescript tools](https://github.com/typescript-language-server/typescript-language-server)
- [cssls, jsonls and eslint](https://github.com/hrsh7th/vscode-langservers-extracted)
- [rustaceanvim](https://rust-analyzer.github.io/)
- [lua_ls](https://github.com/luals/lua-language-server)

Other lang servers used, e.g. tailwind, may be only temporary and I will not list them here.

## Todo

- Add missing components: wezterm, zsh, omz, starship, ...
- Automate dependency/utils installation
