set nohlsearch
set nocompatible
filetype plugin on

set ai
set bg=dark
color desert
set showmatch
highlight SpecialKey ctermfg=DarkGray
set listchars=tab:>-,trail:~
set list
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
syntax on
set listchars=tab:>-
set listchars+=trail:.
set ignorecase
set smartcase
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
set number

set clipboard=unnamed

set autoread
set shortmess=atI

set cursorline

set title
set noerrorbells
set novisualbell

set ruler
set showcmd
set showmode

set smartindent
set autoindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

set encoding=utf-8
set fileencodings=usc-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn

set ffs=unix,dos,mac

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>



call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'valloric/youcompleteme'
Plug 'fatih/vim-go'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'vim-scripts/taglist.vim'

Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki', { 'branch': 'dev'  }

Plug 'lervag/vimtex'
Plug 'preservim/nerdcommenter'

Plug 'wakatime/vim-wakatime'

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:airline_theme='murmur'
let g:rainbow_active = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/youcompleteme/.ycm_extra_conf.py'

colorscheme molokai

" for taglist

let Tlist_Show_One_File = 1
let Tlist_WinWidth = 40
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1

noremap <F8> :TlistToggle<CR>

" for NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
noremap <C-n> :NERDTreeToggle<CR>

" for indentLine
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" for vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" for vim-go
let g:go_fmt_command = "goimports"

" leader key

" for nerdcommenter
let g:NERDSpaceDelim = 1
