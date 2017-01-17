" This must be first, because it changes other options as side effect
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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
set wildignore=*.swp,*.bak,*.pyc,*.class,**/tmp/**,
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

" Turns off search highlighting.
nnoremap <Leader><space> :noh<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

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

" Tabularize
"if exists(':Tabularize')
"           ^^^^^^^^^^^^ for some reason Tabularize hasn't loaded when Vim gets here
" key = value
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
" key { value
nmap <Leader>t{ :Tabularize /{<CR>
vmap <Leader>t{ :Tabularize /{<CR>
" key => value
nmap <Leader>t> :Tabularize /=><CR>
vmap <Leader>t> :Tabularize /=><CR>
" key: value
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
" Ruby symbols
nmap <Leader>ts :Tabularize /:/l1c0l0<CR>
vmap <Leader>ts :Tabularize /:/l1c0l0<CR>
" key, value
nmap <Leader>t, :Tabularize /,<CR>
vmap <Leader>t, :Tabularize /,<CR>


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

let g:ctrlp_max_files=999000
let g:ctrlp_follow_symlinks=1

" NERDCommenter
let NERDDefaultNesting = 0
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1

au BufRead,BufNewFile *.scss set filetype=scss

set runtimepath^=~/.vim/bundle/ag

nmap <F4> :.w !pbcopy<CR><CR>
vmap <F4> :w !pbcopy<CR><CR>

" All functions bellow from https://github.com/vim-scripts/Specky
"
" When in ruby code or an rspec BDD file, try and search recursively through
" the filesystem (within the current working directory) to find the
" respectively matching file.  (code to spec, spec to code.)
"
" This operates under the assumption that you've used chdir() to put vim into
" the top level directory of your project.

function! SpecSwitcher()
  " If we aren"t in a ruby or rspec file then we probably don"t care
  " too much about this function.
  if &ft != "ruby" && &ft != "rspec"
    call s:err( "Not currently in ruby or rspec mode." )
    return
  endif

  " Ensure that we can always search recursively for files to open.
  let l:orig_path = &path
  set path=**

  " Get the current buffer name, and determine if it is a spec file.
  "
  " /tmp/something/whatever/rubycode.rb ---> rubycode.rb
  " A requisite of the specfiles is that they match to the class/code file,
  " this emulates the eigenclass stuff, but doesn't require the same
  " directory structures.
  "
  " rubycode.rb ---> rubycode_spec.rb
  let l:filename     = matchstr( bufname("%"), "[0-9A-Za-z_.-]*$" )
  let l:is_spec_file = match( l:filename, "_spec.rb$" ) == -1 ? 0 : 1

  if l:is_spec_file
    let l:other_file = substitute( l:filename, "_spec\.rb$", "\.rb", "" )
  else
    let l:other_file = substitute( l:filename, "\.rb$", "_spec\.rb", "" )
  endif

  let l:bufnum = bufnr( l:other_file )
  if l:bufnum == -1
    " The file isn"t currently open, so let"s search for it.
    execute "find " . l:other_file
  else
    " We've already got an open buffer with this file, just go to it.
    execute "buffer" . l:bufnum
  endif
  "execute "set path=" . l:orig_path
endfunction

nnoremap <leader>. :call SpecSwitcher()<cr>

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Debugging ruby
nnoremap <Leader>kk o# kc: puts the caller<c-m># km: puts the method location<c-m># ko: puts a object tracer<c-m># kb: puts a binding.pry<c-m><esc>
" puts the caller
nnoremap <Leader>kc oputs "#" * 90; puts caller; puts "#" * 90<esc>
" puts the method location
nnoremap <Leader>km oputs method(:method).source_location<esc>^wwwciw
" puts a object tracer
nnoremap <Leader>ko ox = result; require 'objspace'; ObjectSpace.trace_object_allocations_start; puts "#" * 90; puts("trace object: #{{ ObjectSpace.allocation_sourcefile(x) => ObjectSpace.allocation_sourceline(x) }}"); puts "#" * 90<esc>^wwciw
" puts a binding.pry
nnoremap <Leader>kb obinding.pry<esc>
" puts a binding.pry
nnoremap <Leader>kbj odebugger<esc>
