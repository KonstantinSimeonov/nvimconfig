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
colorscheme badwolf

filetype plugin on

" tabs autoexpand
autocmd FileType haskell setlocal expandtab

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " show hidden files

" autocomplete
inoremap <C-space> <C-n>

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
