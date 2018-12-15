


let mapleader=" "



" Installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" All vim-plug plugins
call plug#begin()
    Plug 'vimwiki/vimwiki'
    Plug 'itchyny/lightline.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'suan/vim-instant-markdown'
    Plug 'junegunn/goyo.vim'
    Plug 'Yggdroot/indentline'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'kien/ctrlp.vim'
call plug#end()

" lightline color
let g:lightline = {
	\ 'colorscheme': 'wombat'
	\ }

" Basics
    set nocompatible
    filetype plugin on
    syntax on
    set number
    set relativenumber
    set encoding=utf-8
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set softtabstop=4
    set ignorecase
    set formatoptions-=cro
"Background     |   colors
    set t_Co=256
    colorscheme janah
    set background=dark
" Needed for lightline
    set laststatus=2
    set noshowmode 

" vimwiki - Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 
" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart

" Mappings
    map <leader>md :InstantMarkdownPreview<CR>
    map <leader><DEL> :exe ':NERDTree'<CR>
    map <leader>g :exe ':Goyo'<CR><CR>
    map <leader>p :exe ':CtrlP'<CR>
