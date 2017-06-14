syntax on
filetype plugin indent on
set number
set nocompatible
set clipboard=unnamed
set laststatus=2

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

Plug 'WolfgangMehner/bash-support'

Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-sensible'

Plug 'vim-syntastic/syntastic'

Plug 'honza/vim-snippets'

Plug 'SirVer/ultisnips'

Plug 'sheerun/vim-polyglot'

Plug 'ervandew/supertab'

Plug 'davidhalter/jedi-vim'

Plug 'tpope/vim-surround'

call plug#end()

" Syntastic recommended settings
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pylint']

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
