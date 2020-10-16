syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set incsearch

" set term=ansi

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'brookhong/cscope.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

filetype plugin on

map <F5> :NERDTreeToggle<CR> 
map <Leader>F :Files<CR>
map <Leader>f :GFiles --exclude-standard --others --cached<CR>
map <Leader>t :Tags<CR>
map <Leader>b :Buffers<CR>
map <Leader>a yiw :Ags <C-r>"<CR>

map gS :Gstatus<CR>
map gC :Gcommit<CR>

"Command for case-sensitive search with ag
command! -bang -nargs=* Ags
  \ call fzf#vim#grep(
  \   'ag -s --no-group --column --color -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

noremap <F4> :set hlsearch! hlsearch?<CR>
set pastetoggle=<F2>

autocmd Filetype java setlocal ts=2 sw=2 expandtab
"autocmd Filetype c,h setlocal ts=8 sw=8 expandtab
autocmd Filetype go setlocal ts=8 sw=8 expandtab

autocmd BufRead,BufNewFile *.h,*.c setlocal ts=8 sw=8 expandtab
colorscheme codefocus

