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
set updatetime=300
set nobackup
set nowritebackup

" Show numbers in signcolumn
set signcolumn=number

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
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
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
  Plug 'jph00/swift-apple'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'coc_error', 'coc_warning', 'coc_hint', 'coc_info' ] ],
      \   'right': [ [ 'lineinfo',  ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_expand': {
      \   'coc_error'        : 'LightlineCocErrors',
      \   'coc_warning'      : 'LightlineCocWarnings',
      \   'coc_info'         : 'LightlineCocInfos',
      \   'coc_hint'         : 'LightlineCocHints',
      \   'coc_fix'          : 'LightlineCocFixes',
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
    let g:lightline.component_type = {
      \   'coc_error'        : 'error',
      \   'coc_warning'      : 'warning',
      \   'coc_info'         : 'tabsel',
      \   'coc_hint'         : 'middle',
      \   'coc_fix'          : 'middle',
      \ }
call plug#end()
" }}}

" {{{ 3. Functions
function! ToggleClipboard()
  let &clipboard = empty(&clipboard) ? "unnamed" : ""

  echo "Set clipboard value to \'" . &clipboard . "\'"
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Integrate coc with lightline's status bar
function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  return printf('%s %d', a:sign, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', '✘')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', '✘')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', '؟')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'H')
endfunction

autocmd User CocDiagnosticChange call lightline#update()
" }}}

" {{{ 4. LSP
" }}}

" {{{ 5. Mappings
" Editing
nnoremap <c-s> <cmd>write<cr>
nnoremap <c-q> <cmd>xit<cr>

" 'inside next parenthesis'
onoremap <silent> in( :<c-u>normal! f(vi(<cr>
" 'inside previous parenthesis'
onoremap <silent> in) :<c-u>normal! F(vi(<cr>

" Edit/reload init.vim
nnoremap <leader>ev <cmd>tabedit $MYVIMRC<cr>
nnoremap <leader>sv <cmd>source $MYVIMRC<cr>

" Toggle folds
nnoremap <space> za

" Toggle relativenumber
nnoremap <leader><s-r> <cmd>set relativenumber!<cr>

" Toggle clipboard
nnoremap <leader><s-c> <cmd>call ToggleClipboard()<cr>

" Navigate tabs and buffers
nnoremap <c-n> <cmd>Texplore<cr>
nnoremap <tab> gt
nnoremap <s-tab> gT
nnoremap <leader><tab> <cmd>bnext<cr>
nnoremap <leader><s-tab> <cmd>bprevious<cr>

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
inoremap <silent> <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<CR>"

" LSP specific
nmap <silent> K           <cmd>call <sid>show_documentation()<cr>
nmap <silent> <c-k>       <plug>(coc-diagnostic-prev)
nmap <silent> <c-j>       <plug>(coc-diagnostic-next)
nmap <silent> <leader>gd  <plug>(coc-definition)
nmap <silent> <leader>gs  <cmd>call CocAction('jumpDefinition', 'split')<cr>
nmap <silent> <leader>gv  <cmd>call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> <leader>gt  <cmd>call CocAction('jumpDefinition', 'tabe')<cr>
nmap <silent> <leader>rn  <plug>(coc-rename)
nmap <silent> 1gd         <plug>(coc-type-definition)
nmap <silent> gd          <plug>(coc-implementation)
nmap <silent> gr          <plug>(coc-references)
xmap <silent> <leader>f   <plug>(coc-format-selected)
nmap <silent> <leader>f   <cmd>Prettier<cr>
nnoremap <leader>cf <cmd>CocAction<cr>

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

" {{{ 6. Commands/AutoCMDs
" autocmd BufEnter * lua require'completion'.on_attach()

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Open help window in horizontal split
autocmd FileType help wincmd H
" }}}

" {{{ 7. Colorschemes
set background=dark

colorscheme oceanic_material
" }}}
