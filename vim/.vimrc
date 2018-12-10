syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set incsearch

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required

call plug#begin('~/.vim/plugged')
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'brookhong/cscope.vim'
call plug#end()

filetype plugin on
set omnifunc=syntaxcomplete#Complete


map <F5> :NERDTreeToggle<CR> 
map <Leader>f :Files<CR>
map <Leader>t :Tags<CR>
map <Leader>b :Buffers<CR>
map <Leader>a yiw :Ag <C-r>"<CR>
let $FZF_DEFAULT_COMMAND= 'ag -g ""'
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 '--ignore={tags,cscope*}',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

noremap <F4> :set hlsearch! hlsearch?<CR>


" augroup refresh_ctags
"     autocmd!
"     au BufWritePost *.py,*.c,*.cpp,*.h silent! !eval '(cd /home/k1nkreet/Work/datalore-super/datalore-notebook/python-runtime/src/main/cpp; ctags -R --exclude=bazel-* -o newtags; mv newtags tags)' &
"     au BufWritePost *.py,*.c,*.cpp,*.h silent! !eval '(cd /home/k1nkreet/Work/datalore-super/datalore-notebook/python-runtime/src/main/python; ctags -R --exclude=bazel-* -o newtags 2>/dev/null; mv newtags tags)' &
" augroup END
autocmd Filetype java setlocal ts=2 sw=2 expandtab
