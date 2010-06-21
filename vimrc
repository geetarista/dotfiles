set nocompatible " no vi compatibility

filetype on
filetype plugin indent on " load filetype plugins/indent settings
syntax on "Syntax highlighting

" General settings
set ruler " Show cursor position
set number " Show line numbers
set novisualbell  " No blinking
set noerrorbells  " No noise
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:< " Show $ at end of line and trailing space as ~
set laststatus=2  " Always show status line
set cursorline
set autoread "Set to auto read when a file is changed from the outside
set history=25 "Set how many commands to retain in history
set showmatch " Show matching brackets.
set mat=5 " Bracket blinking.
set linebreak " Break lines at whole words only
set showbreak=… " Visually differentiate a wrapped line from others
set wildignore+=*.swo,*.swp,*.jpg,*.png,*.gif,.git,log/*,vendor/*,tmp/*,script/*

" Do not use swapfiles or backup since writebackup is used
" writebackup is still used, so a copy is always kept in memory
set nobackup " Do not write backup files to disk
set noswapfile " Do not use swapfiles (they have trouble with large files)

" Tabs
set tabstop=2 " Use 2 spaces for tabs
set smarttab " Automatic indenting
set shiftwidth=2
set autoindent
set expandtab
set backspace=2 " start,indent

" Search
set hlsearch " Highlighted search
set incsearch " Highlight search string as you type
set ignorecase " Make searches case-insensitive
set whichwrap+=<,>,h,l

" Typos
nmap :W :w
nmap :Q :q
nmap :E :e
nmap :Tabe :tabe
nmap :Noh :noh

let mapleader = ","

" command-t
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxHeight=15
map <leader>R :CommandTFlush<CR>

" Nerdtree
let NERDTreeShowHidden=1
map <leader>n :NERDTree<CR>
map <leader>d :NERDTreeToggle<CR>

map <leader>v :sp ~/.vimrc<CR>
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

nmap <leader>i :set list!<CR> " Shortcut to toggle list (i for invisibles)

vmap <C-d> y'>p " Duplicate visual selection

" vimrc
map <leader>s :source ~/.vimrc<cr> " Fast reloading of the .vimrc
map <leader>e :e! ~/.vimrc<cr> " Fast editing of .vimrc
autocmd! bufwritepost vimrc source ~/.vimrc " When .vimrc is edited, reload it

" Folds
au BufWinLeave ?* mkview " save folds on exit
au BufWinEnter ?* silent loadview " automatically load folds silently

" one-key indentation
nmap > >>
nmap < <<

" search next/previous -- center in page (similar to using 'set scroloff=999')
nmap n nzz
nmap N Nzz
nmap * *Nzz

map <leader>e :silent :! ctags --recurse --sort=yes;sort tags > tmptags;mv tmptags tags<CR>:exe ":echo 'tags generated'"<CR>

nmap <silent> <leader>s :set spell!<CR> " Toggle spell checking

map <leader>a :Ack<space> " Ack function

compiler ruby " Enable compiler support for ruby

"ruby omnicomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile

au! BufRead,BufNewFile *.json setfiletype json
