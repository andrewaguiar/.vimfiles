" This must be first, because it changes other options as side effect
set nocompatible

" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()
execute pathogen#infect()

" change the mapleader from \ to ,
let mapleader=","

set hidden

set tabstop=2     " a tab is two spaces
set shiftwidth=2
set expandtab

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
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

filetype plugin indent on

" turn syntax on
syntax on

colorscheme badwolf

" Change editing behaviour
"
" When you write a lot of code, you probably want to obey certain style rules
" In some programming languages (like Python), whitespace is important, so you
" may not just swap tabs for spaces and even the number of spaces is important
"
" Vim can highlight whitespaces for you in a convenient way:
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Pasting large amounts of text into Vim
"
" Every Vim user likes to enable auto-indenting of source code, so Vim can intelligently 
" position you cursor on the next line as you type. This has one big ugly consequence however: 
" when you paste text into your terminal-based Vim with a right mouse click, Vim cannot know it 
" is coming from a paste. To Vim, it looks like text entered by someone who can type incredibly 
" fast :) Since Vim thinks this is regular key strokes, it applies all auto-indenting and 
" auto-expansion of defined abbreviations to the input, resulting in often cascading indents 
" of paragraphs.
"
" There is an easy option to prevent this, however. You can temporarily switch to “paste mode”, 
" simply by setting the following option:
set pastetoggle=<F3>

" Enables mouse
set mouse=a

" Allows use ; instead of :
nnoremap ; :

" Turns off search highlighting.
nnoremap <Leader><space> :noh<CR>

" Forces to use h j k l keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Use cursor keys to navigate buffers.
map  <Right> :bnext<CR>
map  <Left>  :bprev<CR>
imap <Right> <ESC>:bnext<CR>
imap <Left>  <ESC>:bprev<CR>
map  <Del>   :bd<CR>

nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" BufExplorer configuration
nmap <script> <silent> <unique> <Leader><Leader> :BufExplorer<CR>
let g:bufExplorerShowRelativePath=1

" ack.vim
nmap <silent> <unique> <Leader>a :Ack
nmap <silent> <unique> <Leader>as :AckFromSearch
nmap <silent> <unique> <Leader>af :AckFile

"https://github.com/chad/vimfiles/blob/master/vimrc
" NERDTree settings
" Enable nice colors
let NERDChristmasTree = 1
" Make it easy to see where we are
let NERDTreeHighlightCursorline = 1
" Show hidden files
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.$', '\~$']
" Make F2 open NERDTree
nmap <F2> :NERDTreeToggle<cr>
" https://github.com/kien/ctrlp.vim/issues/78
" let g:ctrlp_dont_split = 'nerdtree'
let g:ctrlp_dont_split = 'NERD_tree_2'

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

let g:ctrlp_max_files=9999999999
let g:ctrlp_follow_symlinks=1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|deps\|_build'

" NERDCommenter
let NERDDefaultNesting = 0
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1

au BufRead,BufNewFile *.scss set filetype=scss

set runtimepath^=~/.vim/bundle/ag

nmap <F4> :.w !pbcopy<CR><CR>
vmap <F4> :w !pbcopy<CR><CR>

" BASICS
nnoremap <Leader>. :bd<esc>
nnoremap <Leader>w :w<esc>

" RUBY
nnoremap <Leader>rc oputs "#" * 90; puts caller; puts "#" * 90<esc>
nnoremap <Leader>rp obinding.pry<esc>
" JAVASCRIPT
nnoremap <Leader>jp odebugger<esc>
" ELIXIR
nnoremap <Leader>xp o(require IEx; IEx.pry)<esc>
nnoremap <Leader>xm odefmodule A do<c-m>end<esc>k0^wciw
nnoremap <Leader>xd odef foo() do<c-m>end<esc>k0^wciw
