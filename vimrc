" ---Plugin installation--------------------------
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
" Airlines
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" code and files fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plugin 'fisadev/vim-ctrlp-cmdpalette'
" delete white space
Plugin 'bronson/vim-trailing-whitespace'
" Treebrowsering
Plugin 'scrooloose/nerdtree'
" Some improvements to nerdtree
Plugin 'jistr/vim-nerdtree-tabs'
" Class/module browser
Plugin 'majutsushi/tagbar'
" Syntax checker
Plugin 'scrooloose/syntastic'
" alignment plugin
"Plugin 'junegunn/vim-easy-align'

" All of your Plugins must be added before the followign line
call vundle#end()           "required
filetype plugin indent on   "required

" ---General settings-----------------------------
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

" ---Plugin settings------------------------------
" set option for colorsheme
set background=dark
" colorscheme
let base16colorspace=256
colorscheme base16-tomorrow

"airline allways appear
set laststatus=2

" Tagbar
map <F8> :TagbarToggle<CR>

"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"remap F5 for check
noremap <silent><F5> :SyntasticCheck<CR>

" transparent background
highlight Normal ctermbg=none
highlight Statement ctermbg=none
highlight Title ctermbg=none
highlight Underlined ctermbg=none
highlight ErrorMsg ctermbg=none
highlight LineNr ctermbg=none
highlight Todo ctermbg=none
highlight NonText ctermbg=none
