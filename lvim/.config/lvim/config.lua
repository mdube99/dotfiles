-- Neovim settings
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.timeoutlen = 100
vim.opt.mouse = ""
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.inccommand = "split" -- shows small split at the bottom of the screen when searching
vim.opt.foldlevel = 4
vim.opt.colorcolumn="80"

-- Lunarvim settings
lvim.format_on_save = false
lvim.lint_on_save = false
-- lvim.colorscheme = "tokyonight-night"
lvim.colorscheme = "darkplus"

require("user.lualine").config()
require("user.plugins")
require("user.whichkey").config()
require("user.telescope")

-- Core settings
lvim.builtin.alpha.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.terminal.insert_mappings = true
lvim.builtin.terminal.open_mapping = [[<C-t>]]
--
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.treesitter.incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
}
lvim.builtin.treesitter.textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
}
lvim.builtin.treesitter.textsubjects = {
    textsubjects = {
        enable = true,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
        }
    },
}


vim.g.vim_markdown_folding_disabled = true

-- keymappings
lvim.leader = "space"

lvim.keys.normal_mode["<S-l>"] = nil
lvim.keys.normal_mode["<S-h>"] = nil
lvim.keys.normal_mode["<esc>"] = "<cmd>nohlsearch<cr>"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["<F1>"] = "<Nop>"
lvim.keys.normal_mode["<TAB>"] = "<cmd>bnext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = "<cmd>bprev<CR>"
-- back space to switch to alternative buffer with the cursor in the last position it was in the file
lvim.keys.normal_mode["<bs>"] = "<bs> <c-^>`”zz"
lvim.keys.normal_mode["gv"] = "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>"
lvim.keys.normal_mode["gA"] = "<cmd>lua vim.lsp.codelens.run()<cr>"
-- repeat macros with .
vim.api.nvim_set_keymap("x", ".", ":normal .<CR>", { silent = true })


lvim.keys.insert_mode[","] = ",<C-g>u"
lvim.keys.insert_mode["."] = ".<C-g>u"
lvim.keys.insert_mode["!"] = "!<C-g>u"
lvim.keys.insert_mode["?"] = "?<C-g>u"

-- Additional Plugins

lvim.autocommands = {
    {
        "BufEnter", -- see `:h autocmd-events`
        { -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
            pattern = { "*.tex", "*.yaml", "*.json", "*.html", "*.php" }, -- see `:h autocmd-events`
            command = "setlocal ts=2 ai sw=2 sts=2",
        }
}


}

vim.cmd [[
    nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
    nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
    vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

    function! BoldWord()
        normal ysiw*w.*
    endfunction

    function! FixLastSpellingError()
        normal! mm[s1z='m""'
    endfunction

    function! ExecuteMacroOverVisualRange()
      echo "@".getcmdline()
      execute ":'<,'>normal @".nr2char(getchar())
    endfunction
    xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

    let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

]]
