syntax enable
filetype indent plugin on
set number
set list
set nocompatible
set laststatus=2

set exrc
set secure

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

" Change mapleader key to easier key
let mapleader = ","
" Change between vim windows easier
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l
map <Leader>h <C-W>h

" Config for vim-plug
" https://github.com/junegunn/vim-plug
" Install vim-plug if it doesn't exist already
if empty(glob('~/.vim/autoload/plug.vim'))
   " ensure directories exist
    execute '!mkdir -p ~/.vim/autoload'
    execute '!mkdir -p ~/.vim/plugged'
    " download vim-plug
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vim/.plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'altercation/vim-colors-solarized'

Plug 'WolfgangMehner/bash-support'

Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

Plug 'vim-syntastic/syntastic'

Plug 'honza/vim-snippets'

Plug 'SirVer/ultisnips'

Plug 'sheerun/vim-polyglot'

Plug 'ervandew/supertab'

Plug 'pangloss/vim-javascript'

Plug 'davidhalter/jedi-vim'


call plug#end()

set background=dark


" Syntastic recommended settings
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']

" Open NERDTree with Ctrl-n
map <F4> :NERDTreeToggle<CR>

" Configure Ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Configure jedi
let g:jedi#use_splits_not_buffers = "top"

" Python shiftwidth, tabstop, softtabstop
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
