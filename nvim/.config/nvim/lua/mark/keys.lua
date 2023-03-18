vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { silent = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })
vim.keymap.set("n", "J", "mzJ`z", { silent = true })
vim.keymap.set("n", "<F1>", "<Nop>", { silent = true })
vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-TAB>", "<cmd>bprev<CR>", { silent = true })
-- -- back space to switch to alternative buffer with the cursor in the last position it was in the fil,
vim.keymap.set("n", "<bs>", "<bs> <c-^>`”zz")
vim.api.nvim_set_keymap('n', '<leader>mm', ':lua FixLastSpellingError()<CR>', { noremap = true, silent = true })

-- repeat macros with
vim.keymap.set("x", ".", ":normal .<CR>")

vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", "!", "!<C-g>u")
vim.keymap.set("i", "?", "?<C-g>u")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- greatest remap ever,
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHalan,
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[q", ":cprev<CR>")
vim.keymap.set("n", "<C-q>", ":call QuickFixToggle()<CR>")
