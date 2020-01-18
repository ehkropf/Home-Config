" Vim cpp after customizations.
" Ev Kropf <ehkropf@gmail.com>

" Only once per buffer.
if exists("b:did_after_ftplugin")
    finish
endif

let b:did_after_ftplugin = 1

" Auto closing stuff.
function s:ConditionalPairMap(open, close)
    return col('.') == col('$') ? a:open..a:close..repeat("\<Left>", len(a:close)) : a:open
endf

function s:CloseOver(close)
    return strpart(getline('.'), col('.')-1, 1) == a:close ? "\<Right>" : a:close
endf

inoremap <expr> ( <SID>ConditionalPairMap("(", ")")
inoremap <expr> ) <SID>CloseOver(")")
inoremap <expr> [ <SID>ConditionalPairMap("[", "]")
inoremap <expr> ] <SID>CloseOver("]")
inoremap <expr> { <SID>ConditionalPairMap("{", "}")
inoremap <expr> } <SID>CloseOver("}")

inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
