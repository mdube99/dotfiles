-- Lunarvim settings
lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "darkplus"

require("user.lualine").config()
require("user.plugins")
require("user.whichkey").config()
require("user.telescope")
require("user.keys")
require("user.options")

-- Core settings
lvim.builtin.alpha.active = true
lvim.builtin.nvimtree.active = false
lvim.builtin.lir.active = false
lvim.builtin.bufferline.active = true
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.terminal.insert_mappings = true
lvim.builtin.terminal.open_mapping = [[<C-t>]]

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
