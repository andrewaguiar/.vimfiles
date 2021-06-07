" This must be first, because it changes other options as side effect
set nocompatible
set nocp

" change the mapleader from \ to ,
let mapleader=","

filetype plugin indent on
syntax on

set hidden

set tabstop=2     " a tab is two spaces
set shiftwidth=2
set expandtab
set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set ruler
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,**/tmp/**,node_modules
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set cursorline
set nobackup
set noswapfile
set t_Co=256 " 256 colors
set background=dark
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set mouse=a
set laststatus=2

nnoremap ; :

map <right> <nop>
map <left> <nop>
map <up> <nop>
map <down> <nop>
map  <Tab> :bnext<CR>
map  <S-Tab>  :bprev<CR>
imap <Tab> <ESC>:bnext<CR>
imap <S-Tab>  <ESC>:bprev<CR>
nnoremap j gj
nnoremap k gk
nnoremap <Leader><space> :noh<CR>
nnoremap <C-p> :e .<CR>
