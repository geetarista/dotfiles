set lines=60
set columns=200
colorscheme oceanblack
if &background == "dark"
    hi normal guibg=black
    set transp=8
endif
set guioptions=egmrt " Tabs, grey menu items, menu bar, right scrollbar, tearoff menu items
set guioptions-=T " No toolbar
set showtabline=2
hi CursorLine guibg=Grey20
set guifont=DejaVu\ Sans\ Mono\ 12
