syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set incsearch

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'brookhong/cscope.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'lifepillar/vim-mucomplete'
Plug 'davidhalter/jedi-vim'
Plug 'xavierd/clang_complete'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'vim-syntastic/syntastic'
Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') }
Plug 'liuchengxu/vista.vim'
call plug#end()

filetype plugin on

map <F5> :NERDTreeToggle<CR> 
map <Leader>f :Clap files<CR>
map <Leader>t :Tags<CR>
" map <Leader>b :Buffers<CR>
" map <Leader>a yiw :Ag <C-r>"<CR>
map <Leader>a :Clap grep ++query=<cword><CR>
map <Leader>l :Clap lines<CR>
" let $FZF_DEFAULT_COMMAND= 'ag -g ""'

map gS :Gstatus<CR>
map gC :Gcommit<CR>

" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 '--ignore={tags,cscope*}',
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

noremap <F4> :set hlsearch! hlsearch?<CR>
set pastetoggle=<F2>

autocmd Filetype java setlocal ts=2 sw=2 expandtab
"autocmd Filetype c,h setlocal ts=8 sw=8 expandtab
autocmd BufRead,BufNewFile *.h,*.c setlocal ts=9 sw=8 expandtab
colorscheme codefocus

let g:vista_default_executive = 'ctags'

" mucomplete options
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c " Shut off copmletion messages
set belloff+=ctrlg " If Vim beeps during completion
" mucopmlete python
set completeopt-=preview
set completeopt+=longest
let g:jedi#popup_on_dot = 1
let g:mucomplete#enable_auto_at_startup = 0
" mucomplete c++
set noinfercase
let g:clang_library_path = '/usr/lib/libclang.so'
let g:clang_user_options = '-std=c++14'
let g:clang_complete_auto = 1
let g:clang_auto_select = 2
let g:clang_hl_error = 1
let g:clang_jumpto_declaration_key = "<C-P>"
let g:clang_complete_macros = 1

" syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
