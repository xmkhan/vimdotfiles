set nocompatible
call pathogen#infect('~/.vim/bundle')
syntax on
filetype plugin indent on
filetype indent on
au BufWritePost .vimrc so ~/.vimrc
au BufNewFile,BufRead *.md set ft=md
autocmd BufWritePost *.py call Flake8()
au BufWritePost *.coffee silent CoffeeMake!
syntax enable
filetype plugin on
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
set tags=tags;/
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gtk
set showcmd
set showmode
set backspace=indent,eol,start
set background=dark
set hidden
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set number
set ruler
set incsearch
set hlsearch
set showmatch
set wrap
set visualbell
set directory=.,$TEMP
set ls=2
set t_Co=256
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
colorscheme molokai
set guifont=Monaco:h12
set tabstop=4
set shiftwidth=4
set noswapfile
set nobackup
vnoremap < <gv
vnoremap > >gv
map H ^
map L $
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let mapleader = ","
map <silent><Leader>/ :nohls<CR>
map <Leader>[ :copen<CR>
map <Leader>] :cclose<CR>
map <Leader> :A<CR>
" automatically open and close the popup menu / preview window
autocmd BufWritePost *.h,*.hpp,*.c,*.cpp,*.cxx,*.cc call g:ClangUpdateQuickFix()
let g:clang_debug=1
let g:clang_auto_select=1
" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto=0
" Show clang errors in the quickfix window
let g:clang_complete_copen=0
let g:clang_snippets=1
let g:clang_snippets_engine="snipmate"
let g:SuperTabContextDefaultCompletionType='<c-x><c-o>'
set completeopt=menuone,menu ",longest
set pumheight=10 " Limit popup menu height
 " SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"
set cinkeys-=:
" Add highlighting on functions and classes for C++
function! EnhanceCppSyntax()
	syn match    cCustomParen    "?=(" contains=cParen,cCppParen
	syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
	syn match    cCustomScope    "::"
	syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
	"hi def link cCustomFunc Function
	hi def link cCustomClass Function
endfunction
au Syntax cpp call EnhanceCppSyntax()
au Syntax cc call EnhanceCppSyntax()
