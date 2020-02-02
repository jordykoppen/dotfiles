call plug#begin('~/.config/nvim/plugged')
Plug 'wikitopian/hardmode'
" NERDTree ofcourse
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" NERDTree GIT plugin for showing changes.
Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim test
Plug 'janko/vim-test'
" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
" Material Theme
Plug 'kaicataldo/material.vim'
Plug 'morhetz/gruvbox'
Plug 'connorholyday/vim-snazzy'
" Devicons for NERDTree
Plug 'ryanoasis/vim-devicons'
" NERDTree file/folder colors.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" GIT
Plug 'tpope/vim-fugitive' 
Plug 'zivyangll/git-blame.vim'
" Insert, changing quotes, parens, elements, etc. around blocks.
Plug 'tpope/vim-surround'
" Syntax checking
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" coc extensions
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'quramy/tsuquyomi'
Plug 'hail2u/vim-css3-syntax'
Plug 'mlaursen/vim-react-snippets'
Plug 'SirVer/ultisnips'
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'
"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
Plug 'dikiaap/minimalist'
" Statusline.
" Plug 'vim-airline/vim-airline'
" Statusline themes.
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
" JS linters and formatters
Plug 'eslint/eslint'
Plug 'prettier/prettier'
" Duplicate cursors
Plug 'terryma/vim-multiple-cursors'
" Inline css colors
Plug 'ap/vim-css-color'
" JSX highlighting
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'

Plug 'GabrieleLippi/yarn-vim'

" Startscreen
Plug 'mhinz/vim-startify'
" Everything to do with fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

