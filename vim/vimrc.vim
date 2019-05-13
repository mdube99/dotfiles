" Installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" All vim-plug plugins
call plug#begin()
    Plug 'vimwiki/vimwiki'                  " Note taking system for vim
    Plug 'plasticboy/vim-markdown'          " Gives markdown syntax
    Plug 'scrooloose/nerdtree'              " File browser
    Plug 'suan/vim-instant-markdown'        " Let's you see markdown files in browser while editing
    Plug 'tpope/vim-surround'               " change and add tags surrounding a word or sentence
    Plug 'tpope/vim-commentary'             " Allows for easy commenting with vim
    Plug 'tpope/vim-repeat'
    Plug 'kien/ctrlp.vim'                   " Fuzzy finder
    Plug 'airblade/vim-rooter'              " Sets the working directory to the root directory
    Plug 'christoomey/vim-system-copy'      " Allows vim to copy objects (such as iw) with xsel
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'romainl/vim-cool'
    Plug 'junegunn/goyo.vim'
" Ui enhancements
    Plug 'joshdick/onedark.vim'             " Theme
    Plug 'itchyny/lightline.vim'            " Theme
    Plug 'mhinz/vim-signify'                " changes at the number line
    Plug 'Yggdroot/indentline'              " Shows lines on indentation
    Plug 'PotatoesMaster/i3-vim-syntax'     " Gives i3-wm config file syntax

call plug#end()

" lightline color
let g:lightline = {
	\ 'colorscheme': 'onedark'
	\ }

"Background
    colorscheme onedark
    set background=dark

" Basics
    filetype plugin on
    if !has('g:syntax_on')|syntax enable|endif
    set number relativenumber
    set encoding=utf-8
    set tabstop=8
    set shiftwidth=4
    set expandtab
    set softtabstop=4
    set ignorecase
    set hlsearch
    set incsearch
    set clipboard=unnamedplus   
    set splitbelow splitright   
    set noshowmode              
    set laststatus=2            
    set go+=a                   
    set history=1000
    set noswapfile

" Mappings
    let mapleader=" "
    nnoremap <leader>md :InstantMarkdownPreview<CR>
    nnoremap <leader>d :exe ':NERDTree'<CR>
    nnoremap <leader>p :exe ':CtrlP'<CR>
    nnoremap <leader>g :exe ':Goyo'<CR>
" Turns off relativenumber in reviewing code with someone
    nnoremap <F1> :set norelativenumber<CR>
    nnoremap <F2> :set relativenumber<CR>

    nnoremap <leader>cc :nohlsearch<CR>:redraw!<CR>
    nnoremap <leader>ss :setlocal spell!<CR>

" Fix previous spelling error
function! FixLastSpellingError()
    normal! mm[s1z='m""'
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<CR>

" Easy replay last macro
function! ReplayLastMacro()
    try
        normal @@
    catch /E748/
        normal @q
    endtry
endfunction
nnoremap <silent> <CR> :call ReplayLastMacro()<CR>

" Enable going down in case text is wrapped
    nnoremap j gj
    nnoremap k gk

" Create lines without being in insert mode
    noremap <leader>o o<esc>
    noremap <leader>O O<esc>

" Shortcutting split navigation, saving a keypress:
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

" Markdown mappings
autocmd FileType markdown,md nnoremap <leader>1 i# 
autocmd FileType markdown,md nnoremap <leader>2 i## 
autocmd FileType markdown,md nnoremap <leader>3 i### 
autocmd FileType markdown,md nnoremap <leader>4 i#### 
autocmd FileType markdown,md nnoremap <leader>u i---<ESC>
autocmd BufRead,BufNewFile *.md :Goyo 80


" vimwiki - Personal Wiki for Vim
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" has Vimwiki use default markdown syntax, rather than vimwiki's proprietary
" usage
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:instant_markdown_autostart = 0	" disable autostart
