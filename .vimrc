set noerrorbells
set tabstop=4 softtabstop=4
set smartindent
set shiftwidth=4
set scrolloff=8
set number relativenumber
set noswapfile
set nowrap
set noshowmode
set laststatus=2

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
call plug#end()

let mapleader = " "
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

colorscheme gruvbox
set background=dark
set t_Co=256
hi Normal guibg=NONE ctermbg=NONE
