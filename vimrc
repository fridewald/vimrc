" ---Plugin installation--------------------------
" copied a lot from "fisadev/fisa-vim-config"
"Vundle configuration set nocompatible        "be improved, required
filetype off            "required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" base16 colorscheme
Plugin 'chriskempson/base16-vim'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Better autocompletion
Plugin 'Shougo/neocomplete.vim'
" delete white space
Plugin 'bronson/vim-trailing-whitespace'
" Treebrowsering
Plugin 'scrooloose/nerdtree'
" Some improvements to nerdtree
"Plugin 'jistr/vim-nerdtree-tabs'
" Code commenter
Plugin 'scrooloose/nerdcommenter'
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
Plugin 'klen/python-mode'

" alignment plugin
"Plugin 'junegunn/vim-easy-align'

" All of your Plugins must be added before the followign line
call vundle#end()           "required
filetype plugin indent on   "required

" ================================================
" ---General settings-----------------------------

" no vi-compatible
set nocompatible

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
"set textwidth=120

" colorsheme
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    let base16colorspace=256
    set background=dark
endif
colorscheme base16-tomorrow

" highlight matching braces
set showmatch

" airline allways appear
set laststatus=2

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" more natural window splitting
set splitright
set splitbelow

" change <leader> to ,
let mapleader=","

" ===============================================
" Plugin settings


" syntastic------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" remap F5 for check
noremap <silent><F5> :SyntasticCheck<CR>
" show list of erors and warnings on the current file
nmap <leader>e :Errors<CR>

" Python-mode----------------
" don't use linter, we use syntastic for that
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
nmap ,o :RopeFindOccurrences<CR>

" Tagbar---------------------
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree-------------------
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" CtrlP----------------------
" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Airline--------------------
let g:airline_powerline_font = 1
"let g:airline_theme = 'base16'
let g:airline#extensions#whitespace#enabled = 0

" NeoComplete.vim------------
" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make
" it play nice)
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#manual_completion_start_length = 1
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#sources#syntax#min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplete#same_filetypes = {}
let g:neocomplete#same_filetypes._ = '_'
" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" transparent background
highlight Normal ctermbg=none
highlight Statement ctermbg=none
highlight Title ctermbg=none
highlight Underlined ctermbg=none
highlight ErrorMsg ctermbg=none
highlight LineNr ctermbg=none
highlight Todo ctermbg=none
highlight NonText ctermbg=none
