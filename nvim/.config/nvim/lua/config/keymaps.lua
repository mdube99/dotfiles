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
