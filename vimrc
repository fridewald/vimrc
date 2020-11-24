" ---Plugin installation--------------------------
" copied a lot from "fisadev/fisa-vim-config"
"Vundle configuration set nocompatible        "be improved, required
filetype off            "required

" set the runtime path to include Vundle and initialize
let vundle_autoinstall=0
let vundle_readme = expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let vundle_autoinstll = 1
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" base16 colorscheme
Plugin 'chriskempson/base16-vim'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" delete white space
Plugin 'bronson/vim-trailing-whitespace'
" Class/module browser
Plugin 'majutsushi/tagbar'
" Syntax checker
Plugin 'scrooloose/syntastic'
" Code and files fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plugin 'fisadev/vim-ctrlp-cmdpalette'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
" Plugin 'python-mode/python-mode'
" git integration
Plugin 'tpope/vim-fugitive'
" nice and easy surrounding manipulation
Plugin 'tpope/vim-surround'
" comment out blocks of code more easily
Plugin 'tpope/vim-commentary'
" latex plugin
Plugin 'lervag/vimtex'

" alignment plugin
"Plugin 'junegunn/vim-easy-align'

" All of your Plugins must be added before the followign line
call vundle#end()           "required

if vundle_autoinstall
    echo "Installing bundles..."
    echo ""
    :BundleInstall
endif

filetype plugin indent on   "required

" ================================================
" ---General settings-----------------------------

" minimal vim IDE
" https://www.youtube.com/watch?v=Gs1VDYnS-Ac
" define varibales for the youtube stuff
let $RTC=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrc"

" no vi-compatible
set nocompatible

" turn syntax highlighting on
syntax on

" allow to switch buffer, even so it is not saved
set hidden

" disable swap file
set noswapfile


" usefull path
set path=.,**

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" ignoreing cases in search unless it's uppercase
set ignorecase smartcase

" enable local .nvimrc files
set exrc

" enable folding
set foldmethod=indent
set foldlevel=99

" airline always appear
set laststatus=2

" allow mouse everywhere
set mouse=a

" turn line numbers on
set number relativenumber

" enable omnicomplete
set omnifunc=syntaxcomplete#Complete

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
"set textwidth=120

" show commands while typing
set showcmd

" highlight matching braces
set showmatch

" not highlight search matches
set nohlsearch

" more natural window splitting
set splitright
set splitbelow

" configure tabwidth and insert spaces instead of tabs
" a tab is displayed as 4 spaces
" set tabstop=4
" indent also with 4 spaces
" set shiftwidth=4
" expand tabs to spaces
" set expandtab
" use indentation of previous line
" set autoindent
" use intelligent indentation for C
" set smartindent

" colorscheme base16-tomorrow
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256\|konsole-256')
    let base16colorspace=256
    " || has('nvim')
" if $TERM !~# "konsole.*"
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
  colorscheme base16-tomorrow
endif


" change <leader> to ,
let mapleader=","
" change <localleader> to
let maplocalleader="-"

" change tag map to something more easy on German keyboard
nnoremap ü <C-]>
nnoremap Ü <C-O>

" try to use system clipboard
set clipboard=unnamed
if has('unnamedplus')
    set clipboard=unnamedplus
endif

" simple ctags bind
nmap <leader>ct :!ctags -R -f ./tags . <enter>

" set tags file to .git/tags
" set tags^=./.git/tags;

" map to make command
nnoremap <F6> :make<cr>

" ================================================
" Plugin settings

" syntastic---------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_checkers = ['pylint', 'flake9']
let g:syntastic_python_flake8_args='--builtins=FileNotFoundError --ignore=E226,E402,E501,E722,W503,W605'

let g:syntastic_yaml_checkers = ['yamllint']

" let g:syntastic_tex_checkers = ['chktex']
" let g:syntastic_tex_chktex_args = '-n'

let g:syntastic_cpp_compiler_options = '-std=c++11 -fPIC'
let g:syntastic_cpp_check_header = 0
" let g:syntastic_cpp_auto_refresh_includes = 0

" let g:syntastic_cpp_config_file = '.syntastic_cpp_config'

let g:syntastic_mode_map = {
			\ "mode": "active",
			\ "active_filetypes": [],
			\ "passive_filetypes": ["tex"] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'


" remap F5 for check
noremap <silent><F5> :SyntasticCheck<CR>
" show list of erors and warnings on the current file
nmap <leader>E :Errors<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>


" Tagbar------------------------------------------
" YOU HAVE TO INSTALL ctags SEPARATELY
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" CtrlP-------------------------------------------
" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap <leader>g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap <leader>G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap <leader>f :CtrlPLine<CR>
" recent files finder mapping
nmap <leader>m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap <leader>c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
nmap <leader>b :CtrlPBuffer<CR>
" function! CtrlPWithSearchText(search_text, ctrlp_command_end)
"     execute ':CtrlP' . a:ctrlp_command_end
"     call feedkeys(a:search_text)
" endfunction
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Airline-----------------------------------------
let g:airline_powerline_font = 1
" let g:airline_theme = 'base16-tomorrow'
let g:airline#extensions#whitespace#enabled = 0

" transparent background
"if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
highlight Normal ctermbg=none
highlight Statement ctermbg=none
highlight Title ctermbg=none
highlight Underlined ctermbg=none
highlight ErrorMsg ctermbg=none
highlight LineNr ctermbg=none
highlight Todo ctermbg=none
highlight NonText ctermbg=none
"endif

" vimtex------------------------------------------
" set okular

let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
set diffopt+=vertical

" let g:vimtex_grammar_vlty = {'lt_directory': '/home/julian/bin/LanguageTool-5.1'}
let g:vimtex_grammar_textidote = {
      \ 'jar': $HOME . '/bin/textidote.jar',
      \ 'args': '--dict ' . $HOME . '/.textidote.dict',
      \}
set spelllang=en
