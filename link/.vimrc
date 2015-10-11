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
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'argtextobj.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'dag/vim2hs'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kana/vim-submode'
NeoBundle 'keith/tmux.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'szw/vim-tags'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsukkee/unite-tag'

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

call neobundle#end()

NeoBundleCheck

" Various options
set mouse+=a
set ttymouse=xterm2
set number
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set completeopt-=preview
set backspace=2
set wildmenu
set laststatus=2
set smartcase
set ignorecase
set previewheight=30
set nofoldenable
set foldcolumn=1
set cursorline
set list lcs=eol:¬,
set showmatch
let mapleader = " "

" Colorscheme
let g:solarized_termcolors=256
colorscheme molokai
let g:rehash256 = 1

" Filetype autocommands
augroup filetype_xml
    autocmd!
    autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup filetype_yaml
    autocmd!
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

filetype plugin indent on
syntax on

" Get help under word
function! GetHelp()
    execute "normal! :h " . expand("<cword>") . "\<cr>"
endfunction
nnoremap <leader>h :call GetHelp()<cr>

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

nnoremap <silent> <c-Tab> :bnext<CR>
nnoremap <silent> <c-s-Tab> :bprevious<CR>

" Maximize pane in new tab (preserves splits)
nnoremap <silent> <leader>f <c-w>s<c-w>T

" Toggle colored line at column 80
function! ColorColumnToggle()
    if &colorcolumn
        setlocal colorcolumn=
    else
        setlocal colorcolumn=80
    endif
endfunction
noremap <expr> <leader>c ColorColumnToggle()

" x to toggle a crosshairs
nnoremap <leader>x :set cursorcolumn!<cr>

" Autocomplete various braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap []     []

inoremap "      ""<Left>
inoremap ""     ""

" Stop my color scheme from breaking Autocomplete
highlight PmenuSel ctermbg=LightGray

" Esc to clear search
" for some reason this causes vim to start with 'c' pressed only on laptop
"nnoremap <silent> <Esc> :let @/=''<CR>
nnoremap <silent> <leader><leader> :let @/=''<cr>

" Do stuff inside next/previous text objects
onoremap <silent> in( :<c-u>normal! f(vi(<cr>
onoremap <silent> ip( :<c-u>normal! F)vi(<cr>
onoremap <silent> in" :<c-u>normal! f"vi"<cr>
onoremap <silent> ip" :<c-u>normal! F"vi"<cr>
onoremap <silent> in' :<c-u>normal! f'vi'<cr>
onoremap <silent> ip' :<c-u>normal! F'vi'<cr>

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

" Python
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configurations = 0
let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" Java
let g:EclimCompletionMethod = 'omnifunc'
let g:neocomplete#force_omni_input_patterns.java =
	\ '\%(\h\w*\|)\)\.\w*'
let g:EclimLoggingDisabled = 1
let g:EclimTempFilesEnable = 0
nnoremap <silent> <leader>o :JavaImportOrganize<cr>

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

" Haskell
let g:necoghc_enable_detailed_browse = 1
let g:haskell_conceal_enumerations = 0
let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_where = 4
let g:haskell_indent_do = 4
let g:haskell_indent_in = 0

augroup filetype_haskell
    autocmd!
    autocmd FileType haskell let g:vim_tags_project_tags_command = "hasktags --ignore-close-implementation --ctags ."
    autocmd FileType haskell setlocal formatprg=pointfree\ --stdin
augroup END

set noshowmode
let g:submode_timeout = 0
call submode#enter_with('haskell', 'n', '', '<leader>h')
call submode#map('haskell', 'n', '', 't', ':GhcModType<cr>')
call submode#map('haskell', 'n', '', 'c', ':GhcModTypeClear<cr>')
call submode#map('haskell', 'n', '', 's', ':GhcModCheck<cr>')

" Unite options
"
" This function sets ag's case based on smartcase setting
" g:unite_source_grep_default_opts must be set again after changing
" smartcase or ignorecase :(
function! AgCase()
    if &g:smartcase && &g:ignorecase
        return '--smart-case '
    elseif &g:ignorecase
        return '--ignore-case '
    else
        return ''
    endif
endfunction
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ AgCase() . '--line-numbers --nocolor --nogroup --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
endif
let g:unite_source_history_yank_enable = 1
function! UniteCword(source)
    execute "normal! :Unite " . a:source . " -input=" . expand("<cword>") . "\<cr>"
endfunction
function! GoCword()
    execute "normal! :tag " . expand("<cword>") . "\<cr>"
endfunction
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <leader>/ :Unite grep:.<cr>
nnoremap <leader>a :Unite -start-insert buffer<cr>
nnoremap <leader>t :Unite tag<cr>
nnoremap <leader>wt :call UniteCword("tag")<cr>
nnoremap <leader>wf :call UniteCword("file_rec/async")<cr>
nnoremap <silent> gt :call GoCword()<cr>

" Neosnippet options
"imap <expr><CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
"smap <expr><CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"

" Fugitive settings
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gp :Git push origin master<cr>

" Tabular settings
nnoremap <leader>ae :Tabularize /=<cr>
nnoremap <leader>ac :Tabularize /:<cr>
nnoremap <leader>at :Tabularize /::<cr>
nnoremap <leader>aa :Tabularize /-><cr>

" Syntastic settings
if isdirectory('venv')
    let g:syntastic_python_python_exec = 'venv/bin/python'
endif
let g:syntastic_python_checkers = ['python', 'flake8', 'pyflakes']

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

" indentLine settings
" This stuff needs to be darker and work with cursorline
let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceEnabled = 1

let g:gitgutter_map_keys = 0

"set background=light
