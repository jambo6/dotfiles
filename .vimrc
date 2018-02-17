" Jambos vimrc file 

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Basics
syntax on
set number " Show line numbers
set showmatch " Highlights matching parentheses when highlighted
set wildmenu " Graphical representation for autocompletion
set hls " Highlighted search on

" Colorscheme
let g:onedark_termcolors=16
let g:onedark_terminal_italics=0
set termguicolors
syntax on
colorscheme onedark

" Remove esc delay
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" Leader key for shortcuts
let mapleader=","


" Plugin manager (vim-plug) // Install with :PlugInstall
" Command is 'Plug owner_repo/name_repo' (straight from github)
call plug#begin('~/.vim/plugged')

" Github plugin
Plug 'tpope/vim-fugitive'
	nmap <leader>gs :Gstatus<CR>:resize 15<CR>

" Nerd commenter
Plug 'scrooloose/nerdcommenter'

" Allows for tmux to be used through vim for matlab
Plug 'epeli/slimux'
	autocmd FileType python map <buffer> <Leader>l :SlimuxREPLSendLine<CR><down>0
	autocmd FileType python vmap <buffer> <Leader>l :SlimuxREPLSendSelection<CR>
	autocmd FileType python map <buffer> <Leader>b :SlimuxREPLSendBuffer<CR>

" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" " Autoclose
" Plug 'Townk/vim-autoclose'

" Surround
Plug 'tpope/vim-surround'

" Completion engine
Plug 'valloric/youcompleteme'

" Python indentation
Plug 'vim-scripts/indentpython.vim'

call plug#end()

" Pathogen for runtime path manipulation
execute pathogen#infect()

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Airline status bar
let g:airline_theme='onedark' 
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" Inserted to get tmux screen same color
set term=screen-256color

" Set keybindings, note CR is carriage-return i.e. Enter
nmap <CR> o<Esc>
nmap <leader>c :w<CR> :Dispatch<CR>
imap jj <Esc>
nmap <leader>* i#<Space>********** **********<Space>#<Esc>bhi<Space> 
imap § #

" Set esc dely to low
set ttimeoutlen=50

" NERDTree settings
nmap <leader>nt :NERDTree<CR>
nmap <leader>nt :NERDTreeToggle<CR>
let g:NERDSpaceDelims = 1 " Nerd commenter settings

" Open new splits to right and bottom
set splitbelow
set splitright

" split navigations (Ctrl-j down, Ctrl-k up, etc)
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" Enable folding
set foldmethod=indent
set foldlevel=99
" enable folding with spacebar
nnoremap <space> za

" Mouse
if has('mouse')
	set mouse=a
endif
:set ttymouse=xterm2

" For proper python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 


