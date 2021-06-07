" # My vimfiles
"
" As I am using neovim now I converted this repo to be a very minimal vimrc which I could use in any machine
"
" ## Installation
"
"   curl https://raw.githubusercontent.com/andrewaguiar/.vimfiles/master/.vimrc > /tmp/mvimrc
"
" ## Usage
"
"   vim -u /tmp/mvimrc
"

set nocompatible
set nocp

let mapleader=","

filetype plugin indent on
syntax on

set hidden

set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set ruler
set shiftwidth=2
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,**/tmp/**,node_modules
set title
set noerrorbells
set cursorline
set nobackup
set noswapfile
set t_Co=256
set background=dark
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set mouse=a
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

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
cmap w!! w !sudo tee % >/dev/null
