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

nnoremap ; :
nnoremap : ;

" NERDTree to :nt
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" nnoremap <silent> <Leader> :NERDTreeFind<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
 let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
   return "\<tab>"
    else
     return "\<c-p>"
    endif
endfunction

inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" fzf.vim
nnoremap <C-k> :BLines<Cr>
nnoremap <C-p> :Files<Cr>
nnoremap <leader>f :F<Cr>
nnoremap <leader>l :Lines<Cr>
nnoremap <leader>b :BLines<Cr>
