set nocompatible " no vi compatibility
set ruler " Show cursor position
set number " Show line numbers
compiler ruby " Enable compiler support for ruby
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:< " Show $ at end of line and trailing space as ~
set novisualbell  " No blinking
set noerrorbells  " No noise
set laststatus=2  " Always show status line
set tabstop=2 " Use 2 spaces for tabs
set smarttab " Authomatic indenting
set shiftwidth=2
set autoindent
set expandtab
set backspace=2
set hlsearch " Highlighted search
set incsearch " Highlight search string as you type
set ignorecase " Make searches case-insensitive
set whichwrap+=<,>,h,l
syntax on "Syntax highlighting
set cursorline
let NERDTreeShowHidden=1
set wildignore=*.swo,*.swp,*.jpg,*.png,*.gif
let mapleader = ","
map <leader>g :FuzzyFinderTextMate<CR>
let g:mapleader = ","
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>f :FuzzyFinderFile<CR>
map <leader>r :FuzzyFinderMruFile<CR>
map <leader>R :ruby finder.rescan!<CR>:FuzzyFinderRemoveCache<CR>:exe ":echo 'rescan complete'"<CR>
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70
map <leader>n :NERDTree<CR>
map <leader>a :Ack<space>
map <leader>v :sp ~/.vimrc<CR>
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"Fast reloading of the .vimrc
map <leader>s :source ~/vim_local/vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/vim_local/vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/vim_local/vimrc

set history=25 "Set how many commands to retain in history

map <leader>e :silent :! ctags --recurse --sort=yes;sort tags > tmptags;mv tmptags tags<CR>:exe ":echo 'tags generated'"<CR>
map <leader>d :NERDTreeToggle<CR>

set autoread "Set to auto read when a file is changed from the outside

"ruby omnicomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
"highlight Pmenu ctermbg=238 gui=bold

filetype on
filetype plugin indent on " load filetype plugins/indent settings

function! AckGrep(command)
  cexpr system("ack -a" . a:command)
  cw
endfunction

command! -nargs=+ -complete=file Ack call AckGrep(<q-args>)

set showmatch " Show matching brackets.
set mat=5 " Bracket blinking.
