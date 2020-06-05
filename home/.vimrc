" Turn syntax highlighting on
syntax on
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
" Show line numbers
set number
" Show relative line numbers
set number relativenumber
" Highlight all search matches
set hlsearch
" Set 80 char line
set colorcolumn=80
" Search recursively into subfolders
set path+=**
" Tab complete for matching files
set wildmenu
" Command to delete the current buffer without modifying panes
command Bd bp|bd #
" Turn off bells
set noerrorbells
set belloff=all
set vb t_vb=
" Auto-indent
set smartindent
" Turn off line wrapping
set nowrap
" Smart case-sensitive searching
set smartcase
" Incremental search
set incsearch
" Remove netrw banner
let g:netrw_banner = 0

