set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim/
set runtimepath+=~/.fzf

call dein#load_state('~/.cache/dein/')

call dein#begin('~/.cache/dein')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('neomake/neomake')
call dein#add('arakashic/chromatica.nvim')
call dein#add('airblade/vim-gitgutter')
call dein#add('altercation/vim-colors-solarized')
call dein#add('vim-airline/vim-airline')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('godlygeek/tabular')
call dein#add('mbbill/undotree')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('szw/vim-tags')
call dein#add('tomasr/molokai')
call dein#add('tpope/vim-abolish')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('sebastianmarkow/deoplete-rust')
call dein#add('rust-lang/rust.vim')
call dein#add('kaicataldo/material.vim')
call dein#add('hzchirs/vim-material')

call dein#end()
call dein#save_state()

" Various options
set mouse+=a
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
let g:material_terminal_italics = 1
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
if (has('termguicolors'))
  set termguicolors
endif
" 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
let g:material_theme_style = 'palenight'
let g:material_style='palenight'
"colorscheme material
set background=dark
colorscheme vim-material
" let g:rehash256 = 1

" Neomake configuration.
augroup my_neomake_cmds
    autocmd!
    autocmd BufWritePost * Neomake
    " Have neomake run cargo when Rust files are saved.
    autocmd BufWritePost *.rs Neomake! cargo
augroup END

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
noremap <silent> <leader>mp :call DoWindowSwap()<CR>

" Fast pane resize
noremap <silent> <leader>< 10<c-w><
noremap <silent> <leader>> 10<c-w>>
noremap <silent> <leader>+ 10<c-w>+
noremap <silent> <leader>- 10<c-w>-

nnoremap <silent> <c-Tab> :bnext<CR>
nnoremap <silent> <c-s-Tab> :bprevious<CR>

" Maximize pane in new tab (preserves splits)
nnoremap <silent> <leader>f <c-w>s<c-w>T

" Toggle paste
nnoremap <silent> <leader>p :set paste!<CR>

" Insert a single character in normal mode
nnoremap <silent> s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <silent> S :exec "normal a".nr2char(getchar())."\e"<CR>

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

" Stop my color scheme from breaking Autocomplete
highlight PmenuSel ctermbg=LightGray

" Esc to clear search
nnoremap <silent> <leader><leader> :let @/=''<cr>

" Do stuff inside next/previous text objects
onoremap <silent> in( :<c-u>normal! f(vi(<cr>
onoremap <silent> ip( :<c-u>normal! F)vi(<cr>
onoremap <silent> in" :<c-u>normal! f"vi"<cr>
onoremap <silent> ip" :<c-u>normal! F"vi"<cr>
onoremap <silent> in' :<c-u>normal! f'vi'<cr>
onoremap <silent> ip' :<c-u>normal! F'vi'<cr>

" Deoplete options
let g:deoplete#enable_at_startup=1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Rust
let g:deoplete#sources#rust#racer_binary='/home/megan/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/megan/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" Denite options
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

nnoremap <C-p> :FZF<cr>

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

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
let g:airline_theme = 'material'

let g:gitgutter_map_keys = 0

call neomake#configure#automake('nrwi', 500)

"set background=light
