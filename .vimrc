set nocompatible              " be iMproved, required
filetype off                  " required

" vim-polyglot settings
let g:polyglot_disabled = ['sensible']

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'
"Plugin 'dense-analysis/ale'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
"Plugin 'junegunn/fzf'
"Plugin 'junegunn/fzf.vim'
"Plugin 'rust-lang/rust.vim'
"Plugin 'racer-rust/vim-racer'
"Plugin 'hashivim/vim-terraform'
"Plugin 'moll/vim-node'
"Plugin 'scrooloose/nerdtree'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'python-mode/python-mode'
"Plugin 'ctrlpvim/crtlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"let g:rustfmt_autosave = 1

runtime macros/matchit.vim

if !has('nvim')
  fixdel
endif

let g:go_version_warning = 0

setglobal fileencoding=utf-8

set belloff=all
set backspace=indent,eol,start
set ignorecase
set smartcase
set ruler
set number
set sidescroll=1
set bg=light
set ts=2
set shiftwidth=2
set expandtab
set wrap linebreak
set nowrap
"set gfn=Monaco\ 10
set formatoptions-=cro
set tags=tags;
set ai
set number
set hlsearch
set scrolloff=10
set modeline
set modelines=5
set mmp=2000000
"set textwidth=80

set nobackup
set noswapfile

" Colors
syntax on
colorscheme arcadium

let g:syntastic_dockerfile_checkers = [ 'dockerfile_lint' ]
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_python_checkers = ['flake8']

"let g:pymode_python = 'python3'

set laststatus=2
set statusline=[%n]\ %<%f%h%m%=%l,%c\ \

"set mouse=a

autocmd FileType make setlocal noexpandtab
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd Filetype python setlocal ts=4 sts=4 sw=4

"whitespace
set listchars=tab:\|\ ,trail:·     
highlight SpecialKey ctermfg=DarkGray
set nolist

"ale settings
"let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠️'
"let g:ale_sign_column_always = 1
"let g:ale_set_highlights = 1

"let g:my_ale_toggle_enabled=1

"function! ALEToggle()
"  if g:my_ale_toggle_enabled
"    ALEDisable
"    let g:my_ale_toggle_enabled=0
"  else
"    ALEEnable
"    let g:my_ale_toggle_enabled=1
"  endif
"endfunction

"nmap <silent> [c <Plug>(ale_previous_wrap)
"nmap <silent> ]c <Plug>(ale_next_wrap)

" spelling
set spell spelllang=en_us
set nospell
" ]s - next misspelled word
" [s - prev misspelled word
" z= - autocompletion for word
" zg - add word to dictionary
" zw - mark work as correct


" gutentags_plus
let g:gutentags_cache_dir = expand('~/.cache/tags')

"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=blue ctermbg=black
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=#202020

"au BufWrite * :Autoformat

" Remap esc
inoremap \\ <ESC>

" Enter
" Clear highlighting by hitting return in normal mode
nnoremap <cr> :noh<cr><cr>

" Ctrl-Up
" ^[[A on Mac - iTerm2
nnoremap <Esc>[A (
inoremap <Esc>[A <C-o>(
" ^[[1;5A on Linux - Terminator
nnoremap <Esc>[1;5A (
inoremap <Esc>[1;5A <C-o>(

" Ctrl-Down
" ^[[B on Mac - iTerm2
nnoremap <Esc>[B )
inoremap <Esc>[B <C-o>)
" ^[[1;5B on Linux - Terminator
nnoremap <Esc>[1;5B )
inoremap <Esc>[1;5B <C-o>)

" Ctrl-Right
" ^[[C on Mac - iTerm2
nnoremap <Esc>[C w
inoremap <Esc>[C <C-o>w
" ^[[1;5C on Linux - Terminator
nnoremap <Esc>[1;5C w
inoremap <Esc>[1;5C <C-o>w

" Ctrl-Left
" ^[[D on Mac - iTerm2
nnoremap <Esc>[D b
inoremap <Esc>[D <C-o>b
" ^[[1;5D on Linux - Terminator
nnoremap <Esc>[1;5D b
inoremap <Esc>[1;5D <C-o>b

" Del
" Delete in normal and insert mode
nnoremap <Esc>[3~ x
inoremap <Esc>[3~ <C-o>x

" Ctrl-Z
" Undo in insert mode
inoremap <C-z> <C-o>u

" Folding
"
" za/zA - toggle fold, one level/all levels
" zc/zC - close fold
" zo/zO - open fold
" zm/zM - fold everything in buffer
" zr/zR - unfold everything in buffer
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "don't fold by default
set foldlevel=1         "this is just what i use

" vim-json settings
" -----------------
let g:vim_json_syntax_conceal = 0

" NERDTree settings
"------------------
"autocmd vimenter * NERDTree
"map <C-n> :NERDTreeToggle<cr>


" Enable CursorLine
set cursorline

" Default Colors for CursorLine
highlight CursorLine cterm=None ctermbg=None

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight CursorLine cterm=None ctermfg=None ctermbg=DarkGrey
"autocmd InsertEnter * highlight CursorLine cterm=underline ctermfg=None

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight CursorLine cterm=None ctermbg=None ctermfg=None

" Terraform settings
" let g:terraform_align=1
" let g:terraform_fmt_on_save=1

" Leader commands
"-----------------------------------------------
let mapleader = ","
" Quit - ,q
noremap <leader>q :q<cr>
" Save - ,w
noremap <leader>w :w<cr>
" Next file - ,n
noremap <leader>n :bn<cr>
" Previous file - ,p
noremap <leader>p :bp<cr>
" Swap files - ,,
noremap <leader><leader> :b#<cr>

" Force quit - ,Q
noremap <leader>Q :q!<cr>
" Save and next file - ,N
noremap <leader>N :w<cr>:bn<cr>
" Save and previous file - ,P
noremap <leader>P :w<cr>:bp<cr>
" Remove file from buffer - ,x
noremap <leader>x :bd<cr>


" Justify a paragrah
noremap <leader>y gpG

" Highlight word under cursor - ,h
noremap <leader>h *

" Goto previous error - [n
noremap [n :cprev<cr>
" Goto next error - ]n
noremap ]n :cnext<cr>
" Goto first error - [N
noremap [N :cfirst<cr>
" Goto last error - ]N
noremap ]N :clast<cr>


" Run GoBuild - ,b or ,B
noremap <leader>b :w<cr>:GoImports<cr>:GoBuild<cr>
noremap <leader>B :w<cr>:GoImports<cr>:GoBuild<cr>

" Run GoTest - ,t or ,T
noremap <leader>t :w<cr>:GoImports<cr>:GoTest<cr>
noremap <leader>T :w<cr>:GoImports<cr>:GoTest<cr>

noremap <leader>c :w<cr>:GoImports<cr>:GoCoverage<cr>

" Split screen
noremap <leader>H :new<cr>
noremap <leader>D :vnew<cr>

" Run GoImports - ,i or ,I
noremap <leader>i :w<cr>:GoImports<cr>
noremap <leader>I :w<cr>:GoImports<cr>


" Run git diff in new window
noremap <leader>d :!git diff -w %<cr>
noremap <leader>D :!git diff -w --cached %<cr>

" List all buffers - ,l
noremap <leader>l :ls<cr>:buffer<Space>
" Nth buffer - ,#  i.e. ,1 ,2 ,3 etc
noremap <leader>1 :b1<cr>
noremap <leader>2 :b2<cr>
noremap <leader>3 :b3<cr>
noremap <leader>4 :b4<cr>
noremap <leader>5 :b5<cr>
noremap <leader>6 :b6<cr>
noremap <leader>7 :b7<cr>
noremap <leader>8 :b8<cr>
noremap <leader>9 :b9<cr>
noremap <leader>0 :b10<cr>

noremap <leader>j :set paste!<cr>
noremap <leader>m :set number!<cr>
noremap <leader>s :set spell!<cr>
noremap <leader>L :set list!<cr>
noremap <leader>W :set wrap!<cr>

" Reload vimrc - ,r
noremap <leader>r :so $MYVIMRC<cr>

" Ctrl - /
" Be able to insert comment at the beginning of a line.
noremap <C-_> I// <Esc>hhj

" Ctrl-J
" go boilerplate
noremap <C-J> oif err != nil {<cr>return err<cr>}<cr><Esc>
inoremap <C-J> if err != nil {<cr>return err<cr>}<cr>

" Save buffers to a session file
noremap <leader>S :set sessionoptions=buffers<cr>:mksession Session.vim<cr>

noremap <leader>R :SyntasticReset<cr>
