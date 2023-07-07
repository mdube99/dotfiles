vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { silent = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })
vim.keymap.set("n", "J", "mzJ`z", { silent = true })
vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-TAB>", "<cmd>bprev<CR>", { silent = true })

-- back space to switch to alternative buffer with the cursor in the last position it was in the fil,
vim.keymap.set("n", "<bs>", "<bs> <c-^>`”zz")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", { desc = "move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", { desc = "move highlighted text up" })

-- switch to previous buffer
vim.keymap.set("n", "<BS>", ":b#<CR>", { silent = true })

-- align horizontally. super useful if your code lines are long
vim.keymap.set({ 'n', 'n' }, 'z.', ':<C-u>normal! zszH<CR>', { silent = true })

function QuickFixToggle()
  if vim.tbl_isempty(vim.fn.filter(vim.fn.getwininfo(), function(_, wininfo) return wininfo.quickfix end)) then
    vim.cmd('copen')
  else
    vim.cmd('cclose')
  end
end

vim.keymap.set("n", "<C-q>", ":lua QuickFixToggle()<CR>")

function FixLastSpellingError()
  vim.cmd("normal! mm[s1z='m\"\"'")
end

-- vim.api.nvim_set_keymap('n', '<leader>mm', ':lua FixLastSpellingError()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mm', ':lua FixLastSpellingError()<CR>', { silent = true })


