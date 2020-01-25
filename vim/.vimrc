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
Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype plugin on

map <F5> :NERDTreeToggle<CR> 
map <Leader>f :Files<CR>
map <Leader>t :Tags<CR>
map <Leader>b :Buffers<CR>
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
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

autocmd BufRead,BufNewFile *.h,*.c setlocal ts=9 sw=8 expandtab
colorscheme codefocus

let g:vista_default_executive = 'ctags'

" Tab-completion: "
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" / Tab-completion

" VimClap grep preview window for bright st
hi ClapPreview  ctermbg=187

" Coc settings
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> <Leader>y <Plug>(coc-type-definition)
nmap <silent> <Leader>i <Plug>(coc-implementation)
nmap <silent> <Leader>R <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>r <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

hi CocErrorSign  ctermfg=DarkRed guifg=#ff0000
