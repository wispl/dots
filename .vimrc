packadd minpac

call minpac#init()

call minpac#add("k-takata/minpac", {"type": "opt"}) " opt is required for minpac
call minpac#add("tpope/vim-surround")
call minpac#add("tpope/vim-commentary")
call minpac#add("tpope/vim-dispatch")

call minpac#add("tikhomirov/vim-glsl")
colorscheme slate

runtime! macros/matchit.vim
runtime ftplugin/man.vim

filetype plugin indent on
syntax on

" do not autocomplete includes, huge lag
set complete-=i
set wildmenu
set display+=lastline
set laststatus=2
set hidden

set smarttab
set autoindent

set ruler
set showcmd
set scrolloff=1
set sidescroll=1

set backspace=indent,eol,start
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set formatoptions+=j

set incsearch
set ignorecase
set hlsearch

" reduce key wait time
set ttimeout
set ttimeoutlen=100

set path=.,**
setglobal tags-=./tags tags-=./tags; tags^=./tags;

inoremap jk <ESC>
let mapleader=" "

nnoremap <leader>b :buffer *
nnoremap <leader>f :find *

" quickfix entries
nnoremap ]q <CMD>cnext<CR>
nnoremap [q <CMD>cprevious<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

