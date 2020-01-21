" codefocus.vim is a colorscheme that let you focus on the code, not on the
" syntax highlightning.
"
" http://alexanderlobov.ru/posts/2018-01-25-codefocus-colorscheme/
" 
" * Comments are a bit darker that the main font
" * Strings use italics
" * Plain diffs supported

set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "codefocus"

hi Normal      ctermfg=none ctermbg=none
hi Comment     cterm=NONE ctermfg=Gray ctermbg=none
hi String      cterm=NONE ctermfg=Gray ctermbg=none
hi Constant    cterm=NONE ctermfg=none
hi Identifier  cterm=NONE ctermfg=none
hi Function    cterm=NONE ctermfg=none
hi Statement   cterm=NONE ctermfg=none
hi PreProc     cterm=NONE ctermfg=none
hi Type          cterm=NONE ctermfg=none
hi Special     cterm=NONE ctermfg=none
hi Delimiter   cterm=NONE ctermfg=none
hi diffAdded   ctermfg=none
hi diffRemoved ctermfg=none
hi Visual      ctermfg=none
hi ColorColumn ctermbg=none
hi Directory   ctermbg=NONE ctermfg=Blue
hi Title       ctermbg=NONE ctermfg=Green
