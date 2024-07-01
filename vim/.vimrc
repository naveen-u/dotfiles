set nocompatible

set clipboard=unnamedplus


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Plugins
call plug#begin()

Plug 'morhetz/gruvbox'

call plug#end()


" Cosmetics
colorscheme gruvbox
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
