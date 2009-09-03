set lines=60
set columns=180
colorscheme oceanblack
if &background == "dark"
    hi normal guibg=black
    set transp=8
endif
set guioptions=egmrt
set guioptions-=T " No toolbar
set showtabline=2
hi CursorLine guibg=Grey20
set columns=175
" set guioptions+=c
set guifont=DejaVu\ Sans\ Mono\ 12
