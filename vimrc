""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" A minimalist vimrc, with on demand loading of plugins
"
" This is the personal .vimrc of Keith Duke
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

" ui tweaks
set showmatch                   " show matching brackets/parenthesis
set number                      " Line numbers on
set virtualedit=onemore         " allow for cursor beyond last character

" space over tab
" https://softwareengineering.stackexchange.com/a/66
set shiftwidth=4                " use indents of 4 spaces
set tabstop=4                   " an indentation every four columns
set expandtab                   " 4 space tabs everywhere

" 80 columns width
" https://stackoverflow.com/a/111009
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" searching tweaks
set incsearch                   " find as you type search, hit '<CR>' to stop.
set hlsearch                    " highlight search terms
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uppercase present
set wildmenu                    " command-line completion
set wildmode=list:longest,full  " command <Tab> completion

" clear highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

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
set backup                      " backups are nice ...
if has('persistent_undo')
    set undofile                "so is persistent undo ...
    set undolevels=1000         "maximum number of changes that can be undone
    set undoreload=10000        "maximum number lines to save for undo on a buffer reload
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  \ /
"                          -----==( o )==-----
"
"                          ruler & statusline
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showmode                    " display the current mode
if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\        " Filename
    set statusline+=%w%h%m%r    " Options
    " set statusline+=%{fugitive#statusline()} "  Git TODO turned off, need
                                               "  to configure plug first
    set statusline+=\ [%{&ff}/%Y] " filetype
    set statusline+=\ [%{getcwd()}] " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif


" key (re)mappings 
" the default leader is '\', but many people, myself included prefer ',' as it's
" in a standard postion
let mapleader = ','

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn ( loved it, borrowed from thoughtbot )
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" Folding
" :help usr_28
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" space open/closes folds
nnoremap <space> za


" Bundles TODO coming soon



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  \__/                                                                        "
"  (oo)                                                                        "
" //||\\                                                                       "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""