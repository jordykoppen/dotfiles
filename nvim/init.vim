set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set number relativenumber
set ruler
set encoding=utf8

set list
set lcs=extends:❯,precedes:❮,tab:>-
set number
set relativenumber
set ruler
set cursorline
set smartindent
set autoindent
set wrap
set linebreak
set wildmenu
set lazyredraw
set showmatch
set noshowmode " lightline shows the status not vim
set showtabline=2
set shortmess+=c
set updatetime=300
set signcolumn=yes

let b:ls = 'ls'

filetype plugin indent on   " allows auto-indenting depending on file type
filetype plugin on

syntax on                   " syntax highlighting

runtime! ./config/plugins.vim
runtime! ./config/nerdtree.vim
runtime! ./config/theme.vim
runtime! ./config/keybinds.vim
runtime! ./config/autocmd.vim
runtime! ./config/fzf.vim
runtime! ./config/statusline.vim
runtime! ./config/linters.vim
runtime! ./config/common.vim
runtime! ./config/utils.vim

highlight Comment cterm=italic
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi jsxAttrib gui=italic
hi htmlArg cterm=italic
hi jsxAttrib cterm=italic
hi Comment cterm=italic
hi Type cterm=italic
