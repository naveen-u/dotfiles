set nocompatible

" Cosmetics

set background=dark             " use colors that look good on a dark background
set lazyredraw                  " don't redraw the screen when we don't have to
set list                        " show certain non-printable characters
set listchars=tab:↹·,trail:·    " show tabs as >- instead of ^I
set number                      " display line numbers
set ruler                       " display position
set showcmd
set showmatch                   " show matching brackets/parens
set wildmenu                    " display completions above the cmdline
colorscheme ron
syntax enable


" Better searching

set smartcase
set hlsearch
set incsearch
