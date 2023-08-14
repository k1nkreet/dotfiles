set nocompatible
set hlsearch
set incsearch
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent

set guicursor=i:block
colorscheme codefocus

set syntax=off
filetype plugin on
filetype plugin indent on

call plug#begin("~/.vim/plugged")
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'neovim/nvim-lspconfig'
call plug#end()

map <F4> :set hlsearch! hlsearch?<CR>
map <F5> :NERDTreeToggle<CR> 
map <Leader>F :Files<CR>
map <Leader>f :GFiles --exclude-standard --others --cached<CR>
map <Leader>t :Tags<CR>
map <Leader>b :Buffers<CR>
map <Leader>a yiw :Ags <C-r>"<CR>

command! -bang -nargs=* Ags
  \ call fzf#vim#grep(
  \   'ag -s --no-group --column --color -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

augroup auFileTypes
    autocmd!
    autocmd FileType markdown setlocal textwidth=100
augroup end

" completion
let g:coq_settings = { 'auto_start': 'shut-up' }

" spellchecks
set spelllang=en
set spellsuggest=best,9
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

lua require('treesitter')
lua require('lsp')
