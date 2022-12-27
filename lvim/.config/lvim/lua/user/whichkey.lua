local M = {}

M.config = function()

-- unbind f key
lvim.builtin.which_key.mappings["f"] = {}
lvim.builtin.which_key.mappings["f"] = {
    name = "Telescope",
    f = { "<Cmd>Telescope find_files<CR>", "Find Files" },
    o = { "<Cmd>Telescope oldfiles<CR>", "Old Files" },
    h = { "<Cmd>Telescope command_history<CR>", "Command History" },
    p = { "<Cmd>Telescope projects<CR>", "Projects" },
    w = { "<Cmd>Telescope live_grep<CR>", "Search for Word"},
}

lvim.builtin.which_key.mappings.s.p = { ":call FixLastSpellingError()<CR>", "Fix last Spelling error" }
lvim.builtin.which_key.mappings.s.s = { ":setlocal spell!<CR>", "Turn on spell check" }
lvim.builtin.which_key.mappings["n"] = {
    name = "Number",
    n = { ":set norelativenumber!<CR>", "Toggle relativenumber" },
}

lvim.builtin.which_key.mappings["m"] = {
    name = "Markdown",
    d = { "<cmd>MarkdownPreview<CR>", "Instant Markdown Preview" },
    g = { "<cmd>Glow<cr>", "Preview Markdown Inside Vim" },
    b = { "<cmd>call BoldWord()<CR>", "Bold Word" },
    l = { "<cmd>call BoldWord()<CR>", "Bold Line" },
    m = { "<cmd>w<CR>:make<CR>", "Make" },
    -- t = { "<cmd>VimwikiTable ", "Vimwiki Table"},
    i = { "<cmd>call PasteImg()<cr>", "Paste Image"},
}

lvim.builtin.which_key.mappings["w"] = {
    name = "Windows",
    v = { "<Cmd>vsp<CR>", "Vertical Split" },
    h = { "<Cmd>split<CR>", "Horizontal Split" },
    t = { "<Cmd>tabnew<CR>", "New Tab" },
    m = { "<Cmd>FocusMaximise<CR>", "Toggle Split Maximize" },
    f = { "<Cmd>FocusToggle<CR>", "Focus Toggle" },
}

-- lvim.builtin.which_key.mappings["t"] = {
--   name = "Trouble",
--   t = { "<cmd>TroubleToggle<cr>", "trouble" },
--   w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
--   d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
--   q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
--   l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
--   r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
-- }

lvim.builtin.which_key.mappings.b.P = { "<cmd>BufferPin<CR>", "Pin Buffer" }
lvim.builtin.which_key.mappings.b.d = { "<cmd>bdelete<CR>", "Delete Buffer" }
lvim.builtin.which_key.mappings.b.t = { "<cmd>tabclose<CR>", "Close Tab" }

lvim.builtin.which_key.mappings.c = { "<cmd>Cheat<CR>", "Cheat.sh" }
-- lvim.builtin.which_key.mappings.r = {"<cmd>lua require('lvim.core.terminal')._exec_toggle('python " .. vim.fn.expand "%" .. ";read')<CR>", "Debug python"}
lvim.builtin.which_key.mappings.o = {"<cmd>SymbolsOutline<CR>", "Symbols Outline" }

-- Visual mappings
lvim.builtin.which_key.vmappings.i = {"<cmd>norm S*<cr>", "Italicize Selection" }
lvim.builtin.which_key.vmappings.b = {"<cmd>norm S*gvS*<cr>", "Bold Selection" }

end
return M
