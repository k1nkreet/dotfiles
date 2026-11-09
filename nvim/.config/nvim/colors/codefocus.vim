" codefocus.vim is a colorscheme that let you focus on the code, not on the
" syntax highlightning.
"
" http://alexanderlobov.ru/posts/2018-01-25-codefocus-colorscheme/
" 
" * Comments are a bit darker that the main font
" * Strings use italics
" * Plain diffs supported

set background&
highlight clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "codefocus"

" hi Normal       ctermfg=none ctermbg=none
" "hi @comment     cterm=NONE ctermfg=Gray ctermbg=none
" "hi @string     cterm=NONE ctermfg=Gray ctermbg=none
" hi Comment      cterm=NONE ctermfg=Gray ctermbg=none
" hi String      cterm=NONE ctermfg=Gray ctermbg=none


hi Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

hi Comment ctermfg=Gray ctermbg=NONE guifg=Gray guibg=NONE
hi String  ctermfg=Gray ctermbg=NONE guifg=Gray guibg=NONE
hi link @comment Comment
hi link @string String

" Neutralize everything else
for group in [
  \ 'Constant','Identifier','Function','Statement',
  \ 'PreProc','Type','Special','Delimiter'
  \ ]
  exec 'hi' group 'ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE'
endfor

for group in [
  \ '@punctuation.bracket',
  \ '@punctuation.delimiter',
  \ '@punctuation.special',
  \ '@operator'
  \ ]
  exec 'hi' group 'ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE'
endfor

" hi Constant     cterm=NONE ctermfg=none
" hi Identifier   cterm=NONE ctermfg=none
" hi Function     cterm=NONE ctermfg=none
" hi Statement    cterm=NONE ctermfg=none
" hi PreProc      cterm=NONE ctermfg=none
" hi Type         cterm=NONE ctermfg=none
" hi Special      cterm=NONE ctermfg=none
" hi Delimiter    cterm=NONE ctermfg=none
" hi diffAdded    ctermfg=none
" hi diffRemoved  ctermfg=none
"hi Visual       ctermfg=none
"
hi Visual cterm=reverse ctermbg=NONE
hi ColorColumn ctermbg=NONE
hi Directory ctermfg=Blue
hi Title ctermfg=Green

" hi Visual cterm=reverse ctermbg=NONE
" hi ColorColumn  ctermbg=none
" hi Directory    ctermbg=NONE ctermfg=Blue
" hi Title        ctermbg=NONE ctermfg=Green
