syntax on
set encoding=utf-8
set nobackup
set nowritebackup
set path+=**
set noshowmode
set showmatch
set lazyredraw
set laststatus=2
set updatetime=300
set number relativenumber
set cursorline
set tabstop=4 shiftwidth=4 expandtab
set ignorecase smartcase
set wildmode=longest,list,full
set colorcolumn=80
set mouse=a
set clipboard+=unnamedplus
set shortmess+=c
set termguicolors
set statusline=%1*\ %-2.3{toupper(mode())}%*
set statusline+=%2*\ %<%f%=\ %y\ %m\ [%n]\ %r\ %h\ [%l,%c]%*

let mapleader="\<Space>"
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_chgwin=1

call plug#begin('~/.config/nvim/plugged')
    Plug 'tomasr/molokai'
    Plug 'terminalnode/sway-vim-syntax'
call plug#end()

"colorscheme molokai
highlight User1 term=bold cterm=bold ctermfg=green
highlight User2 term=bold cterm=bold ctermbg=white ctermfg=black
highlight CursorLine cterm=bold
highlight Visual ctermbg=white cterm=bold
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

autocmd BufWritePost init.vim source %
autocmd BufWritePre * %s/\s\+$//e

inoremap jk <Esc>

nnoremap <Leader>e :Lex!<CR>
nnoremap <Leader>d :bn\|bd #<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>bb :buffers<CR>
nnoremap <Leader>h :split<Space>
nnoremap <Leader>v :vsplit<Space>

