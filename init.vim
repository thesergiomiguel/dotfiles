" vim: foldmethod=marker

" {{{ 0. TODO
" - setup diagnostics
" - setup prettier/format on save
" - fzf
" - search files/text
" }}}

" {{{ 1. Settings
filetype plugin indent on
syntax on

set number
set norelativenumber
set nowrap

" Ignore case if all lowercase, keep case if otherwise
set ignorecase
set smartcase

" Number of lines to always show before and after the cursor
set scrolloff=7
set sidescrolloff=15

" Show search results while typing
set incsearch

" Don't unload abandoned buffers, instead hide them
set hidden

" Always show statusline
set laststatus=2

" Same for tabline
set showtabline=2

" Don't show current mode as it's already shown by lightline
set noshowmode

" When joining lines, never use two spaces
set nojoinspaces

" Move cursor to first non-blank column of the line
set startofline

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing extra message when using completion
set shortmess+=c

" Enable true color support
if (has("termguicolors"))
  set termguicolors
endif

" Setup persistent undo in default path
if (has("persistent_undo"))
  set undofile
endif

" Set \ as leader key
let mapleader = "\\"

" Number of spaces per tab
set tabstop=2

" Number of spaces per tab when editing
set softtabstop=2

" Number of spaces to use for autoindent
set shiftwidth=2

" Use spaces instead of tabs
set expandtab

" Copy indent from current line when starting a new line
set autoindent

" Extentions to look for when using `gf`
set suffixesadd+=.tsx,.ts,.js,.jsx,.scss,.css,.json
" }}}

" {{{ 2. Plugins
call plug#begin('~/.vim/plugged')
  " Editing
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'preservim/nerdcommenter'
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sickill/vim-pasta'

  " General
  Plug 'itchyny/lightline.vim'
    let g:lightline = {
          \ 'colorscheme': 'wombat',
          \ }

  " Colors
  Plug 'ayu-theme/ayu-vim'
  Plug 'jacoborus/tender.vim'
  Plug 'hardcoreplayers/oceanic-material'
    let g:oceanic_material_allow_bold=1
    let g:oceanic_material_allow_italic=1
    let g:oceanic_material_allow_underline=1
    let g:oceanic_material_allow_undercurl=1
    let g:oceanic_material_background = 'ocean'

  " Lang
  Plug 'HerringtonDarkholme/yats.vim'
call plug#end()
" }}}

" {{{ 3. Functions
" }}}

" {{{ 4. LSP
" }}}

" {{{ 5. Mappings
" Edit/reload init.vim
nnoremap <leader>ev <cmd>tabedit $MYVIMRC<cr>
nnoremap <leader>sv <cmd>source $MYVIMRC<cr>

" Toggle folds
nnoremap <space> za

" Toggle relativenumber
nnoremap <s-r> <cmd>set relativenumber!<cr>

" Navigate tabs
nnoremap <c-n> <cmd>Texplore<cr>
nnoremap <tab> gt
nnoremap <s-tab> gT

" Navigation
nnoremap H ^
nnoremap L $

" Editing
inoremap <esc> <nop>
inoremap jk <esc>

" Clear search highlight
nnoremap <c-l> <cmd>nohlsearch<cr>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" LSP specific

" nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<cr>
" nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.rename()<cr>
" nnoremap <silent> K          <cmd>lua vim.lsp.buf.hover()<cr>
" nnoremap <silent> gD         <cmd>lua vim.lsp.buf.implementation()<cr>
" nnoremap <silent> <c-k>      <cmd>lua vim.lsp.buf.signature_help()<cr>
" nnoremap <silent> 1gD        <cmd>lua vim.lsp.buf.type_definition()<cr>
" nnoremap <silent> gr         <cmd>lua vim.lsp.buf.references()<cr>
" nnoremap <silent> g0         <cmd>lua vim.lsp.buf.document_symbol()<cr>
" nnoremap <silent> gW         <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
" nnoremap <silent> gd         <cmd>lua vim.lsp.buf.declaration()<cr>
" }}}

" {{{ 6. AutoCommands
" autocmd BufEnter * lua require'completion'.on_attach()

" Open help window in horizontal split
autocmd FileType help wincmd H
" }}}

" {{{ 7. Colorschemes
set background=dark

colorscheme oceanic_material
" }}}
