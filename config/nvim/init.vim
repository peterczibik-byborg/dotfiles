" VIMrc
" =====
set nocompatible " No VI compatibility
set autoread " Detect file changes outside vim

" Plug all the Plugins
" ====================
call plug#begin('~/.config/nvim/bundle')

" My plugins
Plug 'peteyy/mocha.vim'

" Can't live without colors
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Sierra'
Plug 'rakr/vim-two-firewatch'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Experimental
Plug 'haya14busa/incsearch.vim'
" Plug 'facebook/vim-flow', {
"   \ 'autoload': {
"   \     'filetypes': 'javascript'
"   \ },
"   \ 'build': {
"   \     'mac': 'npm install -g flow-bin',
"   \     'unix': 'npm install -g flow-bin'
"   \ }}

" Plug 'Olical/vim-enmasse'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips' " Snippets
Plug 'benekastah/neomake' " Async execution engine for syntax checking
Plug 'bronson/vim-visual-star-search' " Visual star search
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
" Plug '0x0dea/vim-molasses' " For not being efficient...
" Plug 'ap/vim-buftabline' " Display open buffers
" Plug 'ervandew/supertab' " Tab completion instead of ctrl p and n
Plug 'Raimondi/delimitMate' " Auto insert paired characters
" Plug 'mhinz/vim-signify' " Nice git lines at the side
Plug 'airblade/vim-gitgutter'
Plug 'sjl/gundo.vim' " Undo history

Plug 'tpope/vim-commentary' " Commentary
Plug 'tpope/vim-fugitive' " Git interactions within VIM (blame and diff)
Plug 'tpope/vim-surround' " Surround
Plug 'tpope/vim-repeat' " Repeat last command with.
Plug 'tpope/vim-unimpaired' " Additional paired mappings
Plug 'tpope/vim-abolish' " Better substitute with Subvert
Plug 'tpope/vim-endwise', { 'for': 'vim' }

Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript']} " Zen coding at it's best
Plug 'othree/html5.vim', { 'for': 'html' }

Plug 'othree/yajs.vim', { 'on_ft': 'javascript' }
Plug 'othree/jsdoc-syntax.vim', { 'on_ft': ['javascript', 'typescript'] }
Plug 'othree/es.next.syntax.vim', { 'on_ft': 'javascript' }
Plug '1995eaton/vim-better-javascript-completion', { 'on_ft': ['javascript'] }
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'kylef/apiblueprint.vim'
" Plug 'helino/vim-json', { 'for': 'json' }

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " Might come handy
Plug 'mustache/vim-mustache-handlebars'
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
" Plug 'wavded/vim-stylus', { 'for': 'stylus' }
" Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'honza/dockerfile.vim'

" For writing
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " Focusing tool
Plug 'junegunn/goyo.vim', { 'on': 'Limelight' } " Focusing tool
Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' } " English spell check

call plug#end()

" General settings
" ================
let mapleader="\<Space>"
set hidden " Some kind of buffer tweak
set history=1000
set undofile
set undolevels=1000
set title " Set title of the window
set clipboard=unnamed " Use OS clipboard
" set encoding=utf-8
set mouse=a
set backspace=indent,eol,start
set lazyredraw
set ttyfast
set showmatch " Highlight matching pair
set list " Display invisibles
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
set visualbell " No noise just flash
set autochdir " Change working directory to current open buffer
set splitbelow " Horizontal splits open below the current window
set splitright " Vertical splits open right to the current window

let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True color palette
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Cursor based on modes

" Backup
set nobackup
set noswapfile
set autowrite
if has('persistent_undo')
  set undolevels=5000
  set undodir=$HOME/.VIM_UNDO_FILES
  set undofile
endif


" Syntax highlighting
" ===================
filetype on
filetype plugin on
filetype indent on
syntax enable
syntax on

" Command completion
" ==================
set wildmenu
set wildmode=longest,list,full
set wildignore+=build,cache,dist,coverage,node_modules

" Grep
" ====
" http://robots.thoughtbot.com/faster-grepping-in-vim/
set grepprg=ag\ --nogroup\ --nocolor
let g:ag_working_path_mode="r"

" Autoscroll
" ==========
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Status Line
" ===========
set laststatus=2

" Autocommands
" ============
" Resize vim on window resize
au VimResized * :wincmd =
" Save when losing focus
au FocusLost * :silent! :wall
" Strip trailing whitespaces
au BufWritePre * :silent :%s/\s\+$//e

" Only show cursorcolumn in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorcolumn
    au WinEnter * set cursorcolumn
augroup END

" Visual tweaks
" =============
set cursorcolumn " Highlight the coloumn of the cursor
set number " Display number on the sidebar
set relativenumber
set textwidth=80
set colorcolumn=+1
set nowrap
set linebreak

" Folding
" =======
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Change directory automatically for C-x C-f
" ==========================================
set autochdir

" Real programmers don't use TABs but spaces
" ==========================================
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set smarttab

" Search tweaks
" =============
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault " Set /g flag regex search

" Mappings
" ========
" Hide search highlights
nmap <silent> <BS>  :nohlsearch<CR>
" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>
" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv
" Use jk in insert mode to quickly switch to normal mode
inoremap jk <esc>
" Better navigation
nnoremap <silent> n nzt
nnoremap <silent> N Nzt
nnoremap <silent> * *zt
nnoremap <silent> # #zt
nnoremap <silent> g* g*zt
nnoremap <silent> g# g#zt

nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l

" Make y behave like other capitals
map Y y$
" Select all text in current buffer
map <Leader>a ggVG

" Commands
" ========
command! JSON :%!python -mjson.tool
command! XML :%!xmllint --format -
command! STANDARD :!standard-format % -w

" Typo protector lvl: 99999
" =========================
command! -bang -nargs=? -complete=file E e<bang> <args>
command! -bang -nargs=? -complete=file W w<bang> <args>
command! -bang -nargs=? -complete=file Wq wq<bang> <args>
command! -bang -nargs=? -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

" Colorscheme
" ===========
set t_Co=256
set background=dark
let g:two_firewatch_italics = 1 " Allow italics in firewatch theme
colorscheme two-firewatch

" The silver searcher (ACK)
" =========================
nmap <leader>/ :Ag<space>

" Dash
" ====
noremap <leader>d :Dash<CR>

" Limelight
" =========
let g:limelight_default_coefficient=0.7
nmap <leader>f :Limelight!!<cr>

" Fugitive
" ========
set diffopt+=vertical
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>

" UltiSnips
" =======
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Neomake
" =======
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_error_sign = {
            \ 'texthl': 'ErrorMsg',
            \ }
let g:neomake_warning_sign = {
            \ 'texthl': 'ErrorMsg',
            \ }
autocmd! BufWritePost * Neomake

" Fzf
" =======
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-path)
let g:fzf_layout = { 'down': '20%' }

" Ack vim
" =======
let g:ackprg = 'ag --vimgrep'

" Ctrl+P
" ======
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_use_caching = 0 " ag is fast enough that CtrlP doesn't need to cache

" Rainbow paren
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" DelimitMate
" ===========
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Signify
" =======
let g:signify_update_on_focusgained = 1

" Base64 decode in visual mode
vnoremap <leader>64 y:echo system('base64 --decode', @")<cr>

" Mocha vim
" =========
nnoremap <silent> <leader>mo :ToggleOnly<CR>
nnoremap <silent> <leader>ms :ToggleSkip<CR>
nnoremap <silent> ]t :FocusNextTest<CR>
nnoremap <silent> [t :FocusPreviousTest<CR>

" Airline
" =======
let g:airline_theme='twofirewatch'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

" GitGutter
" =========
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk

" Incsearch
" =========
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
