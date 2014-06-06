" Be iMproved
set nocompatible

" Install neobundle
let s:neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(s:neobundle_readme)
    echo "Installing NeoBundle..\n"
    silent !mkdir -p ~/.vim/bundle
    silent !git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
endif
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'argtextobj.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'bling/vim-airline'
NeoBundle 'editorconfig/editorconfig-vim'

let vimproc_updcmd = has('win64') ?
      \ 'tools\\update-dll-mingw 64' : 'tools\\update-dll-mingw 32'
execute "NeoBundle 'Shougo/vimproc.vim'," . string({
      \ 'build' : {
      \     'windows' : vimproc_updcmd,
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })

NeoBundle 'ksuarz/vdb'

call neobundle#end()

NeoBundleCheck

" Various options
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
set backspace=2
set wildmenu
let mapleader = " "
set <F13>=[25~

filetype plugin on
syntax on

" Get <c-;> to work
map! <Esc>[50 <c-;>

" Swap panes
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
noremap <silent> <leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <leader>pw :call DoWindowSwap()<CR>

" Fast pane resize
noremap <silent> <leader>< 10<c-w><
noremap <silent> <leader>> 10<c-w>>
noremap <silent> <leader>+ 10<c-w>+
noremap <silent> <leader>- 10<c-w>-

" Easy movement in panes
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-l> :wincmd l<CR>

" Toggle colored line at column 80
function! ColorColumnToggle()
    if &colorcolumn
        setlocal colorcolumn=
    else
        setlocal colorcolumn=80
    endif
endfunction
noremap <expr> <leader>c ColorColumnToggle()

" Autocomplete curly braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}

" Stop my color scheme from breaking Autocomplete
highlight PmenuSel ctermbg=LightGray

" Esc to clear search
nnoremap <Esc> :let @/=''<CR>

" Do stuff inside next/previous text objects
onoremap <silent> in( :<c-u>normal! f(vi(<cr>
onoremap <silent> ip( :<c-u>normal! F)vi(<cr>
onoremap <silent> in" :<c-u>normal! f"vi"<cr>
onoremap <silent> ip" :<c-u>normal! F"vi"<cr>
onoremap <silent> in' :<c-u>normal! f'vi'<cr>
onoremap <silent> ip' :<c-u>normal! F'vi'<cr>

" Pyclewn options (it's not even installed most of the time
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
noremap <silent> <leader>mk :call TogglePyclewnKeys()<CR>

" Neocomplete options
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:EclimCompletionMethod = 'omnifunc'

" Unite options
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <leader>v <c-w>v<c-w>l
nnoremap <leader>s <c-w>s<c-w>j
nnoremap <leader>/ :Unite grep:.<cr>
nnoremap <leader>a :Unite -quick-match -auto-preview buffer<cr>

" Tagbar options
noremap <silent> <c-m> :TagbarToggle<CR>
