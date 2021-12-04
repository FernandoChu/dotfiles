let g:tex_conceal = ""
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_syntax_conceal = {
    \ 'accents': 0,
    \ 'cites': 0,
    \ 'fancy': 0,
    \ 'greek': 0,
    \ 'math_bounds': 0,
    \ 'math_delimiters': 0,
    \ 'math_fracs': 0,
    \ 'math_super_sub': 0,
    \ 'math_symbols': 0,
    \ 'sections': 0,
    \ 'styles': 0,
    \}
set conceallevel=2
hi clear conceal
