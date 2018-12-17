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
    Plug 'mhinz/vim-signify'
    Plug 'joshdick/onedark.vim'
    Plug 'jreybert/vimagit'
    
call plug#end()

" lightline color
let g:lightline = {
	\ 'colorscheme': 'one'
	\ }

"Background
    set t_Co=256
    colorscheme janah
    set background=dark

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
    set formatoptions-=cro " When creating new lines, vim won't create comments automatically
    set clipboard=unnamedplus " Makes vim use system clipboard
	set splitbelow splitright " SPlits open at the bottom and right
    set noshowmode " Needed for lightline
    set laststatus=2 " Needed for lightline
	set go+=a               " Visual selection automatically copied to the clipboard

" Mappings
    let mapleader=" "
    map <leader>md :InstantMarkdownPreview<CR>
    map <leader>d :exe ':NERDTree'<CR>
    map <leader>g :exe ':Goyo'<CR><CR>
    map <leader>p :exe ':CtrlP'<CR>
    map <leader>G :exe ':Magit'<CR>
    
    " Create lines without being in insert mode
        map <leader>o o<esc>
        map <leader>O O<esc>
    " Shortcutting split navigation, saving a keypress:
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l

" vimwiki - Personal Wiki for Vim
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 
let g:instant_markdown_autostart = 0	" disable autostart
