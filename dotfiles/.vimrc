call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set expandtab
set shiftwidth=2
set softtabstop=2
