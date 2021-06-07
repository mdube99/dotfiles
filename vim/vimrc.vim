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
    Plug 'tpope/vim-unimpaired'
" fuzzy finder
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
" LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
" Changes the working directory to the project root when you open a file or directory.
    Plug 'airblade/vim-rooter'
" can use 'cp' to copy objects
    Plug 'christoomey/vim-system-copy'
" disables search highlighting when you are done searching and re-enables it when you search again.
    Plug 'romainl/vim-cool'
" used for markdown to look cool
    Plug 'junegunn/goyo.vim'
" Ui enhancements
    Plug 'akinsho/nvim-bufferline.lua'
" Status line
    Plug 'hoob3rt/lualine.nvim'
" If you want to display icons, then use one of these plugins:
    Plug 'kyazdani42/nvim-web-devicons'
" Shows git changes left of number line
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'Yggdroot/indentline'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'PotatoesMaster/i3-vim-syntax'
" themes
" dracula nvim port that supports treesitter
    Plug 'Mofiqul/dracula.nvim'
" Neovim Tree sitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    Plug 'akinsho/nvim-toggleterm.lua'

    call plug#end()

" Needed for complete
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

" Required for bufferline
lua require'bufferline'.setup{}
" configs for LSP
lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }
lua require('gitsigns').setup()



" Color settings
    colorscheme dracula
" Allows transparent backgrounds in vim
    let g:dracula_colorterm = 0
    set background=dark

if (has("termguicolors"))
  set termguicolors
endif


" Basics
    filetype plugin on
    if !has('g:syntax_on')|syntax enable|endif
    set number relativenumber
    set path+=**
    set tabstop=8
    set shiftwidth=4
    set expandtab
    set softtabstop=4
    set ignorecase
    set hlsearch
    set incsearch
    set splitbelow splitright
    set noshowmode
    set hidden
    set autochdir
    set nowrap
    set wildmode=longest,list,full
    set scrolloff=8
" Disable auto commenting on new line
    set formatoptions-=cro
    " set history=1000
    set noswapfile
" Cursor line config that makes it usable on dark background
    set cursorline
    set guicursor=
    " Needed for LSP
    set completeopt=menuone,noselect

" ------------------------------------------------------- Mappings -------------------------------------------------------
    let mapleader=" "
    nnoremap <leader>md :InstantMarkdownPreview<CR>
    nnoremap <leader>g :exe ':Goyo'<CR>
" Turns off relativenumber in reviewing code with someone
    nnoremap <F1> :set number norelativenumber<CR>
    nnoremap <F2> :set number relativenumber<CR>
" Open HTML file in browser
    nnoremap <F12> :exe ':silent !brave %'<CR>
" gets rid of search or visual bugs
    nnoremap <leader>cc :nohlsearch<CR>:redraw!<CR>
" shows spelling errors
    nnoremap <leader>ss :setlocal spell!<CR>
" Open vimrc from vim
    nnoremap <leader>vim :e $MYVIMRC<CR>
    nnoremap <F5> :so $MYVIMRC<CR>
" Moving around in splits
    nnoremap <C-H> <C-W><C-H>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
" Moving through buffers
    nnoremap <TAB> :bnext<CR>
    nnoremap <S-TAB> :bprevious<CR>
" Telescope mappings
    nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
    nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
    nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
    nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
    nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
    nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
" LSP mappings
    nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
    nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
    nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
    nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
    nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
    nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
    nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
    nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
" Use tab & shift-tab to navigate through completion menu
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " opens VTerminal() HTerminal() functions for debugging scripts
    nnoremap <leader>dv :call VTerminal()<CR>
    nnoremap <leader>dh :call HTerminal()<CR>
" Use alt + hjkl to resize windows
    nnoremap <M-j>    :resize -2<CR>
    nnoremap <M-k>    :resize +2<CR>
    nnoremap <M-h>    :vertical resize -2<CR>
    nnoremap <M-l>    :vertical resize +2<CR>
" Maximize current split
    nnoremap <C-w>o :call MaximizeToggle()<CR>
" Maximize current split while in terminal mode
    tnoremap <C-w>o <C-\><C-n>:call MaximizeToggle()<CR>A
" Switch between tabs
    nnoremap <Right> gt
    nnoremap <Left>  gT
" yes
    nnoremap Y y$
" sudo
    cmap w!! w !sudo tee %
" ------------------------------------------------------- Functions -------------------------------------------------------

" Abbreviation to insert the current date when typings cdate
" useful for markdown files
    :iab cdate <c-r>=strftime("%Y-%m-%d")<CR>

" Fix previous spelling error
fun! FixLastSpellingError()
    normal! mm[s1z='m""'
endfun
nnoremap <leader>sp :call FixLastSpellingError()<CR>

" automatically trims whitespace on file save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()


" Splits for running scripts from inside neovim
fun! VTerminal()
    :vsp | :terminal
    :vertical resize 45
endfunction

fun! HTerminal()
    :split | :terminal
    :resize 5
endfunction


" Function to maximize current split
" Credit - https://vim.fandom.com/wiki/Maximize_window_and_return_to_previous_split_structure
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    let g:indentLine_enabled = 0
    let g:indent_blankline_enabled = v:false
    set noshowmode
    set noshowcmd
    set scrolloff=999
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    let g:indentLine_enabled = 1
    let g:indent_blankline_enabled = v:true
    set showmode
    set showcmd
    set scrolloff=8
endfunction
" ------------------------------------------------------- Auto Commands -------------------------------------------------------

" automatically highlight yanked text (requires neovim)
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=1000 }
    augroup END

" Goyo
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

" starts terminals in insert mode
    autocmd! TermOpen  * startinsert

" YAML file settings
    autocmd FileType yaml setlocal ts=2 ai sw=2 sts=0
" Markdown file settings
    autocmd FileType md setlocal spell!
" Java file settings
    autocmd FileType java set makeprg=javac\ %

" vimwiki - Personal Wiki for Vim
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:instant_markdown_autostart = 0	" disable autostart
" has vim-instant-markdown use the suckless browser surf for markdown viewing
let g:instant_markdown_browser = "surf"
let g:vim_markdown_folding_disabled = 1 " Disables folding for markdown files
" Goyo settings
let g:goyo_width = 140
let g:goyo_height = 50

lua <<EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true,  -- If luajit is present
}
EOF

lua <<EOF
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.3
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '2', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = false, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  }
EOF

" Lualine config
lua <<EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'dracula-nvim',
    component_separators = {'', ''},
    --section_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    --lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {'diff'}
    --lualine_z = {'hostname'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}
EOF

" Treesitter config to get highlighting working
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
