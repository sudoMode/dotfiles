" Shortcuts:
" ,+r     => Reload vimrc
" ,+sc    => Toggle spellcheck
" ,+<Tab> => Open new tab
" ,+w/,+q => Tab next/previous
" ,+qq    => Close tab
" ,+qo    => Close other tabs
" ,+ws    => Trim trailing white spaces
" < & >   => Undo & Redo

" ***************** Set Options ******************* "
" Turn flashes off
set belloff=all

" nmap leader key to ','
let mapleader=','

" Source vimrc
nmap <leader>r :source $MYVIMRC<CR>

" Set Vim apart from Vi
set nocompatible

" Detect files changes
set autoread

" Enable copy to system clipboard
set clipboard=unnamed

" Tab settings for insert mode
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab           " Expand tabs into white spaces
set shiftround          " Round indent to a mulitple of shiftwidth
set smarttab
set autoindent

" View  configs
syntax enable
colorscheme slate
set background=dark
set ruler
set number
set relativenumber
set laststatus=2
set encoding=utf8
set cursorline
set cursorcolumn
set cmdheight=3

" Type within 90 columns
set textwidth=90
set colorcolumn=+1

" Backspace config
set backspace=start,eol,indent

" Search inside sub directories
set path+=**

" Find all files name using tab
set wildmenu

" Code wrapping
" Folds as per the indentation
" set foldmethod=syntax
" set foldnestmax=10
" set foldlevel=1
" set nofoldenable

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <silent> <leader>z :nohlsearch<CR>

" Highlight matching braces
set showmatch

" Status line setup
set statusline=
set statusline+=\ %p%%
set statusline+=\ <<
set statusline+=\ %f\ %*
set statusline+=\ >>
set statusline+=\ %F
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorLine#
set statusline+=\ %y
set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\ [%{&ff}]
set statusline+=\ L:
set statusline+=\%l
set statusline+=\|
set statusline+=\C:
set statusline+=\%c
" set statusline+=\ [%b][0x%B]           " Get ASCII & Byte Code for char under cursor

" *************** Browsing ************************************** "
let g:netrw_browse_split=3

" **************************************************************** "

" ************************ Key Bindings ************************** "
" Spell check toggle
nmap <silent> <leader>sc :setlocal spell! spelllang=en_us<CR>

" Split panes
nmap <silent> <leader>\ :vsp<CR>
nmap <silent> <leader>- :sp<CR>

" Disable arrows keys
nmap <UP> <Nop>
nmap <DOWN> <Nop>
nmap <LEFT> <Nop>
nmap <RIGHT> <Nop>

" Tab settings
" Open new tab
nmap <leader><Tab> :tabnew

" Navigate through tabs
nmap <silent> <leader>w :tabnext<CR>
nmap <silent> <leader>q :tabprevious<CR>

" Close current tab
nmap <leader>qq :tabc<CR>

" Close other tabs
nmap <leader>qo :tabo<CR>

" Select all with sa
nmap <leader>sa ggVG

" Use Ctrl+<h|j|k|l> to move arounds panes
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l

" Use < & > to Undo & Redo
nmap u <Nop>
nmap <C-r> <Nop>
nmap <silent> < :u<CR>
nmap <silent> > :red<CR>

" :w & :W means the same thing
cnoremap W w
cnoremap Q q

" Chilled out navigation
noremap h <BS>
noremap l <Space>
noremap <C-h> ^
noremap <C-l> $

" Easy indent
vnoremap > >gv
vnoremap < <gv

" Resize panes
nmap <leader>b :execute "res +5"<CR>
nmap <leader>n :execute "res -5"<CR>
nmap <leader>v :execute "vertical res -10"<CR>
nmap <leader>m :execute "vertical res +10"<CR>

" ******************************************* "

" ************ Highlight Stuff ************** "
" Highlight cursorline number
hi CursorLineNr ctermbg=88 ctermfg=15

" High NumberLine
hi LineNr ctermbg=236 ctermfg=139

" Highlight CursorLine
hi CursorLine ctermbg=235 ctermfg=153

" Highlight WildMenu
hi WildMenu ctermbg=117 ctermfg=232

" Highlight CursorColumn
hi CursorColumn ctermbg=237 ctermfg=9

" Highlight Search options
hi IncSearch ctermbg=14 ctermfg=15
hi Search ctermbg=159 ctermfg=232

" Highlight VSP
hi VertSplit ctermbg=1 ctermfg=238

" Highlight Visual Selection
hi Visual ctermbg=232 ctermfg=245

" Colorize auto completion menu
hi Pmenu ctermbg=16 ctermfg=6
hi PmenuSel ctermbg=12 ctermfg=11
hi PmenuThumb ctermfg=88

" Highlight spelling errors
hi SpellBad ctermbg=1 ctermfg=232

" Highlight ColorColumn
hi ColorColumn ctermbg=17

" Highlight trailing white spaces
hi InvisibleSpaces ctermfg=88 ctermbg=245
call matchadd('InvisibleSpaces', '\s\+$')

" ******************************************* "

" Switch to line curor in insert mode
let &t_SI="\033[5 q"
" Switch back to block cursor
let &t_EI="\033[1 q"

" Create tag file
command! Tags !ctags -R .
command! SpecialKeys digraphs

" Source plugin initializer
source ~/.vim/plugins/.init.vim
" ******************************************* "
