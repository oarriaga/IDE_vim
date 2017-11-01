" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation fetches from;
" https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-syntastic/syntastic'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'lervag/vimtex'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
" engine ultisnips and the snippets are in honza
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
" Plug 'ajh17/VimCompletesMe'
" Initialize plugin system
call plug#end()
" Call color scheme
colo molokai

" set relative coordinates
:set rnu

" snippets 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" takes extra tabs from snippets
set sw=4
" set super-tab from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"


" set complete+=kspell
autocmd FileType latex,tex,md,markdown,text setlocal complete+=kspell

" enable space in normal mode
" :nnoremap <space> i<space><esc>

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" easier vim split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open nerd tree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>


" Run current python3 script with F9
" nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
nnoremap <buffer> <F9> :exec '!ipython -i' shellescape(@%, 1)<cr>
nnoremap <buffer> <F8> :exec '!blender -b -P' shellescape(@%, 1)<cr>

" Set spell check"
set spell spelllang=en_us
"set spell spelllang=es

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Copy in the clipboard
vnoremap <C-c> "+y
noremap <C-v> "+p

" Select all text
" map <C-a> <esc>ggVG<CR>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Comment lines or blocks
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> @ :s/^#//<cr>:noh<cr>

" Enable syntax highlighting
syntax enable

" Show line numbers
set number

" Set tabs width to 4, it is still \t
set tabstop=4

" Expand tabs into spaces
set expandtab

" Indent when moving to the next line while writing code
set autoindent

" Show the matching part of the pair for [] {} and ()
set showmatch

" Enable all Python syntax highlighting features
let python_highlight_all = 1

" Mouse click
" set mouse=a

" Show a visual line under the cursor's current line
" set cursorline

" Easier indentation of code blocks
" In visual mode (v), select several lines of code press ``>`` several times.
vnoremap < <gv  
vnoremap > >gv 

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Hack to make light-line appear...
set laststatus=2

" Get rid of default vim mode
set noshowmode

" Eliminate delay between INSERT and ESCAPE
set timeoutlen=1000 ttimeoutlen=0

" Light-line configuration
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ }}

" Minimal configuration for jedi-vim
"let g:jedi#show_call_signatures = "2"
"autocmd FileType python setlocal completeopt-=preview

" Allow tab-completion for directories
"let g:SuperTabDefaultCompletionType = "context"
"
" Added callback option to remove warning in latex
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Expand trigger 
"let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsExpandTrigger="<c-j>"

" Take out function preview from YCM
" set completeopt-=preview

" YCM/Jedi-vim variables to work together
" https://github.com/Valloric/YouCompleteMe/issues/234
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_use_ultisnips_completer = 1
" let g:ycm_seed_identifiers_with_syntax = 1

" ---------------------------------------------------------------
"  jedi-vim
" ---------------------------------------------------------------
let g:jedi#popup_select_first=0
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 1
" allows for import auto-complete pop-up
let g:jedi#smart_auto_mappings = 1 
let g:jedi#popup_on_dot = 1
" this is kept with super-tab so it can do auto-complete with imports
let g:jedi#completions_command = "<C-N>"
" shows function arguments
let g:jedi#show_call_signatures = "2"
" removes document strings pop-up
autocmd FileType python setlocal completeopt-=preview


" Syntastic configuration
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['flake8']


"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


" Window
nmap <leader>s<left>  :topleft  vnew<CR>
nmap <leader>s<right> :botright vnew<CR>
nmap <leader>s<up>    :topleft  new<CR>
nmap <leader>s<down>  :botright new<CR>

" Move between spltis
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" needed so that the snippets recognize .tex files
let g:tex_flavor='latex'


