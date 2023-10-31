vim.keymap.del('n', '<S-h>')
vim.keymap.del('n', '<S-l>')

vim.keymap.set('n', 'z.', ':<C-u>normal! zszH<CR>', { silent = true })

function QuickFixToggle()
  if vim.tbl_isempty(vim.fn.filter(vim.fn.getwininfo(), function(_, wininfo)
    return wininfo.quickfix
  end)) then
    vim.cmd 'copen'
  else
    vim.cmd 'cclose'
  end
end

vim.keymap.set('n', '<C-q>', ':lua QuickFixToggle()<CR>')
vim.keymap.set('n', '<Tab>', '<cmd>bn<CR>')
vim.keymap.set('n', '<S-Tab>', '<cmd>bp<CR>')
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope live_grep<CR>')

local nvim_tmux_nav = require 'nvim-tmux-navigation'
vim.keymap.set('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', '<C-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', '<C-Space>', nvim_tmux_nav.NvimTmuxNavigateNext)
