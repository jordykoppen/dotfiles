func! myspacevim#before() abort
  let mapleader = ","

  " navigate between splitting panes
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " use ss in insert or normal mode to save
  noremap ss :w<CR>

  " use jj as escape to exit insert mode
  inoremap jj <Esc>

  " use qq to close buffer in normalmode
  noremap qq :q<CR>

  " use so to source in normal mode
  noremap so :so $MYVIMRC<CR>

  nnoremap ; :
  nnoremap : ;

  " disable network history
  let g:netrw_dirhistmax = 0
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files

  " Start vim commit message in insert mode
  autocmd FileType gitcommit exec 'au VimEnter * startinsert'

  " Override default ignore pattern in file tree to still
  " show other . files
  let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'

  let g:vim_jsx_pretty_colorful_config = 1

  let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
endf
