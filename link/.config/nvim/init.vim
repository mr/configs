set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim/
set runtimepath+=~/.fzf

call dein#load_state('~/.cache/dein/')

call dein#begin('~/.cache/dein')
call dein#add('Shougo/deoplete.nvim')
call dein#add('airblade/vim-gitgutter')
call dein#add('altercation/vim-colors-solarized')
call dein#add('vim-airline/vim-airline')
call dein#add('godlygeek/tabular')
call dein#add('mbbill/undotree')
call dein#add('tomasr/molokai')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('sebastianmarkow/deoplete-rust')
call dein#add('rust-lang/rust.vim')
call dein#add('kaicataldo/material.vim')
call dein#add('hzchirs/vim-material')
call dein#add('junegunn/fzf.vim')
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
call dein#add('neovimhaskell/haskell-vim')
call dein#add('ntpeters/vim-better-whitespace')

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
set list lcs=eol:¬,space:.,
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
nnoremap <silent> <leader>t <c-w>s<c-w>T

" Toggle paste
nnoremap <silent> <leader>p :set paste!<CR>

" Insert a single character in normal mode
nnoremap <silent> <leader>s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <silent> <leader>S :exec "normal a".nr2char(getchar())."\e"<CR>

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
"highlight PmenuSel ctermbg=LightGray

" Esc to clear search
nnoremap <silent> <leader><leader> :let @/=''<cr>

" Deoplete options
" Don't enable with CoC
let g:deoplete#enable_at_startup=0

" CoC
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>qc  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-r> <Plug>(coc-range-select)
xmap <silent> <C-r> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Rust
let g:deoplete#sources#rust#racer_binary='/home/megan/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/megan/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" fzf
nnoremap <C-p> :FZF<cr>
nnoremap <leader>/ :Rg
nnoremap <leader>b :Buffers<cr>

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
