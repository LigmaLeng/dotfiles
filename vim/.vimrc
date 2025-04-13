runtime! archlinux.vim
" FORMATTING
set nocompatible
set fileformat=unix
filetype plugin on
syntax on

" SPACING
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set backspace=indent,eol,start

" UI
"
"   Indicators
set number
set hlsearch
set showmatch
set incsearch
set smartcase
set ignorecase
set relativenumber
set cursorlineopt=number
set matchpairs=(:),{:},[:],<:>

"   Drawing
set bg=dark
set ttyfast
set lazyredraw
let &t_ut=''

"   Window
set nowrap
set splitright
set scrolloff=5
set sidescroll=1
set winminheight=0
set foldmethod=manual
set splitkeep="screen"

"   Gutter
set showcmd
set showmode
set wildmenu
set laststatus=2
set shortmess=aost
set wildmode=list:longest

" Timing
set timeoutlen=200

" Netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" PERSISTENCE
set autowrite
if has("persistent_undo")
  set undofile
endif

" AUTOCOMMANDS
augroup ligrc_winch
  au!
  au WinLeave * setlocal nocursorline
  au BufWinLeave * {
    if !(&l:buftype =~# 'help\|nowrite\|nofile\|terminal' || &ft ==# 'netrw')
      mkview
    endif
  }
  au VimEnter,WinEnter * setlocal cursorline
  au BufWinEnter * {
    if &l:buftype ==# 'help'
      wincmd L
    else
      silent! loadview
    endif
  }
augroup END

augroup styleguide
  au!
  au BufRead,BufNewFile *.xml set tw=109 shiftwidth=2 smarttab
  au FileType sh set tw=79 shiftwidth=4 smarttab
  au FileType c set tw=79 shiftwidth=8
augroup END


" MAPPINGS
"
"   Leader
nnoremap <Space> <nop>
let mapleader=" "
"   Navigation
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz
nnoremap o o<ESC>
nnoremap O O<ESC>
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz
"   Bind meta-keys
execute "set <M-N>=\en"
execute "set <M-P>=\ep"
execute "set <M-B>=\eb"
execute "set <M-F>=\ef"
execute "set <M-D>=\ed"
"   Emacs-style insert mode
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-D> <Del>
inoremap <M-D> <C-O>de
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <M-B> <S-Left>
inoremap <M-F> <S-Right>
inoremap <M-N> <C-N>
inoremap <M-P> <C-P>
inoremap <C-N> <Down>
inoremap <C-P> <Up>
"   Emacs-style command mode
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
cnoremap <M-B> <S-Left>
cnoremap <M-F> <S-Right>
"   Highlight
nnoremap <Leader>n :noh<CR>
"   Writes and Quits
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
"   Pasting
xnoremap <Leader>p "_dP
"   Autoclose
inoremap () ()<LEFT>
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap <lt>> <lt>><LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap (<LEADER> ()
inoremap {<LEADER> {}
inoremap [<LEADER> []
inoremap <lt><LEADER> <lt>>
inoremap "<LEADER> ""
inoremap '<LEADER> ''
inoremap {<CR> {<CR><CR>}<UP><TAB>

set statusline=\ %Y[%M]\ Idx[\%l,\ %c\]\ =\ 0x%B%=\ %F\ %r
set modeline
