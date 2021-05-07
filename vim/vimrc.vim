if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" All vim-plug plugins
call plug#begin()
" Markdown / notetaking tools 
    Plug 'vimwiki/vimwiki'
    Plug 'suan/vim-instant-markdown'
" tpope
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'             
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
" fuzzy finder
    Plug 'kien/ctrlp.vim'                   
    Plug 'dense-analysis/ale'
    Plug 'airblade/vim-rooter'              
    Plug 'christoomey/vim-system-copy'      
    Plug 'romainl/vim-cool'
    Plug 'junegunn/goyo.vim'
" Ui enhancements
    Plug 'vim-airline/vim-airline'
    Plug 'mhinz/vim-signify'
    Plug 'Yggdroot/indentline'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'joshdick/onedark.vim'
    Plug 'drewtempelmeyer/palenight.vim'



call plug#end()

"Background
    colorscheme palenight
    set background=dark

if (has("termguicolors"))
  set termguicolors
endif

" Basics
    filetype plugin on
    if !has('g:syntax_on')|syntax enable|endif
    set number relativenumber
    " set encoding=utf-8
    set tabstop=8
    set shiftwidth=4
    set expandtab
    set softtabstop=4
    set ignorecase
    set hlsearch
    set incsearch
    set splitbelow splitright
    set noshowmode
    " set history=1000
    set noswapfile
    set cursorline

" Mappings
    let mapleader=" "
    nnoremap <leader>md :InstantMarkdownPreview<CR>
    nnoremap <leader>p :exe ':CtrlP'<CR>
    nnoremap <leader>g :exe ':Goyo'<CR>
    nnoremap <leader>gc :exe ':Gcommit'<CR>
    nnoremap <leader>gd :exe ':Gdiff'<CR>
    nnoremap <leader>gs :exe ':Gstatus'<CR>
" Turns off relativenumber in reviewing code with someone
    nnoremap <F1> :set number norelativenumber<CR>
    nnoremap <F2> :set number relativenumber<CR>
    nnoremap <F3> :set norelativenumber nonumber<CR>
" Open HTML file in browser
    nnoremap <F12> :exe ':silent !brave %'<CR>
" gets rid of search or visual bugs
    nnoremap <leader>cc :nohlsearch<CR>:redraw!<CR>
" shows spelling errors
    nnoremap <leader>ss :setlocal spell!<CR>
" new line without going into insert mode
    nnoremap <leader>o o<esc>
    nnoremap <leader>O O<esc>
" Enable going down in case text is wrapped
    nnoremap j gj
    nnoremap k gk
" Open vimrc from vim
    nnoremap <leader>vim mV:vsplit $MYVIMRC<CR>

" Moving around in splits
    nnoremap <C-H> <C-W><C-H>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>


" Display absolute numbers when we lose focus
    autocmd FocusLost * :set norelativenumber
" "Display relative numbers when we gain focus
    autocmd FocusGained * :set relativenumber
" Display absolute numbers in insert mode
    autocmd InsertEnter * :set norelativenumber
" Display relative numbers when we leave insert mode
    autocmd InsertLeave * :set relativenumber

" Abbreviation to insert the current date when typings "cdate"
" useful for markdown files
    :iab cdate <c-r>=strftime("%Y-%m-%d")<CR>

" Fix previous spelling error
function! FixLastSpellingError()
    normal! mm[s1z='m""'
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<CR>

" Easy replay last macro by pressing enter
function! ReplayLastMacro()
    try
        normal @@
    catch /E748/
        normal @q
    endtry
endfunction
nnoremap <silent> <CR> :call ReplayLastMacro()<CR>

" Update vimrc from another file
    nnoremap <F5> :so $MYVIMRC<CR>

" Airline theme
let g:airline_theme = "palenight"

" YAML file settings
autocmd FileType yaml setlocal ts=2 ai sw=2 sts=0

" vimwiki - Personal Wiki for Vim
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:instant_markdown_autostart = 0	" disable autostart
" has vim-instant-markdown use the suckless browser surf for markdown viewing
let g:instant_markdown_browser = "surf"
let g:vim_markdown_folding_disabled = 1 " Disables folding for markdown files
