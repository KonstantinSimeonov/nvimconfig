let PATHOGEN_PATH=fnamemodify($MYVIMRC, ':h') . "/autoload/vim-pathogen/autoload/pathogen.vim"
exec "source " . PATHOGEN_PATH
execute pathogen#infect()

set nocompatible

set history=1000
set wildmenu wildmode=longest:full,full
set ruler showcmd
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
set hlsearch incsearch magic
set noerrorbells visualbell t_vb=
set encoding=utf8
set nobackup nowritebackup noswapfile
set smartcase
set showfulltag
set scrolloff=5 sidescrolloff=5
set hidden
set number
set smartindent autoindent smarttab cindent cinoptions=g0,N-s,E-s
set autoread
set signcolumn=yes
set ts=4 sw=4 sts=4
set mouse=a

" column length
set colorcolumn=100

" fuzzy find
set path+=**

" x clipboard
set clipboard+=unnamedplus

" how to render invis chars
set list
set listchars=tab:→\ ,space:·,trail:·,extends:»

" colors
syntax enable
colorscheme panda

filetype plugin on
au BufRead,BufNewFile *.sbt set filetype=scala
au BufRead,BufNewFile *.sc set filetype=scala
au BufRead,BufNewFile *.conf set filetype=conf
au BufRead,BufNewFile *.tsx set filetype=typescriptreact syntax=typescript
au BufRead,BufNewFile sql* set filetype=sql

" tabs autoexpand
autocmd FileType * setlocal expandtab
autocmd FileType graphql,yml,scss,yaml,css,typescriptreact,typescript,javascriptreact,javascript,sbt,conf,haskell,prisma setlocal tabstop=2 softtabstop=2 shiftwidth=2

" nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-t> :NERDTreeFind<CR>
let NERDTreeShowHidden=1 " show hidden files

nmap Y y$

" terminal
let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

map <F2> :call Term_toggle(10)<CR>
tmap <F2> <C-\><C-n> :call Term_toggle(10)<CR>
tmap <ScrollWheelUp> <C-W>N<ScrollWheelUp>

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap ,rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" pls complete my stuff when I press enter OK BRO??
" also, c-y can go fuck itself, I don't want
" finger spasms
inoremap <silent><expr> <cr>
  \ coc#pum#visible()
    \ ? coc#pum#confirm()
    \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
