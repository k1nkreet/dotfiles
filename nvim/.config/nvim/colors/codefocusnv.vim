" ================================
" Codefocus – distraction-free
" ================================

if exists("g:colors_name")
  finish
endif

let g:colors_name = "codefocus"

set background&

" Hard reset
highlight clear
if exists("syntax_on")
  syntax reset
endif

" ================================
" Base UI
" ================================

hi Normal       ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi Visual       cterm=reverse ctermbg=NONE guibg=NONE
hi ColorColumn  ctermbg=NONE guibg=NONE
hi CursorLine   ctermbg=NONE guibg=NONE
hi LineNr       ctermfg=NONE guifg=NONE
hi CursorLineNr ctermfg=NONE guifg=NONE
hi SignColumn   ctermbg=NONE guibg=NONE
"hi StatusLine   ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
"hi StatusLineNC ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi Title cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" ================================
" Intentional color
" ================================

hi Comment ctermfg=Gray guifg=Gray
hi String  ctermfg=Gray guifg=Gray

" ================================
" Completion menu
" ================================

hi Pmenu      cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi PmenuSel   cterm=reverse gui=reverse ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi PmenuSbar  cterm=NONE gui=NONE ctermbg=NONE guibg=NONE
hi PmenuThumb cterm=reverse gui=reverse
hi PmenuExtra     cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi PmenuExtraSel  cterm=reverse gui=reverse

" ================================
" Floating windows (Coq completion, hover, docs)
" ================================

hi NormalFloat cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi FloatBorder cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi FloatTitle  cterm=NONE gui=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" ================================
" Legacy syntax – neutralize
" ================================

for group in [
  \ 'Constant','Identifier','Function','Statement','PreProc',
  \ 'Type','Special','Delimiter','Operator','Keyword','Directory'
  \ ]
  exec 'hi' group 'ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE'
endfor

" ================================
" Tree-sitter – explicit overrides
" ================================

" Intentional
hi @comment ctermfg=Gray guifg=Gray
hi @string  ctermfg=Gray guifg=Gray

" Everything else
for group in [
  \ '@function','@method','@constructor',
  \ '@variable','@parameter','@property',
  \ '@keyword','@keyword.return','@keyword.operator',
  \ '@type','@type.builtin','@type.definition',
  \ '@constant','@constant.builtin',
  \ '@operator',
  \ '@punctuation.bracket',
  \ '@punctuation.delimiter',
  \ '@punctuation.special',
  \ '@field','@namespace','@module',
  \ '@label'
  \ ]
  exec 'hi' group 'ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE'
endfor

" ================================
" LSP semantic tokens – kill them
" ================================

for group in [
  \ '@lsp.type.function','@lsp.type.method',
  \ '@lsp.type.variable','@lsp.type.parameter',
  \ '@lsp.type.property','@lsp.type.keyword',
  \ '@lsp.type.type','@lsp.type.class',
  \ '@lsp.type.interface','@lsp.type.enum',
  \ '@lsp.type.namespace','@lsp.type.operator',
  \ '@lsp.mod.readonly','@lsp.mod.constant'
  \ ]
  exec 'hi' group 'ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE'
endfor

hi Visual       cterm=reverse gui=reverse
hi CursorLine   cterm=NONE gui=NONE ctermbg=NONE guibg=NONE
hi CursorColumn cterm=NONE gui=NONE ctermbg=NONE guibg=NONE

