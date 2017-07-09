call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'ajh17/Spacegray.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start

set softtabstop=0 noexpandtab 
set shiftwidth=2
set softtabstop=2
set number
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

let g:airline_theme='simple'
colorscheme spacegray
