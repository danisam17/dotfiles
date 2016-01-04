" .vimrc
" @imkmf

set shell=$SHELL

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'davidoc/taskpaper.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'flazz/vim-colorschemes'
Plug 'imkmf/ctrlp-branches'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'dhruvasagar/vim-table-mode'
call plug#end()

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
" scrolling
set mouse=a
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
" We have computers with pretty big
" hard drives, so let's keep these
set history=1000
set undofile
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
" Colors
syntax enable
set background=light
colorscheme default
let macvim_skip_colorscheme=1
" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
" Leader is: <Space>
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
" Vertical split
nnoremap <leader>w <C-w>v<C-w>l
" Horizontal split
nnoremap <leader>h <C-w>s<C-w>l
" j-k smash
inoremap jk <esc>
inoremap kj <esc>
" Save all the time with return
nnoremap <cr> :w<cr>
" No shift-reaching
nnoremap ; :
" Buffer commands
nmap <c-b> :bprevious<CR>
nmap <c-n> :bnext<CR>
nmap bb :bw<CR>
" Turn off nohlsearch
nmap <silent> <leader><Space> :nohlsearch<CR>
" Interactive find-and-replace for :foo => bar to foo: bar
nnoremap <leader>r :%s/:\(\w*\)\s*=>\s*/\1: /gc<cr>

"" Filetypes

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

"" Ignore rules
set wildignore+=*/tmp/*,*.so,*.swp,*.zip              " MacOSX/Linux
set wildignore+=*/node_modules/*,*/bower_components/* " Node.js
set wildignore+=*/vendor/*,*/dist/*,/target/*         " Meh
set wildignore+=*/Godeps/*                            " Go

" ctrl-p
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>i :CtrlPBuffer<cr>
let g:ctrlp_extensions = [
      \ 'branches',
      \ ]

nnoremap <leader>g :CtrlPBranches<cr>
nnoremap <leader>p :CtrlP<cr>

" Airline
let g:airline_theme="light"
let g:airline_powerline_fonts = 1

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

" some font bullshit
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Inconsolata\ for\ Powerline:h15
  endif
endif
