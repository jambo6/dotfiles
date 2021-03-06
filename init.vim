" Initialisation
set nocompatible
let mapleader=","

" TODO {{{
" coc-explorer and anything else coc-X named
" }}}

" General {{{
syntax on
set number " Show line numbers
set showmatch " Highlights matching parentheses when highlighted
set wildmenu " Graphical representation for autocompletion
set hls " Highlighted search on
set modifiable " For flake8
set colorcolumn=120

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Normal tabs
set tabstop=4                             " Sets tabstops to a width of four columns.
set softtabstop=4                         " Determines the behaviour of TAB and BACKSPACE keys with expandtab.
set shiftwidth=4
setlocal expandtab

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Open new splits to right and bottom
set splitbelow
set splitright

" Mouse
if has('mouse')
    set mouse=a
endif
if !has('nvim')
    set ttymouse=xterm2
end

" Remove esc delay
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000
augroup FastEscape
autocmd!
au InsertEnter * set timeoutlen=0
au InsertLeave * set timeoutlen=1000
augroup END

""" Python3 VirtualEnv
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')
" }}}

" Plugins {{{1
call plug#begin()
    " todo
    " Plug 'tpope/vim-unimpaired'
    " nmap <leader>gs :Gstatus<CR>:resize 15<CR>
    
    " Github
    Plug 'tpope/vim-fugitive'
    """ mappings {{{2
        nnoremap <leader>gd :Gvdiff!<CR>
        nnoremap gdh :diffget //2<CR>
        nnoremap gdl :diffget //3<CR>
    """ 2}}}
    
    " Comments
    Plug 'tpope/vim-commentary'
    vmap <leader>c gcc
    nmap <leader>c gcc

    " Jump around
    Plug 'justinmk/vim-sneak'
    " Sneak {{{2
        " Immediately move to next
        let g:sneak#s_next = 1
        " Emulate easymotion
        let g:sneak#label = 1
        " Case insensitive
        let g:sneak#use_ic_scs = 1
        " Change the colors
        highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
        highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
    " 2}}}

    " Slime
    Plug 'jpalardy/vim-slime'
    " Slime settings {{{2
        let g:slime_no_mappings = 1
        xmap <leader>l <Plug>SlimeRegionSend
        nmap <leader>l <Plug>SlimeLineSendj
        nmap <C-c>v <Plug>SlimeConfig
        let g:slime_target = "tmux"
        let g:slime_paste_file = "$HOME/.slime_paste"
        let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}	" Set defaults assuming 2 windows with the repl below
    " 2}}}
    
    " Status/tabline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'

    " Distraction free
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    " {{{
        nmap <leader>gg :Goyo<CR>
        nmap <leader>gl :Limelight!!<CR>
        xmap <leader>gl :Limelight!!<CR>
    " }}}
    
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'airblade/vim-rooter'
    " fzf {{{
        nmap <silent> <leader>v :GFiles<CR>
        nmap <silent> <leader>V :Files<CR>
        nmap <leader>b :Buffer<CR>
    " }}}

    " Plugin for plain text notes
    Plug 'junegunn/vim-journal'

    " Nice json
    Plug 'kevinoid/vim-jsonc'

    " Surround
    Plug 'tpope/vim-surround'

    " Autoclose
    Plug 'Townk/vim-autoclose'	
    let g:AutoClosePumvisible={"ENTER":"", "ESC":""}

    " Syntax highlighting
    Plug 'sheerun/vim-polyglot'

    " Powerline fonts
    Plug 'powerline/powerline-fonts'

    " Rainbow brackets
    Plug 'frazrepo/vim-rainbow'
    let g:rainbow_active = 1

    " Multiple cursors
    Plug 'terryma/vim-multiple-cursors'
    " Multiple cursor options {{{
        nmap <S-C-n> <Plug>AllWholeOccurrences
        xmap <S-C-n> <Plug>AllWholeOccurrences
        nmap g<S-C-n> <Plug>AllOccurrences
        xmap g<S-C-n> <Plug>AllOccurrences
        " Remap multiple-cursors shortcuts to match terryma/vim-multiple-cursors
        " We make C-s skip since C-x is currently bound to alfreds clipboard
        nmap <C-n> <Plug>NextWholeOccurrence
        xmap <C-n> <Plug>NextWholeOccurrence
        nmap g<C-n> <Plug>NextOccurrence
        xmap g<C-n> <Plug>NextOccurrence
        nmap <C-s> <Plug>SkipOccurrence
        xmap <C-s> <Plug>SkipOccurrence
        nmap <C-p> <Plug>RemoveOccurrence
        xmap <C-p> <Plug>RemoveOccurrence
    " }}}
    
    " Python
    " {{{
        " Indent
        Plug 'Vimjas/vim-python-pep8-indent'
        
        " Syntax
        Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
        
        " " Black
        Plug 'psf/black', { 'branch': 'stable' }
        nmap <leader>rb :Black<CR>
        autocmd BufWritePost *.py execute ':Black'

        " Jupyter
        Plug 'jupyter-vim/jupyter-vim'
    " }}}

    " Show diffs
    Plug 'mhinz/vim-signify'

    " Xcode
    Plug 'arzg/vim-colors-xcode'

    " Nord
    Plug 'arcticicestudio/nord-vim'

    " Go
    Plug 'fatih/vim-go'
    " Go options 2{{{
        let g:go_def_mapping_enabled = 0
        let g:go_doc_keywordprg_enabled = 0
        let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save     
        let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor     
        autocmd FileType go nmap <leader><space>  <Plug>(go-run)
        autocmd FileType go nmap <leader>rf <Plug>(go-mod-fmt)
        autocmd FileType go nmap <leader>F <Plug>(go-doc-browser)
        " run :GoBuild or :GoTestCompile based on the go file
        function! s:build_go_files()
            let l:file = expand('%')
            if l:file =~# '^\f\+_test\.go$'
                call go#test#Test(0, 1)
            elseif l:file =~# '^\f\+\.go$'
                call go#cmd#Build(0)
            endif
        endfunction
        autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

    " 2}}}

    " Coc 
    if !exists('g:vscode')
    " coc things {{{
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'ryanoasis/vim-devicons'
        Plug 'antoinemadec/coc-fzf'     " Requires junegunn/fzf
        nmap <silent> coc :CocConfig<CR>

        " coc fzf 
        nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
        nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics<CR>
        nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
        nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
        nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
        nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
        nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
        nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
        nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>

        " CocExplorer, close if last open, autoopen
        nmap <leader>e :CocCommand explorer<CR>
        autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

        " Give more space for displaying messages.
        set cmdheight=2

        " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
        " delays and poor user experience.
        set updatetime=300

        " Don't pass messages to |ins-completion-menu|.
        set shortmess+=c

        " Pycharm emulation
        nmap <leader>rn <Plug>(coc-rename)
        nmap <leader>x <Plug>(coc-diagnostic-prev)
        nmap <leader>X <Plug>(coc-diagnostic-next)
        nmap <silent> <leader>m :call CocAction('jumpDefinition', 'tab drop')<CR>
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Formatting selected code.
        xmap <leader>rf  <Plug>(coc-format-selected)
        nmap <leader>rf  <Plug>(coc-format-selected)

        " Show signature help on placeholder jump
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

        " Docs
        nmap <silent> <leader>f :call <SID>show_documentation()<CR>
        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
          else
            execute '!' . &keywordprg . " " . expand('<cword>')
          endif
        endfunction

        " Use tab for trigger completion with characters ahead and navigate.
        inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        " <CR> selects first option
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " }}}
    else
    end

    " Julia language support
    Plug 'JuliaEditorSupport/julia-vim'
    let g:latex_to_unicode_auto = 1

call plug#end()
" 1}}}

" Colorscheme {{{
set termguicolors
set background=dark
" colorscheme xcodedark
" let g:airline_theme='xcodedark'

" Nord
colorscheme nord
let g:airline_theme='nord'

function! ColorXcodeDark()
    set background=dark
    colorscheme xcodedark
    let g:airline_theme='xcodedark'
endfunction

function! ColorXcodeLight()
    set background=light
    colorscheme xcodelight
    let g:airline_theme='xcodelight'
endfunction

" nmap <leader>e1 :call ColorXcodeDark()<CR>
" nmap <leader>e2 :call ColorXcodeLight()<CR>
" }}}

" Keybindings {{{
" Make enter behave sensibly
nnoremap <CR> o<Esc>

" Double esc is save
map <Esc><Esc> :w<CR>

" Go to the alternative buffer 
nnoremap <bs> <c-^>

" For opening initvim
nmap <leader>0s :source ~/.config/nvim/init.vim<CR>
nmap <leader>0o :edit ~/.config/nvim/init.vim<CR>

" Useful shortcuts
nmap ; :
imap jj <Esc>
nmap q :q<CR>
nmap fq :q!<CR>
nmap zz :wq!<CR>

" Indentation
nmap <Tab> >>_
nmap <S-Tab> <<_
vmap <Tab> >
vnoremap <S-Tab> <

" Line yank
nmap Y y$

" System clipboard
vnoremap <leader>y "+y
vnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>p "+p
nnoremap <leader>P "+pg_
vnoremap <leader>p "+p
vnoremap <leader>P "+pg_

" Big jump
nnoremap J 5j
nnoremap K 5k
vmap J 5j
vmap K 5k
nnoremap H ^
nnoremap L $
vmap H ^
vmap L $

" Splits
nmap <leader>\ :vsp<CR>
nmap <leader>- :split<CR>

" Split navigations (Ctrl-j down, Ctrl-k up, etc)
nnoremap <Down> <c-w><c-j>
nnoremap <Up> <c-w><c-k>
nnoremap <Right> <c-w><c-l>
nnoremap <Left> <c-w><c-h>

" Indentation
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
noremap <Tab> >gv
vnoremap <S-Tab> <gv

" Folds
nnoremap zo za

" Length guide
au FileType julia setlocal colorcolumn=120
au FileType python setlocal colorcolumn=120

" }}}

" Folding {{{
" This goes at the end otherwise something is overriding marker -> indent
" folding
set foldmethod=marker
set timeoutlen=1000 ttimeoutlen=0
hi Folded ctermfg=1
" set foldlevel=99
set foldlevel=0
" autocmd BufNewFile,BufRead *init.vim set foldlevel=0
" }}}

" VSCode {{{
if exists('g:vscode')
    " Some movements
    nmap J 5j   " This doesnt map over properly from above, unsure why

    " Julia
    nmap <leader><Space> :call VSCodeNotify(language-julia.executeCodeBlockOrSelection)<CR>

    " VSCode actions, made to mimic the ones setup in pycharm
    nmap <leader>dd :call VSCodeNotify('workbench.action.debug.run')<CR>
    nmap <leader>ds :call VSCodeNotify('workbench.action.debug.stepInto')<CR>
    nmap <leader>b :call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>
    nmap <leader>l :call VSCodeNotify('language-julia.executeJuliaCodeInREPL')<CR>
    xmap <leader>l :call VSCodeNotify('language-julia.executeJuliaCodeInREPL')<CR>
    nmap <leader>rb :call VSCodeNotify('editor.action.formatDocument')<CR>

    nmap <leader>\ :call VSCodeNotify('workbench.action.splitEditor')<CR>
    nmap <leader>- :call VSCodeNotify('workbench.action.splitEditorOrthogonal')<CR>
    nmap <leader>q :call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
    nmap ]] :call VSCodeNotify("workbench.action.nextEditor")<CR>
    nmap [[ :call VSCodeNotify("workbench.action.previousEditor")<CR>
    nmap <Up> :call VSCodeNotify("workbench.action.moveActiveEditorGroupUp")<CR>
    nmap <Down> :call VSCodeNotify("workbench.action.moveActiveEditorGroupDown")<CR>
    nmap <Left> :call VSCodeNotify("workbench.action.moveActiveEditorGroupLeft")<CR>
    nmap <Right> :call VSCodeNotify("workbench.action.moveActiveEditorGroupRight")<CR>
    nmap q :call VSCodeNotify("workbench.action.closeActiveEditor")<CR>
    nmap Q :call VSCodeNotify("workbench.action.reopenClosedEditor")<CR>

    nmap <leader>f :call VSCodeNotify("language-julia.show-documentation")<CR>

    nmap ; :call VSCodeNotify('workbench.action.showCommands')<CR>
    nmap <leader>v :call VSCodeNotify('workbench.action.quickOpen')<CR>
    nmap <leader>s :call VSCodeNotify('workbench.action.goToSymbol')<CR>
    nmap <leader>m :call VSCodeNotify('editor.action.revealDefinition')<CR>
else
    " nothing 
end
" }}}
