set nocompatible
let s:vundle_init=0
let s:vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(s:vundle_readme)
    echo "Installing Vundle..\n"
    silent !mkdir -p ~/.vim/bundle
    silent !git clone git://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let s:vundle_init=1
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'szw/vim-tags'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-vinegar'
Bundle 'Shougo/unite.vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'argtextobj.vim'
Bundle 'mbbill/undotree'
Bundle 'bling/vim-airline'
Bundle 'editorconfig/editorconfig-vim'

Bundle 'ksuarz/vdb'

set mouse+=a
set ttymouse=xterm2
set number
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set completeopt-=preview
let mapleader = ","
set <F13>=[25~
filetype plugin on

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

let g:pyclewn_keys_on = 0
function! TogglePyclewnKeys()
    if g:pyclewn_keys_on
        Cunmapkeys
        let g:pyclewn_keys_on = 0
    else
        Cmapkeys
        let g:pyclewn_keys_on = 1
    endif
endfunction

map <Esc>[50 <c-;>
function! ColorColumnToggle()
    if &colorcolumn
        setlocal colorcolumn=
    else
        setlocal colorcolumn=80
    endif
endfunction

map! <Esc>[50 <c-;>
noremap <silent> <leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <leader>pw :call DoWindowSwap()<CR>
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-l> :wincmd l<CR>
noremap <silent> <c-m> :TagbarToggle<CR>
noremap <silent> <leader>mk :call TogglePyclewnKeys()<CR>
noremap <silent> <leader>< 10<c-w><
noremap <silent> <leader>> 10<c-w>>
noremap <silent> <leader>+ 10<c-w>+
noremap <silent> <leader>- 10<c-w>-
noremap <silent> <leader>c :call ColorColumnToggle()<CR>
noremap <silent> <leader>u :Unite file buffer<CR>
noremap <silent> <leader>uv <c-w>v<c-w>l:Unite file buffer<CR>
noremap <silent> <leader>us <c-w>s<c-w>j:Unite file buffer<CR>
noremap <silent> <leader>e :Ex<CR>
noremap <silent> <leader>ev <c-w>v<c-w>l:Ex<CR>
noremap <silent> <leader>es <c-w>s<c-w>j:Ex<CR>
noremap <silent> <Esc> :let @/=''<CR>

onoremap <silent> in( :<c-u>normal! f(vi(<cr>
onoremap <silent> ip( :<c-u>normal! F)vi(<cr>
onoremap <silent> in" :<c-u>normal! f"vi"<cr>
onoremap <silent> ip" :<c-u>normal! F"vi"<cr>
onoremap <silent> in' :<c-u>normal! f'vi'<cr>
onoremap <silent> ip' :<c-u>normal! F'vi'<cr>

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap <c-H>  <Left>
inoremap <c-J>  <Down>
inoremap <c-K>  <Up>
inoremap <c-L>  <Right>

syntax on
highlight PmenuSel ctermbg=LightGray
