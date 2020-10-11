" Jinjin's custom vimrc setup
" version controlled just for my own convenience
" but I'll leave it public for anyone else to use it

set nocompatible                       " vim functionality
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'         " status line plugin
Plugin 'tomasr/molokai'                " molokai theme
Plugin 'terryma/vim-multiple-cursors'  " multiple cursor plugin
Plugin 'preservim/nerdtree'            " file exploration plugin
Plugin 'ycm-core/YouCompleteMe'        " autocompletion plugin
Plugin 'cohama/lexima.vim'             " parenthesis autofill plugin
Plugin 'ctrlpvim/ctrlp.vim'            " fuzzy search plugin
Plugin 'vim-syntastic/syntastic'       " lint-like syntax checker plugin
Plugin 'tpope/vim-fugitive'            " git plugin

call vundle#end()
filetype plugin indent on

" for vim cursor change in windows terminal
if &term =~ '^xterm'
    " normal mode
    let &t_EI .= "\<Esc>[0 q"
    " insert mode
    let &t_SI .= "\<Esc>[6 q"
endif

" Custom settings

set shortmess+=I       " disable default Vim startup message

set enc=utf-8          " set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8

set autoindent         " use indentation of previous line
set smartindent        " intelligent indentation for C

set backspace=indent,eol,start  " reasonable backspace behavior
set hidden
set ruler

set tabstop=4          " 4 spaces per tab
set shiftwidth=4       " indent with 4 spaces
set expandtab          " expand tabs to spaces
set textwidth=120      " lines longer than 120 characters broken
set scrolloff=7        " 7 line window for scrolls

set t_Co=256           " syntax highlighting on
syntax on

set number             " turn on line numbers
set relativenumber     " relative line numbering

set ignorecase         " disable case-sensitive searching by default
set smartcase          " enable case-sensitive searching on command
set incsearch          " enable searching while typing

set showmatch          " highlight matching braces

set laststatus=2       " for proper plugin functioning/show status line at bottom

set mouse+=a           " enable mouse support

" used for kite
set completeopt+=menuone
set completeopt+=noinsert
set completeopt-=longest
set belloff+=ctrlg


" disable Ex mode
nmap Q <Nop>

colo molokai           " use the molokai theme
syntax on 

" map nerdtree to Ctrl+O
map <C-o> :NERDTreeToggle<CR>   

" Some other stuff

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

let g:molokai_original = 1

let g:ycm_clangd_binary_path = "/usr/bin/clangd-10"
