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
set wildignore+=*.o,**/build/**,**/__pycache__/**,**/venv/**,**/env/**
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

" Plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Coc Configuration
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :vsplit<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
