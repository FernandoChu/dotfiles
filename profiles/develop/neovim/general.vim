set number
set mouse=a
let g:sneak#label = 1

" Spell Checking
set spelllang=en,es,cjk
set spellsuggest=best,9
nnoremap <silent> <F3> :set spell!<CR>
inoremap <silent> <F3> <C-O>:set spell!<CR>
