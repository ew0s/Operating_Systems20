call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
call plug#end()

"colorschemes
colorscheme gruvbox
set background=dark

set number
syntax on
set incsearch
set hlsearch
set ignorecase
set smartcase
set termencoding=utf8
set nocompatible
set ruler
set showcmd
set foldenable
set foldlevel=100
set foldmethod=indent
set mouse=a
set mousemodel=popup
set hidden
set ch=1
set autoindent
set nowrap
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set showmatch
set history=200
set wildmenu


"mapping
map <C-n> :NERDTreeToggle<CR>
