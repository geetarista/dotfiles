set nocompatible " no vi compatibility

filetype on
filetype plugin indent on " load filetype plugins/indent settings
syntax on "Syntax highlighting

" General settings
set ruler " Show cursor position
set number " Show line and column numbers
set novisualbell  " No blinking
set noerrorbells  " No noise
set lcs=tab:\▸\ ,eol:¬,trail:~,extends:>,precedes:< " Symbols when viewing invisibles
set laststatus=2  " Always show status line
set cursorline
set autoread "Set to auto read when a file is changed from the outside
set history=25 "Set how many commands to retain in history
set showmatch " Show matching brackets.
set mat=5 " Bracket blinking.
set linebreak " Break lines at whole words only
set showbreak=… " Visually differentiate a wrapped line from others
set wildignore+=*.swo,*.swp,*.jpg,*.png,*.gif,.git,log/*,vendor/*,tmp/*,script/*
set cmdheight=2 " Show two lines in the status bar
set iskeyword+=_,$,@,%,#,-
set lazyredraw " Do not redraw while running macros (faster)
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" set foldmethod=indent " indent-sensitive folding

" Do not use swapfiles or backup since writebackup is used
" writebackup is still used, so a copy is always kept in memory
set nobackup " Do not write backup files to disk
set noswapfile " Do not use swapfiles (they have trouble with large files)

" Omni-completion enhancements (http://vim.wikia.com/wiki/VimTip1386, http://vim.wikia.com/wiki/VimTip1228)
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" Tabs
set tabstop=2 " Use 2 spaces for tabs
set smarttab " Automatic indenting
set shiftwidth=2 " sets spaces used for indention
set autoindent " continue indention from previous line
set expandtab " tab key inserts spaces instead of tabs
set backspace=2 " start,indent

" Search
set hlsearch " Highlighted search
set incsearch " Highlight search string as you type
set whichwrap+=<,>,h,l " allow backspace and cursor keys to cross line boundaries

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

" Splits
"" Window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

"" Buffer
nmap <leader>s<left>  :leftabove  vnew<CR>
nmap <leader>s<right> :rightbelow vnew<CR>
nmap <leader>s<up>    :leftabove  new<CR>
nmap <leader>s<down>  :rightbelow new<CR>

map <leader>e :silent :! ctags --recurse --sort=yes;sort tags > tmptags;mv tmptags tags<CR>:exe ":echo 'tags generated'"<CR>

nmap <silent> <leader>s :set spell!<CR> " Toggle spell checking

map <leader>a :Ack<space> " Ack function

" Update help tags
map <leader>h :helpt ~/.vim/doc/<CR>

compiler ruby " Enable compiler support for ruby

"ruby omnicomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile

au! BufRead,BufNewFile *.json setfiletype json
