" Installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" All vim-plug plugins
call plug#begin()
    Plug 'vimwiki/vimwiki'                 " Gives markdown syntax
    Plug 'plasticboy/vim-markdown'
    Plug 'scrooloose/nerdtree'             " File browser
    Plug 'suan/vim-instant-markdown'       " Let's you see markdown files in browser while editing
    Plug 'tpope/vim-surround'              " Makes it easy to change and add tags surrounding a word or sentence
    Plug 'tpope/vim-commentary'            " Allows for easy commenting with vim
    Plug 'kien/ctrlp.vim'                  " Fuzzy finder
    Plug 'jreybert/vimagit'                " Allows for committing and adding files with git
    Plug 'airblade/vim-rooter'             " Sets the working directory to the root directory
" Ui enhancements
    Plug 'arcticicestudio/nord-vim'        " Theme
    Plug 'joshdick/onedark.vim'            " Theme
    Plug 'junegunn/goyo.vim'               " Allows for easy reading when using vim
    Plug 'itchyny/lightline.vim'           " Theme
    Plug 'mhinz/vim-signify'               " changes at the number line
    Plug 'Yggdroot/indentline'             " Shows lines on indentation
    Plug 'PotatoesMaster/i3-vim-syntax'    " Gives i3-wm config file syntax

call plug#end()

" lightline color
let g:lightline = {
	\ 'colorscheme': 'onedark'
	\ }

"Background
    set t_Co=256
    colorscheme onedark
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
    set hlsearch
    set incsearch
    set formatoptions-=cro      
    set clipboard=unnamedplus   
	set splitbelow splitright   
    set noshowmode              
    set laststatus=2            
	set go+=a                   

    set history=1000
    set noswapfile

" Mappings
    let mapleader=" "
    map <leader>md :InstantMarkdownPreview<CR>
    map <leader>d :exe ':NERDTree'<CR>
    map <leader>g :exe ':Goyo'<CR><CR>
    map <leader>p :exe ':CtrlP'<CR>
    map <leader>G :exe ':Magit'<CR>

    nnoremap <leader>cc :nohlsearch<CR>:redraw!<CR>
    nnoremap <leader>ss :setlocal spell!<CR>

    nmap <leader><tab> :e ~/vimwiki/index.md<CR>

" Enable going down in case text is wrapped
    nnoremap j gj
    nnoremap k gk

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
" has Vimwiki use default markdown syntax, rather than vimwiki's proprietary
" usage
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:instant_markdown_autostart = 0	" disable autostart
