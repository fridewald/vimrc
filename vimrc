" ---Plugin installation
"Vundle configuration set nocompatible        "be improved, required
filetype off            "required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/paht/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" base16 colorscheme
Plugin 'chriskempson/base16-vim'
"
Plugin 'vim-airline/vim-airline'


" delete white space
Plugin 'bronson/vim-trailing-whitespace'
" Treebrowsering
Plugin 'scrooloose/nerdtree'
" Some improvements to nerdtree
Plugin 'jistr/vim-nerdtree-tabs'
"
Plugin 'majutsushi/tagbar'
" Syntax checker
Plugin 'scrooloose/syntastic'
" alignment plugin
"Plugin 'junegunn/vim-easy-align'

" All of your Plugins must be added before the followign line
call vundle#end()           "required
filetype plugin indent on   "required

" ---General settings----------------------------
" turn line numbers on
set number
" turn syntax highlighting on
syntax on
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" highlight matching braces
set showmatch

" ---Plugin settings
" set option for colorsheme
set background=dark
" colorscheme
let base16colorspace=256
colorscheme base16-tomorrow
