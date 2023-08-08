syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set incsearch

" set term=ansi

set nofoldenable              " disable folding
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'brookhong/cscope.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'racer-rust/vim-racer'
Plug 'neomake/neomake'
Plug 'neovimhaskell/haskell-vim'
Plug 'LnL7/vim-nix'
Plug 'lifepillar/vim-mucomplete'
Plug 'https://git.sr.ht/~k1nkreet/gemivim'
Plug 'Chiel92/vim-autoformat'
call plug#end()

filetype plugin on
filetype plugin indent on

let g:neomake_open_list = 2
map M :Neomake<CR>
map mc :lclose<CR>
map mo :lopen<CR>
map mC :NeomakeClean<CR>:lclose<CR>

" mucomplete settings
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1

" rust
" let g:racer_cmd = "/home/k1nkreet/.cargo/bin/racer"
let g:racer_experimental_completer = 1
setlocal omnifunc=racer#RacerComplete

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END

map <F5> :NERDTreeToggle<CR> 
map <Leader>F :Files<CR>
map <Leader>f :GFiles --exclude-standard --others --cached<CR>
map <Leader>t :Tags<CR>
map <Leader>b :Buffers<CR>
map <Leader>a yiw :Ags <C-r>"<CR>

map gS :Git<CR>
map gC :Gcommit<CR>

"Command for case-sensitive search with ag
command! -bang -nargs=* Ags
  \ call fzf#vim#grep(
  \   'ag -s --hidden --no-group --column --color -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

noremap <F4> :set hlsearch! hlsearch?<CR>
set pastetoggle=<F2>

autocmd Filetype java setlocal ts=2 sw=2 expandtab
autocmd Filetype c,h setlocal ts=8 sw=8 expandtab
autocmd Filetype go setlocal ts=8 sw=8 noexpandtab
autocmd Filetype haskell setlocal ts=2 sw=2 expandtab

autocmd BufRead,BufNewFile *.h,*.c setlocal ts=8 sw=8 expandtab
colorscheme codefocus

map gx :GemivimGX<CR>
map <Leader>o :GemivimOpen<CR>
map <Leader>O :GemivimOpenBookmarks<CR>

" let g:formatdef_ormolu = '"ormolu"'
" let g:formatters_haskell = ['ormolu']

