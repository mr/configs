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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'szw/vim-tags'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'argtextobj.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'bling/vim-airline'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'Rip-Rip/clang_complete'

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
set laststatus=2
let mapleader = " "

filetype plugin on
syntax on

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

" Maximize pane in new tab (preserves splits)
nnoremap <silent> <leader>t <c-w>s<c-w>T

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
" for some reason this causes vim to start with 'c' pressed only on laptop
"nnoremap <silent> <Esc> :let @/=''<CR>

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
let g:neocomplete#force_overwrite_completefunc = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<s-TAB>"

" Neocomplete sources
if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

" Java
let g:EclimCompletionMethod = 'omnifunc'
let g:neocomplete#force_omni_input_patterns.java = '\k\.\k*'
let g:EclimLoggingDisabled = 1
let g:EclimTempFilesEnable = 0

" C++
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
"let g:clang_use_library = 1

" Unite options
let g:unite_source_history_yank_enable = 1
"let g:unite_split_rule = 'botright'
" I don't remember what this does
"let g:unite_source_file_rec_max_cache_files = 0
"call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
"            \ 'max_candidates', 0)
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <leader>ps :Unite file_rec/async -default-action=split<cr>
nnoremap <leader>pv :Unite file_rec/async -default-action=vsplit<cr>
nnoremap <leader>v <c-w>v<c-w>l
nnoremap <leader>s <c-w>s<c-w>j
nnoremap <leader>/ :Unite grep:.<cr>
nnoremap <leader>a :Unite -quick-match -auto-preview buffer<cr>

" Neosnippet options
imap <expr><CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
smap <expr><CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
