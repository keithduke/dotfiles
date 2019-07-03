""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
" This is my .vimrc
" There are many like it, but this one is mine.
" 
" I've drawn inspiration from the following
" https://github.com/romainl/idiomatic-vimrc
" https://dougblack.io/words/a-good-vimrc.html
" https://github.com/thoughtbot/dotfiles/blob/master/vimrc
" https://pragprog.com/book/dnvim2/practical-vim-second-edition
" https://pragprog.com/book/modvim/modern-vim
"
" http://www.textfiles.com/art/texthistory.txt
" https://thenewstack.io/surprisingly-rich-history-ascii-art/
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  ,,,
"                                 (o o)
" ----------------------------oOO--( )--OOo-------------------------------------
"
"                             Basic Tweaks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" better safe than sorry
" https://stackoverflow.com/a/5845583
set nocompatible

" see :help :filetype-overview
filetype plugin indent on

" https://github.com/thoughtbot/dotfiles/blob/master/vimrc
" switch syntax highlighting on, when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set backspace=indent,eol,start  " proper backspace behavior
set linespace=0                 " No extra spaces between rows
set nowrap                      " wrap long lines
set autoindent                  " indent at the same level as the previous line
set showmatch                   " show matching brackets/parenthesis

" ui tweaks
set number                      " Line numbers on
set virtualedit=onemore         " allow for cursor beyond last character

if filereadable(expand("~/.vim/pack/bundle/start/vim-colors-solarized/colors/solarized.vim"))
    set term=xterm-256color " TODO only need this for color to work, why though
                            " https://superuser.com/q/311370
    let g:solarized_termcolors=256
    syntax enable
    set background=dark
    colorscheme solarized
    let g:airline_theme='solarized'
endif

" space over tab
" https://softwareengineering.stackexchange.com/a/66
set shiftwidth=4                " use indents of 4 spaces
set tabstop=4                   " an indentation every four columns
set expandtab                   " 4 space tabs everywhere

" searching tweaks
set incsearch                   " find as you type search, hit '<CR>' to stop.
set hlsearch                    " highlight search terms
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uppercase present
set wildmenu                    " command-line completion
set wildmode=list:longest,full  " command <Tab> completion

" movement and scrolling tweaks
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor

" move vertically by visual line, skip over soft wrap lines
nnoremap j gj
nnoremap k gk

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" brains
set hidden                      " more than one unsaved buffer
set history=500                 " default is 20
set viewoptions=folds,options,cursor,unix,slash " :help viewoptions
set nobackup                    " no backup, swapfiles
set nowritebackup
set noswapfile


" key (re)mappings 
" the default leader is '\', but many people, myself included prefer ',' as it's
" in a standard postion
let mapleader = ','

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Folding
" :help usr_28
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" space open/closes folds
nnoremap <space> za


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  \ /
"                          -----==( o )==-----
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bundles
" Using Vim 8 built in bundle support, all bundles I use are
" just cloned into ~/.vim/pack/bundle/start/
" here is what I currently use and any config jiggering
" https://github.com/vim-airline/vim-airline.git
" https://github.com/scrooloose/nerdtree.git
" https://github.com/tpope/vim-fugitive.git
" https://github.com/jlanzarotta/bufexplorer.git
" https://github.com/vim-airline/vim-airline-themes.git
" https://github.com/altercation/vim-colors-solarized.git

map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  \__/                                                                        
"  (oo)                                                                        
" //||\\                                                                       
"                                                                              
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
