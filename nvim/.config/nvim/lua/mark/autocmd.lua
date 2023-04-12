-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Turn on spell check if you're in a markdown file
vim.api.nvim_create_augroup('setSpell', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
  group = 'setSpell',
  pattern = { 'md', 'markdown', 'wiki'
  },
  command = 'setlocal spell'
})

vim.api.nvim_create_augroup('wrap', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
  group = 'setSpell',
  pattern = { 'md', 'markdown', 'wiki'
  },
  command = 'set wrap'
})

vim.api.nvim_create_augroup('setcolorcolumn', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
  group = 'setcolorcolumn',
  pattern = { 'md', 'markdown', 'wiki'
  },
  command = 'set colorcolumn=""'
})
