set nocompatible
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

call vundle#end()
filetype plugin indent on

" Custom settings
" set autoindent

set enc=utf-8          " set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8

set autoindent         " use indentation of previous line
set smartindent        " intelligent indentation for C

set backspace=indent,eol,start
set hidden
set incsearch
set ruler

set tabstop=4          " 4 spaces per tab
set shiftwidth=4       " indent with 4 spaces
set expandtab          " expand tabs to spaces
set textwidth=120      " lines longer than 90 characters broken

set t_Co=256           " syntax highlighting on
syntax on

set number             " turn on line numbers
set showmatch          " highlight matching braces

set laststatus=2       " for proper plugin functioning

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
