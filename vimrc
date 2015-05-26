" O HAI
" .vimrc
" @imkmf

" You might not have this
" if you aren't using Homebrew
set shell=/usr/local/bin/bash

" Plugins {{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" Vim config
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'endwise.vim'

Plugin 'rust-lang/rust.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'imkmf/ctrlp-branches'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'sgur/ctrlp-extensions.vim'

Plugin 'SirVer/ultisnips'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'croaky/vim-colors-github'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'w0ng/vim-hybrid'
" Plugin 'twerth/ir_black'
"" Shell/non-Vim interfacing
Plugin 'airblade/vim-gitgutter'
Plugin 'amiel/vim-tmux-navigator'
Plugin 'rking/ag.vim'
"" Language specific
Plugin 'fatih/vim-go'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'davidoc/taskpaper.vim'
" Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'osyo-manga/vim-over'
" Plugin 'bruno-/vim-ruby-fold'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" }}}

" vimrc settings {{{
"
" .vimrc folding
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" Fold with space
" nnoremap <space> za

" }}}

" Basics {{{

" Retain buffers until quit
set hidden

" No bells!
set visualbell

" Fast scrolling
set ttyfast

" Path/file expansion in colon-mode.
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

" Line numbers are nice
set ruler

" Backspace for normal people
set backspace=indent,eol,start

" Always show status
set laststatus=2

" Brace face
set showmatch
set matchtime=3

" Split down and right
set splitbelow
set splitright

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
set incsearch
set showmatch
set hlsearch

" Line numbering
set number

let g:netrw_liststyle=3

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
set background=light
colorscheme github
" }}}

" Key commands {{{

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

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

" Buffer commands
nmap <c-b> :bprevious<CR>
nmap <c-n> :bnext<CR>
nmap bb :bw<CR>

" Turn off nohlsearch
nmap <silent> <leader><Space> :nohlsearch<CR>

" Switch between files with ,,
nnoremap <leader><leader> <c-^>

" Ruby hashrocket madness
nnoremap <leader>r :%s/:\(\w*\)\s*=>\s*/\1: /gc<cr>

" this.element => this.get('element'), hi ember
" this is a shitty macro and i should feel bad
nnoremap <leader>e b<esc>iget('<esc>wwi')<esc>

" open directory in netrw
nnoremap <leader>o :Explore %:h<cr>

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

augroup ft_go
    au!

    au Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
    au Filetype go setlocal nolist
augroup END

" }}}

" Plugin configurations {{{

"" Ignore rules

set wildignore+=*/tmp/*,*.so,*.swp,*.zip              " MacOSX/Linux
set wildignore+=*/node_modules/*,*/bower_components/* " Node.js
set wildignore+=*/vendor/*,*/dist/*,/target/*         " Meh

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>i :CtrlPBuffer<cr>

let g:ctrlp_extensions = [
      \ 'branches',
      \ 'funky',
      \ 'yankring'
      \ ]

nnoremap <leader>g :CtrlPBranches<cr>
nnoremap <Leader>fu :CtrlPFunky<Cr>

let g:UltiSnipsExpandTrigger="<tab>"

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="light"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Tmuxline
let g:tmuxline_powerline_separators = 0

" Gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" vim-over
function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" }}}
