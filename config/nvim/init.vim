syntax on
set encoding=utf-8
set nobackup
set nowritebackup
set path+=**
set noshowmode
set showmatch
set lazyredraw
set laststatus=2
set cmdheight=2
set updatetime=300
set number relativenumber
set cursorline cursorcolumn
set tabstop=4 shiftwidth=4 expandtab
set ignorecase smartcase
set wildmode=longest,list,full
set colorcolumn=80
set mouse=a
set clipboard+=unnamedplus
set shortmess+=c

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_chgwin=1


set statusline=%1*\ %-2.3{toupper(mode())}%*
set statusline+=%2*\ %<%f%=\ %y\ %m\ [%n]\ %r\ %h\ [%l,%c]%*

highlight User1 term=bold cterm=inverse,bold ctermfg=7
highlight User2 term=bold cterm=bold ctermbg=0 ctermfg=7

highlight CursorLine ctermbg=Black cterm=bold
highlight CursorColumn ctermbg=Black cterm=bold


autocmd BufWritePost init.vim source %
autocmd BufWritePre * %s/\s\+$//e

" Custom function for opening new files
" Opens new file inside window on the left of netrw instead of netrw window
function! CustomNetrwFileOpen()
    let fname = input('Enter filename: ')
    if exists('b:netrw_curdir')
        let curdir = b:netrw_curdir
        wincmd t
        if curdir =~ '/$'
            exe "e ".fnameescape(curdir.fname)
        else
            exe "e ".fnameescape(curdir.'/'.fname)
        endif
        unlet curdir
    endif
    unlet fname
endfunction

function! NetrwMappings()
    noremap <buffer><silent>% :call CustomNetrwFileOpen()<CR>
endfunction

augroup NetrwGroup
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END

function! ToggleNetrw()
    silent Lex!
    wincmd h
endfunction


let mapleader=' '

nnoremap <Leader>d :bn\|bd #<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>bb :buffers<CR>

nnoremap <Leader>h :split<Space>
nnoremap <Leader>v :vsplit<Space>

nnoremap <Leader>e :Lex!<CR>


call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-commentary'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'habamax/vim-godot'
    Plug 'arcticicestudio/nord-vim'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
call plug#end()

let g:material_theme_style='palenight'
set background=dark
colorscheme material

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? '\<C-p>' : '\<C-h>'
inoremap <silent><expr><C-Space> coc#refresh()
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>f  :call CocAction('format')<CR>
