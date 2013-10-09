set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'szw/vim-tags'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
let g:session_autoload = 'no'
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
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap <c-H>  <Left>
inoremap <c-J>  <Down>
inoremap <c-K>  <Up>
inoremap <c-L>  <Right>
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

function! DebugC()
    :!make debug
endfunction

let g:pyclewn_keys_on = 0
function! TogglePyclewnKeys()
    if g:pyclewn_keys_on
        :Cunmapkeys
        let g:pyclewn_keys_on = 0
    else
        :Cmapkeys
        let g:pyclewn_keys_on = 1
    endif
endfunction

"function! SaveSession()
"    if !isdirectory(".git")
"        :mksession! .git/vim-session.vpj
"    endif
"endfunction

map <Esc>[50 <c-;>
map! <Esc>[50 <c-;>
nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <silent> <c-m> :TagbarToggle<CR>
nmap <silent> <leader>mk :call TogglePyclewnKeys()<CR>
nmap <silent> <leader>< 10<c-w><
nmap <silent> <leader>> 10<c-w>>
nmap <silent> <leader>+ 10<c-w>+
nmap <silent> <leader>- 10<c-w>-
nmap <silent> <Esc> :let @/=''<CR>
"nmap <silent> <leader>s :call SaveSession()<CR>

syntax on

"if filereadable(".git/vim-session.vpj")
"    :source .git/vim-seesion.vpj
"endif
