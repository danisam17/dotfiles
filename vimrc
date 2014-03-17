" Pathogen setup
runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen
call pathogen#infect()

" Bundles
"
" Bundle: amiel/vim-tmux-navigator
" Bundle: tpope/vim-sensible
" Bundle: bling/vim-airline
" Bundle: endwise.vim
" Bundle: tpope/vim-commentary
" Bundle: kien/ctrlp.vim
" Bundle: jtratner/vim-flavored-markdown

" .vimrc folding
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" Reload .vimrc on save (good for editing)
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" Unfold with space!

" Basics {{{

" Gratuitous theft from
" https://bitbucket.org/sjl/dotfiles
set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set relativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set autowrite
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1

filetype plugin on
filetype indent on

set history=700

filetype plugin on
filetype indent on

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Set to auto read when a file is changed from the outside
set autoread

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" }}}

" Undo files {{{
set undofile
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
" }}}

" Colors {{{
syntax enable
colorscheme grb256 " .vim/colors/*.vim
set background=dark

let g:airline_theme="luna"
let g:airline_powerline_fonts = 1

" }}}

" Key remapping {{{

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nnoremap <leader>w <C-w>v<C-w>l

" j-k smash
inoremap jk <esc>
inoremap kj <esc>

" Better command keys
nnoremap ; :

" Code folding with space
nnoremap <Space> za
vnoremap <Space> za

" Switch between files with ,,
nnoremap <leader><leader> <c-^>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" }}}

" Key commands {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
" :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" }}}

" Filetypes {{{

" Remove trailing whitespace in Ruby files
autocmd BufWritePre *.rb :%s/\s\+$//e

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter,FileType ruby
        \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
  let collumnLimit = 79 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType ruby
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END
" }}}

