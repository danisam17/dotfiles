" O HAI
" .vimrc
" @imkmf

" Bundles {{{

" Pathogen setup
runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen
call pathogen#infect()

" Bundle: itchyny/lightline.vim
" Bundle: amiel/vim-tmux-navigator
" Bundle: tpope/vim-sensible
" Bundle: endwise.vim
" Bundle: tpope/vim-commentary
" Bundle: tpope/vim-surround
" Bundle: kien/ctrlp.vim
" Bundle: rking/ag.vim
" Bundle: Lokaltog/vim-easymotion
" Bundle: jtratner/vim-flavored-markdown
" Bundle: kchmck/vim-coffee-script
" Bundle: mustache/vim-mustache-handlebars
" Bundle: tpope/vim-rails
" Bundle: "mattn/emmet-vim"
" Bundle: "fatih/vim-go"
" Bundle: tpope/vim-fugitive

" }}}

" vimrc settings {{{
"
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

" }}}

" Basics {{{

" Gratuitous theft from
" https://bitbucket.org/sjl/dotfiles
" Disable vim modeline
set modelines=0

" Mode indications
set showmode
set showcmd

" Hide extra vim info because lightline
set noshowmode

" Retain buffers until quit
set hidden

" No bells!
set visualbell

" Define characters to show when you show formatting
" stolen from https://github.com/tpope/vim-sensible
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif

" Fast scrolling
set ttyfast

" Path/file expansion in colon-mode.
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

" Better dividers
set isk+=_,$,@,%,#,-

" Space it out a little more (easier to read)
set lsp=0

" Line numbers are nice
set ruler

" Backspace for normal people
set backspace=indent,eol,start

" Always show status
set laststatus=2

" Show whitespace
set list

" Pretty self-explanatory
set lazyredraw

" Brace face
set showmatch
set matchtime=3

" Split down and right
set splitbelow
set splitright

" Good indentation
" set shiftround

" Read filetype stuff
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

" Resize splits when the window is resized
au VimResized * :wincmd =

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set autoindent
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Search shows all results
set hlsearch

" }}}

" History/Undo settings {{{

" We have computers with pretty big
" hard drives, so let's keep these
set history=1000
set undofile
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
" }}}

" Colors {{{
syntax enable
colorscheme ir_black " .vim/colors/*.vim

" }}}

" Key commands {{{

let mapleader = ","
let g:mapleader = ","

" Vertical split
nnoremap <leader>w <C-w>v<C-w>l
" Horizontal split
nnoremap <leader>h <C-w>s<C-w>l

" j-k smash
inoremap jk <esc>
inoremap kj <esc>

" Save, yo
nnoremap <cr> :w<cr>

" Better command keys
nnoremap ; :

" Turn off nohlsearch
nmap <silent> <leader><Space> :nohlsearch<CR>

" Switch between files with ,,
nnoremap <leader><leader> <c-^>

" Ruby hashrocket madness
nnoremap <leader>r :%s/:\(\w*\)\s*=>\s*/\1: /gc<cr>

nnoremap <space> za

" }}}

" Filetypes {{{

" Remove trailing whitespace in files
autocmd BufWritePre * :%s/\s\+$//e

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

augroup handlebars
    au!
    au BufNewFile,BufRead *.hbs,*.hbs.ember setlocal filetype=mustache
augroup END

augroup golang
    autocmd BufRead *.go set nolist
augroup END

" }}}

" Plugins {{{

"" Ignore rules

set wildignore+=*/tmp/*,*.so,*.swp,*.zip              " MacOSX/Linux
set wildignore+=*/node_modules/*,*/bower_components/* " Node.js
set wildignore+=*/vendor/*,*/dist/*                   " Meh

" Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Easymotion
map \\ <Plug>(easymotion-prefix)

" }}}

