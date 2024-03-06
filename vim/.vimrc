" Turn syntax highlighting on
syntax on
colorscheme noctu
" # of spaces when tab is entered
set tabstop=4 softtabstop=4
" Replace tabs with spaces
set expandtab
" # of spaces for indentation
set shiftwidth=4
" Show matching brackets
set showmatch
" Always show location in file
set ruler
" Speed up scrolling
set ttyfast
" Reduce time after entering certain commands
set timeoutlen=1000
set ttimeoutlen=5
" Show line numbers
set number
" Show relative line numbers
set number relativenumber
" Highlight all search matches
set hlsearch
" Set 80 char line
set colorcolumn=81
" Search recursively into subfolders
set path+=**
" Tab complete for matching files
set wildmenu
" Ignore files/directories when greping and finding
set wildignore+=*.o,**/__pycache__/**,**/venv/**,**/env/**
" Command to delete the current buffer without modifying panes
command! Bd bp|bd #
" Turn off bells
set noerrorbells
set belloff=all
set vb t_vb=
" Auto-indent
set smartindent
" Turn off line wrapping
set nowrap
" Smart case-sensitive searching
set ignorecase
set smartcase
" Incremental search
set incsearch
" Remove netrw banner
let g:netrw_banner = 0
" Load .vimrc from current directory (if there is one)
set exrc
" Allow backspace
set backspace=indent,eol,start
" Auto-reload file from disk if unmodified
set autoread
" Allow the usual <C-w> window movement in terminal mode
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
" Disable warning on existing swap file (A)
" Disable <ENTER> prompt for quickfix navigation
set shortmess=AO
" Auto-copy to clipboard when yanking to the + register
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | OSCYankReg + | endif
" Open splits below and to the right
set splitbelow
set splitright
" Auto-reload file if it is changed
set autoread
" Auto-reload on window focus
au FocusGained,BufEnter * :checktime

" Plugins
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'ojroques/vim-oscyank'
Plug 'neovim/nvim-lspconfig'
call plug#end()

set shellpipe=\|\ tee
" Command to fold lines at 80 characters
command! -range=% Fold <line1>,<line2>!tr '\n' ' ' | sed 's/ \{2,\}/ /g' | fold -s
command Changed :cex system('changedfiles')
