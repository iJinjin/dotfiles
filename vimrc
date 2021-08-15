" Jinjin's custom vimrc setup
" version controlled just for my own convenience
" but I'll leave it as public for anyone else to use it

set nocompatible                       " vim functionality
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine'              " line indentation plugin
Plugin 'vim-airline/vim-airline'          " status bar plugin
Plugin 'bling/vim-bufferline'             " buffer line plugin
Plugin 'vim-airline/vim-airline-themes'   " status bar themes
Plugin 'ryanoasis/vim-devicons'           " icons for vim
Plugin 'tomasr/molokai'                   " molokai theme
Plugin 'mg979/vim-visual-multi'           " Multiline vim plugin
Plugin 'preservim/nerdtree'               " file exploration plugin
Plugin 'cohama/lexima.vim'                " parenthesis autofill plugin
Plugin 'junegunn/fzf'                     " fuzzy finder plugin
Plugin 'junegunn/fzf.vim'                 " fzf vim extension
Plugin 'tpope/vim-fugitive'               " git plugin
Plugin 'tpope/vim-commentary'             " commenting plugin
Plugin 'tpope/vim-unimpaired'             " some useful keybinding plugin
Plugin 'tpope/vim-surround'               " surrounding plugin
Plugin 'joshdick/onedark.vim'             " onedark theme plugin

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
set termguicolors      " terminal GUI colors

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
set completeopt+=noselect
set completeopt+=preview
autocmd CompleteDone * if !pumvisible() | pclose | endif

set belloff+=ctrlg

" new windows go below
set splitbelow

" disable Ex mode
nmap Q <Nop>

" active file remap
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" onedark overrides
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) 
  augroup END
endif

" assembly syntax highlighting
let asmsyntax = 'nasm'
" au BufRead,BufNewFile *.asm set filetype=nasm

" colorscheme
syntax on
colorscheme onedark

" autocommands for custom vim environment on startup (don't use on neovim)
" autocmd VimEnter * term
" autocmd VimEnter * NERDTree

" map fzf file search to Ctrl+P
nmap <C-p> :Files<CR>

" map nerdtree to Ctrl+O
map <C-o> :NERDTreeToggle<CR>   

" easier split pane navigation (conflicts with kite snippets)
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" additional options for vim plugins
let g:onedark_termcolors=256

" VM options for proper highlighting

let g:VM_Mono_hl   = 'DiffText'
let g:VM_Extend_hl = 'DiffAdd'
let g:VM_Cursor_hl = 'Visual'
let g:VM_Insert_hl = 'DiffChange'

let g:VMTheme='nord'

let g:airline_theme='onedark'
let g:airline_powerline_fonts=1     " requires powerline font

let g:kite_supported_languages = ['*']
let g:kite_tab_complete=1

let g:indentLine_char = '┊'
