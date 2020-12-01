call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ayu-theme/ayu-vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
"Plug 'yarisgutierrez/ayu-lightline'
Plug 'ryanoasis/vim-devicons'

Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

let g:vim_jsx_pretty_colorful_config = 1
