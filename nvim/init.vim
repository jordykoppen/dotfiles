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
set guifont="SF Mono Powerline":h11
set number relativenumber
set ruler

filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/theme.vim
source ~/.config/nvim/config/keybinds.vim
source ~/.config/nvim/config/autocmd.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/airline.vim
