syntax on
filetype plugin indent on
set number
set nocompatible

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

Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-surround'

call plug#end()

