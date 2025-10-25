let PATHOGEN_PATH=fnamemodify($MYVIMRC, ':h') . "/autoload/vim-pathogen/autoload/pathogen.vim"
exec "source " . PATHOGEN_PATH
execute pathogen#infect()

set spell
set history=1000
set wildmenu wildmode=longest:full,full
set showcmd
set backspace=indent,eol,start
set hlsearch incsearch magic smartcase
set nobackup nowritebackup noswapfile
set scrolloff=5 sidescrolloff=5
set hidden
set number
set smartindent autoindent smarttab
set autoread
set signcolumn=yes
set mouse=a
set updatetime=300
colorscheme badwolf

" vertical line at 100 chars
set colorcolumn=100

" fuzzy find
set path+=**

" x clipboard
set clipboard+=unnamedplus

" how to render invis chars
set list
set listchars=tab:→\ ,space:·,trail:·,extends:»

filetype plugin on
au BufRead,BufNewFile *.tsx set filetype=typescriptreact syntax=typescript
au BufRead,BufNewFile *.ts*.snap set filetype=typescriptreact
au BufRead,BufNewFile sql* set filetype=sql
au BufRead,BufNewFile Dockerfile* set filetype=dockerfile

" tabs autoexpand
autocmd FileType * setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

" nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-t> :NERDTreeFind<CR>
let NERDTreeShowHidden=1 " show hidden files

nmap Y y$
" don't copy into register when deleting with d
xnoremap p "_dP

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap ,rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>

" pls complete my stuff when I press enter OK BRO??
" also, c-y can go fuck itself, I don't want
" finger spasms
inoremap <silent><expr> <cr>
  \ coc#pum#visible()
    \ ? coc#pum#confirm()
    \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
