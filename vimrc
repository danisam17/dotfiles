" O HAI
" .vimrc
" @imkmf

" Plugins {{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'amiel/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'endwise.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kana/vim-textobj-user'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rking/ag.vim'
Plugin 'fatih/vim-go'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'airblade/vim-gitgutter'
Plugin 'twerth/ir_black'
Plugin 'bling/vim-airline'

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
nnoremap <space> za

" }}}

" Basics {{{

" Gratuitous theft from
" https://bitbucket.org/sjl/dotfiles

" Who knows what the fuck 5 is supposed to mean?
set modelines=5

" Mode indications
set showmode
set showcmd

" Retain buffers until quit
set hidden

" No bells!
set visualbell

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

" Line numbering
set number

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
colorscheme ir_black

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

" Plugins {{{

"" Ignore rules

set wildignore+=*/tmp/*,*.so,*.swp,*.zip              " MacOSX/Linux
set wildignore+=*/node_modules/*,*/bower_components/* " Node.js
set wildignore+=*/vendor/*,*/dist/*                   " Meh

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" The Silver Searcher
" if executable('ag')
"   " Use ag over grep
"   set grepprg=ag\ --nogroup\ --nocolor

"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -i -l --nocolor --nogroup -g ""'

"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" endif

" Easymotion
map \\ <Plug>(easymotion-prefix)

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="solarized"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" Rails.vim
map <leader>a :A<cr> " alternate
map <leader>rc :Rcontroller<space> " controller
map <leader>re :Renvironment<space> " environment
map <leader>ri :Rinitializer<space> " initializer
map <leader>rl :Rlib<space> " lib
map <leader>rm :Rmodel<space> " model
map <leader>rs :Rspec<space> " spec

" Completion
let g:neocomplcache_enable_at_startup = 0

" }}}

" Tests {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <leader>t :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>
" nnoremap <leader>c :w\|:!script/features<cr>
" nnoremap <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        " First choice: project-specific test script
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        " Fall back to the .test-commands pipe if available, assuming someone
        " is reading the other side and running the commands
        elseif filewritable(".test-commands")
          let cmd = 'rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
          exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

          " Write an empty string to block until the command completes
          sleep 100m " milliseconds
          :!echo > .test-commands
          redraw!
        " Fall back to a blocking test run with Pluginr
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        " Fall back to a normal blocking test run
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

" }}}
