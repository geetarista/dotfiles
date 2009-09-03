set nocompatible " no vi compatibility
set ruler " Show position in file
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
set backspace=indent,eol,start
set backspace=2
set hlsearch " highlighted search
set incsearch " Set search to automatically show the next match while typing
set ignorecase " Make searches case-insensitive
set whichwrap+=<,>,h,l
syntax on
set cursorline
let NERDTreeShowHidden=1
set wildignore=*.swo,*.swp
let mapleader = ","
map <leader>t :FuzzyFinderTextMate<CR>
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
map <leader>e :silent :! ctags --recurse --sort=yes;sort tags > tmptags;mv tmptags tags<CR>:exe ":echo 'tags generated'"<CR>
map <leader>d :NERDTreeToggle<CR>

function! AckGrep(command)
  cexpr system("ack -a" . a:command)
  cw
endfunction

command! -nargs=+ -complete=file Ack call AckGrep(<q-args>)

set showmatch " Show matching brackets.
set mat=5 " Bracket blinking.
