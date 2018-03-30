call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'leafgarland/typescript-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajh17/Spacegray.vim'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'reasonml-editor/vim-reason-plus', {'for': 'reason'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'
Plug 'roxma/nvim-completion-manager'
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go'
Plug 'mhartington/nvim-typescript'

call plug#end()

set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set indentkeys+=O,o
set clipboard=unnamed

let mapleader = ","
let g:mapleader = ","

colorscheme spacegray
let g:spacegray_underline_search = 1
let g:airline_powerline_fonts = 1

let g:ale_linters = {
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['tsserver', 'prettier', 'tslint'],
\  'json': ['prettier', 'jsonlint'],
\  'reason': ['merlin', 'refmt', 'ols'],
\  'bash': ['shellcheck', 'shfmt']
\}
let g:ale_fixers = {
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['prettier', 'tslint'],
\  'json': ['prettier'],
\  'reason': ['refmt'],
\  'bash': ['shellcheck', 'shfmt']
\}

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
      
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  nmap <leader>j mA:Ack <space>
  nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
  nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"
endif

set wildignore+=*/.git/*,*/node_modules/*,*/build/*,*/.next/*,*/__snapshots__/*,*/flow-typed/*,*/priv/*,*/deps/*,package-lock.json,*.zip,*.png,*.jpg,*.gif,*.pdf,*DS_Store*,*/dist/*

"Keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap <leader>d dd
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>u"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ctrlp_working_path_mode = 'ra'

let g:ale_sign_column_always = 1

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

let g:LanguageClient_diagnosticsEnable = 0

" Typescript
let g:nvim_typescript#default_mappings = 1
let g:nvim_typescript#debug_enabled = 1
nnoremap <C-j> :TSDef <CR>

"Go
let g:go_fmt_command = "goimports"

