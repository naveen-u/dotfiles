set nocompatible

set clipboard=unnamedplus

set termguicolors

" Cosmetics
colorscheme catppuccin_mocha
set background=dark             " use colors that look good on a dark background
set lazyredraw                  " don't redraw the screen when we don't have to
set list                        " show certain non-printable characters
set listchars=tab:↹·,trail:·    " show tabs as >- instead of ^I
set number                      " display line numbers
set ruler                       " display position
set showcmd
set showmatch                   " show matching brackets/parens
set wildmenu                    " display completions above the cmdline
syntax enable
syntax on
filetype plugin on
filetype indent on


" Indendation
set expandtab
set tabstop=4      " Optional, if you want files with tabs to look the same too.
set shiftwidth=4
set softtabstop=-1 " Use value of shiftwidth
set smarttab       " Always use shiftwidth
set autoindent


" Better searching
set smartcase
set hlsearch
set incsearch

" Copy to Wayland clipboard
nnoremap <C-@> :call system("wl-copy", @")<CR>


" Auto paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
