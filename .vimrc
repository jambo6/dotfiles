" Jambos vimrc file 

" Below is for folding
" vim:fdm=marker
set foldmethod=marker
set timeoutlen=1000 ttimeoutlen=0

" TODO {{{1
" }}}1

" INITIALISATION {{{1


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" }}}1

" GENERAL {{{1

syntax on
set number " Show line numbers
set showmatch " Highlights matching parentheses when highlighted
set wildmenu " Graphical representation for autocompletion
set hls " Highlighted search on
set modifiable " For flake8

" Leader key for shortcuts
let mapleader=","

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Relative pagenumbers
" set relativenumber

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Open new splits to right and bottom
set splitbelow
set splitright

" Mouse
if has('mouse')
 set mouse=a
endif
:set ttymouse=xterm2

" Remove esc delay
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" }}}1

" KEYBOARD SHORTCUTS {{{1

	" Random shortcuts {{{2
	"
	" Make enter behave sensibly
	nnoremap <CR> o<Esc>

	" ,c saves and dispatches (c++)
	nnoremap <leader>c :w<CR> :Dispatch<CR>

	" Double esc is save
	map <Esc><Esc> :w<CR>

	" Useful shortcuts
	imap jj <Esc>
	imap § <leader>l
	nnoremap Q :q!<CR>
	nnoremap <c-z> <nop>


	" }}}2

	" Navigation {{{2
	" split navigations (Ctrl-j down, Ctrl-k up, etc)
	nnoremap <c-j> <c-w><c-j>
	nnoremap <c-k> <c-w><c-k>
	nnoremap <c-l> <c-w><c-l>
	nnoremap <c-h> <c-w><c-h>
	" Shift or control
	nnoremap <s-j> <c-w><c-j>
	nnoremap <s-k> <c-w><c-k>
	nnoremap <s-l> <c-w><c-l>
	nnoremap <s-h> <c-w><c-h>
	" }}}2

" }}}1

" UI {{{1

" onedark {{{2
let g:onedark_termcolors=16
let g:onedark_terminal_italics=0
colorscheme onedark

" Airline status bar
let g:airline_theme='onedark'
" }}}2

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
"
" }}}1

" FUNCTIONS {{{1
" }}}1

" PLUGINS {{{1

" VIM-PLUG {{{2
" Plugin manager (vim-plug) // Install with :PlugInstall
" Command is 'Plug owner_repo/name_repo' (straight from github)
call plug#begin('~/.vim/plugged')

	" Github plugin
	Plug 'tpope/vim-fugitive'
	nmap <leader>gs :Gstatus<CR>:resize 15<CR>

	" Nerd commenter
	Plug 'scrooloose/nerdcommenter'

	" Allows for tmux to be used through vim for matlab (now python)
	Plug 'epeli/slimux'
	 autocmd FileType python map <buffer> <Leader>l :SlimuxREPLSendLine<CR><down>0
	 autocmd FileType python vmap <buffer> <Leader>l :SlimuxREPLSendSelection<CR>
	 autocmd FileType python map <buffer> <Leader>b :SlimuxREPLSendBuffer<CR>

	" Status/tabline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Autoclose
	Plug 'Raimondi/delimitMate'

	" Surround
	Plug 'tpope/vim-surround'

	" Completion engine
	" Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer --system-libclang'}

	" Python indentation
	Plug 'vim-scripts/indentpython.vim'

	" Useful mappings
	Plug 'tpope/vim-unimpaired'

	" Python as and IDE
	Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

	" Powerline fonts
	Plug 'powerline/powerline-fonts'
	
	" Flake8 syntax checker
	Plug 'nvie/vim-flake8'

	" Latex
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()
" }}}2

" PLUGIN SETTINGS {{{2


""" NERDTree settings
nmap <leader>nt :NERDTree<CR>
nmap <leader>nt :NERDTreeToggle<CR>
let g:NERDSpaceDelims = 1 " Nerd commenter settings
let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore annoying files in NERDTree


""" YouCompeteMe
let g:ycm_autoclose_preview_window_after_completion=1 " Ensures autocomp window goes when done with it
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>', '<Esc>']
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
set pumheight=3


""" Python-mode sttings
let g:pymode_python = 'python3'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>j'
" let g:pymode_lint_checkers=['pyflakes', 'pep8']
let g:pymode_virtualenv_path="/Users/jambo/miniconda3"		" Lets python find anaconda installed modules

" Python mode speed ups from the net {{{3

let g:pymode_lint=0

" To prevent folding speed reduce
augroup unset_folding_in_insert_mode
    autocmd!
    autocmd InsertEnter *.py setlocal foldmethod=marker
    autocmd InsertLeave *.py setlocal foldmethod=expr
augroup END

let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
" }}}3


""" Flake8
" autocmd BufWritePost *.py call Flake8() 	" Flake on save

" }}}2

" Pathogen for runtime path manipulation
execute pathogen#infect()

" Livetex
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'


" }}}1 

" PYTHON STUFF {{{1

" Set utf-8 encoding
set encoding=utf-8

" Makes python look prettier
let python_highlight_all=1

" For proper python indentation
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix 

" }}}

" FOLDING {{{1
"
" enable folding with spacebar

nnoremap <space> za

" Set colors of folds
hi Folded ctermfg=2

set foldlevel=99
autocmd BufNewFile,BufRead *.vimrc set foldlevel=0 

" }}}1



